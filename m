Received: from patan.sun.com ([192.18.98.43])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15KrWR-0001Sr-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2001 02:13:35 +0100
Received: from hsmtv32a.SFBay.Sun.COM ([129.145.122.36])
	by patan.sun.com (8.9.3+Sun/8.9.3) with ESMTP id TAA24253
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jul 2001 19:19:12 -0600 (MDT)
Received: from sun.com (natbox [129.145.120.47])
	by hsmtv32a.SFBay.Sun.COM (8.9.3+Sun/8.9.3/ENSMAIL,v2.1p1) with ESMTP id SAA11034
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jul 2001 18:19:13 -0700 (PDT)
Message-ID: <3B4E4E40.5300A2DD@sun.com>
Date: Thu, 12 Jul 2001 18:26:24 -0700
From: Tim Hockin <thockin@sun.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: hacking - need feedback
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

All,

I'm trying to get support for our flashrom into the MTD codebase.  Upon
speaking with David Woodhouse, he wants some re-structuring.

Rather than cfi_probe looking for jedec devices, we probably want a
jedec_probe that hooks up to cmdset_0002.

I don't know everything there is to know about JEDEC, so I have a few
questions.

It seems that the majority of the code in cfi_probe.c applies equally to
both cfi and jedec chips (and probably others).

How should this be structured?  

Would life be easier if all maps just called do_map_probe_all() and that
would walk down the list of supported chiptypes?
	cfi_probe
	jedec_probe (new)
	jedec
	amd_flash
	ram
	rom

I understand jedec.c and amd_flash.c are present for compatibility, but we
want future stuff to use the common cmdset code.  

Is it true that the code in cfi_probe.c (for doing things like interleave,
multiple chips etc) should be common for CFI and JEDEC (and others?)  If
so, it should be shared, but it hardly makes sense that do_map_probe("cfi")
would find jedec chips...


Sorry I'm rambling.  I'm still trying to wrap my head around the lot of it,
and being new to the codebase, it is easy for me to say "rip out the old
stuff" :)

Tim
	
-- 
Tim Hockin
Systems Software Engineer
Sun Microsystems, Cobalt Server Appliances
thockin@sun.com
