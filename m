Received: from dekhockeyquebec.com ([66.201.193.5] helo=mail.webnet.qc.ca)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 175Vor-0006Hu-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 May 2002 19:05:41 +0100
Subject: Re: Current status JFFS2 on DOC
From: Frederick Lefebvre <flefebvre@irg.ca>
To: Pieter Grimmerink <mailinglists@grimmerink.nl>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <MPBBIIEFELAEABNCNHMMGELBDAAA.mailinglists@grimmerink.nl>
References: <MPBBIIEFELAEABNCNHMMGELBDAAA.mailinglists@grimmerink.nl>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 08 May 2002 14:08:39 -0400
Message-Id: <1020881319.14408.52.camel@zeus>
Mime-Version: 1.0
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

I am working, among many, many other things on getting JFFS2 on a DOC
2000.  I do not know when it will be ready since I've got so much work
right now.

-- 
Frederick Lefebvre
flefebvre@irg.ca
Software Developer,
(418)523-4474 #242
Infomedia Research Group (IRG)
Quebec, Canada

On Wed, 2002-05-08 at 12:37, Pieter Grimmerink wrote:
> I was quite happy to read about the recent efforts to support
> JFFS2 on NAND devices.
> 
> Currently I'm about to make a decision on which flash device
> to use for a new embedded device. 
> Looking at prices NAND flash looks like the best option, 
> especially if we can use JFFS2 on it.
> 
> >From a design point of view, DiscOnChip looks nice with
> it's feature to boot from it.
> SmartMedia looks a bit cheaper, but that would require
> a separate NOR device, large enough to hold a compressed
> kernel, total price going up above the DOC prices again.
> 
> However, all that I have found so far in mailinglists and
> howto's, indicates that JFFS2 on smartmedia has been further
> investigated then JFFS2 on DOC.
> But as far as I understand, there should be no physical limitation
> on a DOC to eventually host a JFFS2 filesystem.
> 
> Is this all true, and has someone managed to get a working 
> JFFS2 filesystem on a DOC? 
> and finaly, what are the chances of acutally booting into a 
> JFFS2 root filesystem directly from a DOC?
> (I heard something about a modified GNU GRUB to replace the DOC
> firmware)
> 
> This would eventually all have to run on a non-x86 processor.
> 
> Is this a workable solution already, or would I have to go for
> more 'conventional' hardware to be safe?
> 
> Best regards,
> 
> Pieter Grimmerink
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
