Received: from motgate8.mot.com ([129.188.136.8])
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E5mCA-00030z-Rr
	for linux-mtd@lists.infradead.org; Thu, 18 Aug 2005 16:20:43 +0100
Received: from il06exr04.mot.com (il06exr04.mot.com [129.188.137.134])
	by motgate8.mot.com (8.12.11/Motgate7) with ESMTP id j7IFUPV0017142
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Aug 2005 08:30:26 -0700 (MST)
Received: from il02exm15.corp.mot.com (il02exm15.corp.mot.com [10.0.111.27])
	by il06exr04.mot.com (8.13.1/8.13.0) with ESMTP id j7IFQ7tu004294
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Aug 2005 10:26:07 -0500 (CDT)
Message-ID: <53F44AF77A9F9B458DCE1910C2E6263813BAE170@il02exm15.corp.mot.com>
From: Lindstrom James-A19027 <A19027@motorola.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Thu, 18 Aug 2005 10:20:15 -0500
MIME-Version: 1.0
Content-Type: text/plain
Subject: strange doc issues
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, I wrote this list about two months ago.  I was trying to get my embedded
Arm platform to support the diskonchip using the open source drivers, rather
than the mystery drivers left to me by a previous engineer (presumably
relying upon msys's binary-only drivers).  I wrote several emails (see the
archives) detailing how I had to change my erasesize from 0x4000 to 0x2000 
in order for the drivers to find the BNAND header.  I eventually paused 
and decided to order the pci eval board from msys so I could get at the
device from dos (under a known working configuration). 

I got the card and am now back at it.  What I found is that if I set the
Erasesize back to the normal setting, but set the MultiplierBits to 1 (which
is effectively the same as incrementing the phys_erase_shift.  When I did
that, I get a bit further.  Now I get to a point where the bad block table
is not found, but the partition table (there's just one partition , I made
it using dformat under dos) is correctly parsed.  But then inftl_format goes
nuts giving me corrupt block messages, trying to erase/format the suspect
blocks, but then deciding that the disk is write protected.

Does anyone have a feel for what might be going on?  First of all, it seems
fishy that I've had to arbitrarily add one to MultiplierBits to get the
BNAND header to be found.  But given that I did, perhaps I also need to muck
With the other shift values to get things working?  I tried adding deltas 
>From -3 to +3 to the bbt_erase_shift, but had no luck getting the bbt found.
And I still don't have a good feel for why I'm getting these corrupt block
messages (on a doc coming straight from dformat).

Can anyone offer advice?  I appreciate all the help you guys have had.
Thanks,

jbl
