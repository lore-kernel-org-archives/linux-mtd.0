Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPNCp-0003Y7-Rm
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 12:14:58 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IX0004AO58EZF50@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 12:14:39 -0500 (EST)
Date: Fri, 31 Mar 2006 12:14:38 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1143806110.3579.90.camel@sauron.oktetlabs.ru>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-id: <Pine.LNX.4.64.0603311207160.14923@localhost.localdomain>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_sAz71Je9jX/RGMgjbVlLCw)"
References: <1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com> <442CE217.8080103@yandex.ru>
	<442CE2DC.7020505@yandex.ru>
	<20060331092715.GC11367@wohnheim.fh-wedel.de>
	<442CF82B.5060904@yandex.ru>
	<20060331094050.GB14713@wohnheim.fh-wedel.de>
	<1143799209.3579.74.camel@sauron.oktetlabs.ru>
	<20060331100709.GD14713@wohnheim.fh-wedel.de>
	<1143800324.3579.87.camel@sauron.oktetlabs.ru>
	<20060331114049.GH14713@wohnheim.fh-wedel.de>
	<1143806110.3579.90.camel@sauron.oktetlabs.ru>
Cc: Alexander Belyakov <alexander.belyakov@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_sAz71Je9jX/RGMgjbVlLCw)
Content-type: TEXT/PLAIN; charset=ISO-8859-1
Content-transfer-encoding: 8BIT

On Fri, 31 Mar 2006, Artem B. Bityutskiy wrote:

> On Fri, 2006-03-31 at 13:40 +0200, Jörn Engel wrote:
> > Right now, we have code like
> > 
> > #define jffs2_can_mark_obsolete(c) ((c->mtd->type == MTD_NORFLASH && !(c->mtd->flags & MTD_ECC)) || c->mtd->type == MTD_RAM)
> > 
> > I guess we can both agree that it is far from optimal.  And my take
> > would be to replace it with
> > 
> > #define jffs2_can_mark_obsolete(c) (c->mtd->flags & MTD_CAN_MARK_OBSOLETE)
> > 
> Add an c->flags field to the per-JFFS2 structure. Initialize it on mount
> properly. Then
> 
> #define jffs2_can_mark_obsolete(c) (c->flags & JFFS2_CAN_MARK_OBSOLETE)
> 
> Don't try to jam this to MTD please.

Artem, you have it backward.

What needs to be exported is a flash _capability_, not a flash type.

We don't care a single whit if the flash is NOR or NAND or bufferedNOR 
or any other bastardized type that will come up in the future.

What MTD users like JFFS2 or mtdchar needs to know is:

 - what is the minimum write size

 - what is the optimal write size

 - can individual bits be cleared

 - can individual bits be set

 - what the OOB size is

etc.  That is sensible information to have and that what the actual code 
implementation in JFFS2 cares about.

Otherwise, what do you do with, say, Sibley flash?  Sibley is NOR but 
not like the traditional definition of NOR flash.  It could be seen like 
buffered NOR but not exactly.  It could be handled like NAND but without 
any OOB data.  So what is the solution: adding yet one more flash type?  
Alternately it could be described fully in terms of the above 
_capabilities_ which is what matters in the end.


Nicolas

--Boundary_(ID_sAz71Je9jX/RGMgjbVlLCw)--
