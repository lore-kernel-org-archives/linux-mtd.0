Received: from pony1.arc.nasa.gov ([128.102.31.31] helo=mail.arc.nasa.gov)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1934BW-0006A3-Fn
	for <linux-mtd@lists.infradead.org>; Wed, 09 Apr 2003 02:15:30 +0100
Received: from mail.arc.nasa.gov (airborne.arc.nasa.gov [128.102.173.254])
	by mail.arc.nasa.gov (8.9.3p2/8.9.3) with ESMTP id SAA19850
	for <linux-mtd@lists.infradead.org>;
	Tue, 8 Apr 2003 18:15:01 -0700 (PDT)
Message-ID: <3E9374A7.3020309@mail.arc.nasa.gov>
Date: Tue, 08 Apr 2003 18:17:27 -0700
From: "Edward A. Hildum" <ehildum@mail.arc.nasa.gov>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: DoC + GRUB booting problem follow up
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've built a 2.4.18 kernel with MTD, and it has problems with the DoC 
device.  Evidently this is a DOC 2000 TSOP, and is detected as a DoC 
Millenium.  The flash chip type is not recognized by the driver.

What do I need to do to add support for this DoC?  Could it be as simple 
as adding the Samsung KM29V1024000 flash chip to the appropriate tables 
in the driver code?

Ted Hildum
