Received: from fmfdns01.fm.intel.com ([132.233.247.10] helo=calliope1.fm.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ZwFX-0001VO-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2001 16:18:27 +0100
Received: from hasmsxvs01.iil.intel.com (hasmsxvs01.iil.intel.com [143.185.63.58])
	by calliope1.fm.intel.com (8.9.1a+p1/8.9.1/d: relay.m4,v 1.41 2001/07/09 21:06:22 root Exp $) with SMTP id PAA00996
	for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2001 15:24:22 GMT
Received: from hasmsx17.iil.intel.com ([143.185.63.203])
 by hasmsxvs01.iil.intel.com (NAVGW 2.5.1.6) with SMTP id M2001082318242123331
 for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2001 18:24:21 +0300
Message-ID: <31223C0C0949D211AC3F00A0C9840935047CF082@hasmsx40.iil.intel.com>
From: "Kremer, Alex" <alex.kremer@intel.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Intel Fast Boot Block support
Date: Thu, 23 Aug 2001 18:24:17 +0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi all, I'm resending this one -- not sure it got through.

I have a design question for the code I'm attaching 
that adds support for the old Intel's TE28F*B Fast Boot Block series.
The patch is to cvs from Aug, 19. Note that it modifies
the maps/dc21285.c code and Config.in, to which my question below is
related.

As opposed to Intel's 28F*J Strata Flash series the 
old Fast Boot Block series is not CFI compliant.
I couldn't even coerce it to work as a jedec.

The Lart (devices/lart.c) uses a chip from this series, but the data bus has

a totally crazy mapping.
So I wrote a module for this series somewhat based on the chips/amd_flash.c
code.
Since I have it mapped via dc21285 I modified maps/dc21285.c to probe using
my module
instead of using cfi_probe. (I also had to modify the write16, since the
code there uses,
IMO,  a wrong addr. mask).

I see two problems (not counting the possible bug in dc21285_write*() code)
with what I did:

1. The dc21285.c use of cfi compliant chips is hardcoded (there should maybe
be a
	way to try and probe all registered modules for the first one that
reports success,
	or something like that) or should I use CONFIG_ and #ifdef
2. A minor one - the use of a certain chipset for mapping doesn't
necessarily mean that the
	address and data lanes are always the same. In addition is there
some framework in plan 
      that captures the mapping/interleaving and bus width issues separated
for the specific chip support?

Should I maybe write a device specific modules without the maps/chips
separation, since it seems only
to complicate things?

BTW: For some reason for Intel's 28F* chips the most important is the letter
that follows the
      size code, so the 28F128J means that it belongs to a Strata Flash line
which is CFI comliant,
 	while 28F128B belongs to the Fast Boot Block Flash line, which is
really a pre-CFI,
	and the CFI code wont work.

A totally unrelated issue: 
 I need to edit the redboot partition table from linux.
 How should I reread it? Removing and loading the modules, doesn't seem like
a nice solution,
 especially since the root fs is on flash.
 Should I try and add ioctl to the mtdchar/block code, so it would work like
when you use fdisk?

Kreso
