From: hno@marasystems.com (Henrik Nordstrom)
Date: Sat, 8 Feb 2003 15:19:04 +0100 (CET)
Subject: How can I save my DoC ?
In-Reply-To: <20030208134932.3649.qmail@web20810.mail.yahoo.com>
Message-ID: <Pine.LNX.4.44.0302081518260.19779-100000@filer.marasystems.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Try formatting it with the MSystems DFORMAT tool from DOS.

Regards
Henrik

On Sat, 8 Feb 2003, tony Tong wrote:

> After many failures ,I select to turn to old patch of
> grub-doc  
> because about half  year ,I have managed our DOC2000 
> successfully according to
> http://lists.infradead.org/pipermail/linux-mtd/2001-October/003475.html.
> It is very old ,but it does work then.
> 
> But this time , I dont konw why I failed .
> I use grub-0.90 and the grub-0.90-patch ,mtd is
> 0501snapshot
> This time I just get grub shell ,but it cannot
> recognize DoC.
> so I enter hard image ,redo this process.
> but this time, worse of all,my DOC was corrupted .
> When I  use "./eraseall /dev/mtd0",I get many errors .
> Then in the following "./nftl_format /dev/mtd0 98034"
> ,I get info which tells bad block table corrupted
> Then How can I save my DoC?
> Help urgently needed!
> Can you experienced guys give me a advice  ?
> 
> 
> 
> 
> __________________________________________________
> Do you Yahoo!?
> Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
> http://mailplus.yahoo.com
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
