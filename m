Received: from mail.ssa.crane.navy.mil ([164.227.42.3])
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DxYPH-00043m-5s
	for linux-mtd@lists.infradead.org; Wed, 27 Jul 2005 00:00:20 +0100
Sender: tdennist@ssa.crane.navy.mil
Message-ID: <42E6C048.AABF27CB@ssa.crane.navy.mil>
Date: Tue, 26 Jul 2005 17:59:20 -0500
From: Todd Denniston <Todd.Denniston@ssa.crane.navy.mil>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <42D81ABD.B94A12FB@ssa.crane.navy.mil>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Re: pcmciamtd and FTL status question.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Todd Denniston wrote:
> 
> Hello,
> I am on a project that needs to support some "PRETEC", " SERIES-2  4MB FLASH
> CARD" which are Intel type 2 "linear flash" cards.
> 
> In the original setup they were working on a 2.4.x kernel with the old
> pcmcia-cs drivers (memory_cs & ftl_cs). 
> 
> From the lack of traffic on the linux-mtd list, especially success stories,
> about the pcmciamtd and even less when I combine that with ftl, I am also
> wondering if they have stabilized to a useable point yet.
> 

To help my understanding, would someone please clarify what David Hinds said
in this email:
http://lists.infradead.org/pipermail/linux-pcmcia/2004-September/001142.html

DH> It is not the job of pcmciamtd to detect the card so 
DH> you should be more specific, i.e., show system log 
DH> messages, that sort of thing.

Which if I understand correctly is why I have to put an entry in
/etc/pcmcia/config like the following:
card "PRETEC"
  version "PRETEC", " SERIES-2  4MB FLASH CARD"
  bind "pcmciamtd"

but I notice in pcmciamtd.c a bunch of PCMCIA_DEVICE_PROD_ID12(...) calls
are these over riding /etc/pcmcia/config, i.e., do I have to mod pcmciamtd.c
to get it to really be used for the Pretec card?

DH> iflash2_mtd is not actively maintained, as it was only 
DH> ever used by a handful of people, and is deprecated along 
DH> with all the other kernel drivers in the pcmcia-cs package.

Clarification desired:
does pcmciamtd replace memory_cs and iflash2_mtd fully, or would I have to
code up a pcmciamtd iflash2 handler? 
I really do not see the documentation on the site or in the code to resolve
this (I have been a simple user of what already worked at an OS level, and
not fully immersed in the MTD physical device and device driver world, so
maybe the docs are there but are hieroglyphics to me).

-- 
Todd Denniston
Crane Division, Naval Surface Warfare Center (NSWC Crane) 
Harnessing the Power of Technology for the Warfighter
