Received: from av-gw1.cc.tut.fi ([130.230.130.110])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IY36d-0002OW-CG
	for linux-mtd@lists.infradead.org; Wed, 19 Sep 2007 13:12:59 -0400
Message-ID: <46F1586D.7030605@tut.fi>
Date: Wed, 19 Sep 2007 20:12:13 +0300
From: Timo Piiroinen <timo.piiroinen@tut.fi>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: mkfs.jffs2 and mksum
References: <Pine.LNX.4.64.0709191538050.1701@assari.cc.tut.fi>	
	<1190206217.14370.155.camel@sauron> <46F12C4D.9060204@tut.fi>	
	<1190211192.14370.166.camel@sauron> <46F13100.9020705@tut.fi>
	<1190213260.14370.188.camel@sauron>
In-Reply-To: <1190213260.14370.188.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy kirjoitti:
> On Wed, 2007-09-19 at 17:24 +0300, Timo Piiroinen wrote:
>   
>> I use the redboot bootloader to flash image (using fis create), if I 
>> flash with lenght parameter same as image size it won't work, cause 
>> after that there is mtd/2 which is length of image and mtd/3 which 
>> contains rest of free flash (and I want mtd/2 to use all available flash).
>> I'll try to create image using legth of free flash and write rest of it 
>> after jffs2 image (unused part) with 0xFF.
>>     
>
> I never used redboot so I cannot help here, may be others.
>
> But what I just want to inform you about pitfalls you may hit.
>
> When you flash a padded image, you basically write 0xFFs to unused
> space. Writing 0xFFs may have side-effects - e.g., ECC of all 0xFF bytes
> may by 0x0 (I saw this in practice). It will be stored in OOB and the
> NAND page won't be re-writable. E.g., JFFS2 may think: "oh cool, I have
> empty flash space here (all 0xFF bytes), I'll write my data there". But
> it ends up with an error.
>
> You may argue that in your case ECC of 0xFFs is 0xFFFFFFFF, but anyway,
> data sheets usually say that you may do only one write per NAND page (or
> sub-page), and you've already done one when wrote 0xFFs, and it _might_
> cause some problems, side-effects, or heisenbugs.
>
> I'm not sure how mkfs.jffs2 pads - whether it writes clean markers to
> beginnings of padded eraseblocks or not. If yes, you may hit the
> problems described above. If not, it is fine, JFFS2 will re-erase them
> on the first mount.
>
> But there is the last eraseblock of the image which may be partially
> filled. JFFS2 interprets the 0xFFed part of it as empty space and this
> may cause problems described above.
>
> Just beware of this. Depending on the system, this might not be relevant
> for you, but you might want to play safe.
>
> So one thing to do is to flash exactly the amount of NAND pages the FS
> image contains, not more. And erase the flash beforehand.
>
> The other thing to do is to check/teach the program which flashes data
> (redboot?) and make sure it just skips NAND pages containing all 0xFFs
> if they span up to the end of the eraseblock.
>
> HTH.
>
>   
I think jffs2 writes cleanmarkers to padded space, but I'm not sure what 
happens in sumtool with padded space because the padded space is lost. 
It sounds that it's possible get in touble with padding, if writing 0xFF 
into empy space, if it may cause "unstable bits" or somethink like that. 
Well, I'm not sure if I want to use padding anymore :)
