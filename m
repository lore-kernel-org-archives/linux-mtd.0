Received: from [203.46.70.199] (helo=singularity.tronunltd.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15A1iL-0002Hb-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 04:53:05 +0100
Date: Wed, 13 Jun 2001 13:58:16 +1000
Message-Id: <200106130358.NAA03882@singularity.tronunltd.com>
To: "Tim Hockin" <thockin@sun.com>
Subject: Re: how to get MTD support - need expert input
From: "Ian" <Relativity@HumanHeuristic.com>
Cc: linux-mtd@lists.infradead.org
Reply-To: "Ian" <Relativity@HumanHeuristic.com>
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


I was looking at having one of these made for me ... if its XIP flash (unlike
the DoC Millennium (outside its first 512bytes)) then I would be interested
in the circuit diagrams and could contribute C-level programming to drive it
resources.

Actually the one I was looking at having built would have been 512k pages,
but 64k should be enough for anybody ;-)



  ----- Original Message -----
>From: "Tim Hockin" <thockin@sun.com>
>To: <linux-mtd@lists.infradead.org>
>Subject:  how to get MTD support - need expert input
>Date: Tue, 12 Jun 2001 20:35:27 -0700
>
> Hello, All.
> 
> I am trying to get the general MTD layer in linux to support our systems'
> flashroms.  The problem is that our system setup is a bit unique.
> 
> We have 1 or 2 chips (so far all have been JEDEC).  These may be of
> intermixable sizes from 512K to 4MB.  They are mapped in the top 64k of
> address space (x86 compatible).  To swap pages and banks, there is a 
custom
> flash page register, which has a few bits that determine teh actively
> mapped page.
> 
> So my question is this:
> 
> What is the best way for me get full support?  Apparently all the JEDEC
> support in 2.4.5 is broken.
> 
> This is my thought:
> 
> have a map driver (like the other chipset map drivers) that builds it's own
> struct mtd_info.  We can then flip pages at will, probe however we like,
> etc.  I wish I could say that we will always have both flash chips
> identical, but I can't.
> 
> feedback?
> 
> -- 
> Tim Hockin
> Systems Software Engineer
> Sun Microsystems, Cobalt Server Appliances
> thockin@sun.com
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
http://HumanHeuristic.com/
"Bringing people together in a world full of computers"
