Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dl46l-0007HM-RN
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2005 08:13:33 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e4.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j5MCD7CU026354
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jun 2005 08:13:07 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j5MCD7ZJ234528
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jun 2005 08:13:07 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j5MCCvFq011653
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jun 2005 08:12:57 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Timofey Kutergin <tkutergin@mail.ru>
In-Reply-To: <E1Dkz3Q-0008Px-00.tkutergin-mail-ru@f24.mail.ru>
References: <E1Dkz3Q-0008Px-00.tkutergin-mail-ru@f24.mail.ru>
Content-Type: text/plain
Date: Wed, 22 Jun 2005 07:12:46 -0500
Message-Id: <1119442366.16063.12.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: clean marker size for NOR w/ECC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-06-22 at 10:49 +0400, Timofey Kutergin wrote:

Please set your mailer to line wrap at 80 columns.

> Currently, JFFS2 WBUF implicitly assumes that cleanmarker size is
> multiple number of eccsize and sets it to 16 in
> jffs2_nor_ecc_flash_setup(). Which in fact mean 1,2,4,8 and 16 valid
> values for eccsize. Newer flashes may have ECC window more than that,
> 1024 bytes, for example. So at least it is suggested to change

No, 1, 2, 4, and 8 are not valid values.  16 is the only valid value for
the NOR chips with ECC that are supported by MTD.  The eccsize variable
is pretty misleading.  It really indicates the smallest size write that
the chip can handle.

Also, the NOR_ECC option is currently intended for chips that have
transparent ECC.  That means that you don't have access to the ECC
values and simply have restrictions on the minimum size of a write.

> 
>  c->cleanmarker_size = 16;
> to
>  c->cleanmarker_size = c->mtd->eccsize>=16 ? c->mtd->eccsize:16;

If you're going to do that, just make it:

c->cleanmarker_size = c->mtd->eccsize;

though I'd rather leave it for now.  There are no other NOR ECC chips
out there that I know of.

> 
> also, when using flash_eraseall utility with -j option, it also assumes
> cleanmarker size of 16 (sizeof(struct jffs2_unknown_inode)).

Erm, no it doesn't.  sizeof(struct jffs2_unknown_node) == 12.

> It is suggested to put similar check there:

A check similar to that could be ok.  Though I'm not entirely convinced
it's needed.

josh
