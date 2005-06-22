Received: from fallback.mail.ru ([194.67.57.14] helo=mx4.mail.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dl6u0-0008Gw-1x
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2005 11:12:35 -0400
Received: from f21.mail.ru (f21.mail.ru [194.67.57.54])
	by mx4.mail.ru (mPOP.Fallback_MX) with ESMTP id 0890B3C957E
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jun 2005 16:51:31 +0400 (MSD)
From: Timofey Kutergin <tkutergin@mail.ru>
To: Josh Boyer <jdub@us.ibm.com>
Mime-Version: 1.0
Date: Wed, 22 Jun 2005 16:51:20 +0400
In-Reply-To: <1119442366.16063.12.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 8bit
Message-Id: <E1Dl4hM-00094e-00.tkutergin-mail-ru@f21.mail.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re[2]: clean marker size for NOR w/ECC
Reply-To: Timofey Kutergin <tkutergin@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

yes, I agree - eccsize is smallest write size. Or size of region which can be written only once after block erase. What I meant was that if eccsize is greater than cleanmarker size, JFFS2 does not skip rest of first ECC region in block and tries to write data to it. This causes write failure. Therefore patch sets clean marker size to eccsize if eccsize is greater than 16.

agree, I confused 12 with 16. Now I understand than 16 is set as 2*8 > 12 :)

Thanks

-----Original Message-----
From: Josh Boyer <jdub@us.ibm.com>
To: Timofey Kutergin <tkutergin@mail.ru>
Date: Wed, 22 Jun 2005 07:12:46 -0500
Subject: Re: clean marker size for NOR w/ECC

> 
> On Wed, 2005-06-22 at 10:49 +0400, Timofey Kutergin wrote:
> 
> Please set your mailer to line wrap at 80 columns.
> 
> > Currently, JFFS2 WBUF implicitly assumes that cleanmarker size is
> > multiple number of eccsize and sets it to 16 in
> > jffs2_nor_ecc_flash_setup(). Which in fact mean 1,2,4,8 and 16 valid
> > values for eccsize. Newer flashes may have ECC window more than that,
> > 1024 bytes, for example. So at least it is suggested to change
> 
> No, 1, 2, 4, and 8 are not valid values.  16 is the only valid value for
> the NOR chips with ECC that are supported by MTD.  The eccsize variable
> is pretty misleading.  It really indicates the smallest size write that
> the chip can handle.
> 
> Also, the NOR_ECC option is currently intended for chips that have
> transparent ECC.  That means that you don't have access to the ECC
> values and simply have restrictions on the minimum size of a write.
> 
> > 
> >  c->cleanmarker_size = 16;
> > to
> >  c->cleanmarker_size = c->mtd->eccsize>=16 ? c->mtd->eccsize:16;
> 
> If you're going to do that, just make it:
> 
> c->cleanmarker_size = c->mtd->eccsize;
> 
> though I'd rather leave it for now.  There are no other NOR ECC chips
> out there that I know of.
> 
> > 
> > also, when using flash_eraseall utility with -j option, it also assumes
> > cleanmarker size of 16 (sizeof(struct jffs2_unknown_inode)).
> 
> Erm, no it doesn't.  sizeof(struct jffs2_unknown_node) == 12.
> 
> > It is suggested to put similar check there:
> 
> A check similar to that could be ok.  Though I'm not entirely convinced
> it's needed.
> 
> josh
> 
> 
