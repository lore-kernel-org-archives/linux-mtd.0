Received: from patan.sun.com ([192.18.98.43])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Mz91-0002Wh-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2001 22:46:11 +0100
Received: from hsmtv32a.SFBay.Sun.COM ([129.145.122.36])
	by patan.sun.com (8.9.3+Sun/8.9.3) with ESMTP id PAA28995
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2001 15:51:51 -0600 (MDT)
Received: from sun.com (natbox [129.145.120.47])
	by hsmtv32a.SFBay.Sun.COM (8.9.3+Sun/8.9.3/ENSMAIL,v2.1p1) with ESMTP id OAA29767
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2001 14:51:52 -0700 (PDT)
Message-ID: <3B560681.4D216FF3@sun.com>
Date: Wed, 18 Jul 2001 14:58:25 -0700
From: Tim Hockin <thockin@sun.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: cfi_cmdset_0002 and writes
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

ok, so I've got (in mylocal CVS, not checked in) some code that sets up our
flash ROM.  I have the MTD layer reading my device just fine.

What I DON'T have is writing working.

I don't know how the other devices supported by cfi_cmdset_0002 work, but
let me explain how our flash works.  I am hoping someone can then explain
to me how cfi_cmdset_0002 can work.

The flash can be erased by 64k blocks.  Since it is flash, you can only
reprogram '1' bits to '0' bits, and never vice versa.  What I don't find is
any hooks in cfi_cmdset_0002 to read a whole block, erase it, make changes
to the in-memory block and write it back to flash.

How/where does it do this?  Or are all the other chips that use this cmdset
more flexible?  Obviosuly, we don't want to do that for every write.


In my previous incarnation of a flashrom driver, the driver created the in
buffer shadow whenever a write occurred to a block. Then, on fsync() would
flush all the block back to flash.

Secondly, the specs call for specific spin checks (checkin the high bot of
each byte) rather than wait-times.

Is the existing model going to work for me at all?

feeling frustrated,
Tim


-- 
Tim Hockin
Systems Software Engineer
Sun Microsystems, Cobalt Server Appliances
thockin@sun.com
