Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDC2C33C99
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 07:34:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51EDB2072E
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 07:34:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D7pOiSI7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Si4oZXKw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51EDB2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGR3cUIiXoaiSIkYpaqjSWaCZj7LKHOR9sPj5lPS6X0=; b=D7pOiSI7zL83tu
	wyvwvrDr6xj9I75woHhQ5+NswKnIPdzE0oRM1N/6yLQzCtNQ1SAwXhbwe1mr6gK7/W8cVfBhTTFTe
	Ng5ApdppH+851obDqsK0QdR2d+srqRlKOD7h27P0OA33qDzmu5Ks1rTdq9gLTALPJZu8VDL0Oz2V+
	FDzpPEBhn3lNd9DTWIyUIOLMv0cYf43iEBur4awKpgULfyDZCpbyvqxvU2W/ACoBybcnkJlAE0fhP
	V1K63LSoZL+nTUC/k13ARvdGiEbvRTEPV99DpmsMei64QUFTUS57nu47KesiXeWYQ2wnpEeouCG4i
	dSXi2m4usqy7EVlmr5Sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipood-0004Sx-N4; Fri, 10 Jan 2020 07:34:43 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipooa-0004Rk-KB
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 07:34:42 +0000
Received: by mail-ot1-x341.google.com with SMTP id d7so1062624otf.5
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2020 23:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oPDeuXNAtQv9fBhiJzJbxRhyqm6iekz5DQDtjJ5WnyU=;
 b=Si4oZXKwDCMidho9srkC/elmtC59a2FPNKZ2pHw91A9GQpQx52p9KcAfBYRL5s/DDD
 Dl6ZxlIrVwhqTeiC1kVqfww1j9GK2/vCR+qrrnuUK3jaG1gNPZGRLRTddz2FaN4NI/fN
 JN4ns66+Vh2LrCW+Kwg6ktJPINa9yYQRIDlV1vkijDVXcTgWmQFtGMF4AjjFVg/aguzs
 2Lyec5csMpiFDZ0A4A59V8WjrJLgOIJ6E6AqNbJsd7z5pdP7qpZj1dS3C2v03+D2bjB3
 2+SAmqkEz0nvFi0uXGP5fxT8N4II7/npUG+1zyv64yiJTX0GpzFHVdT2eutqqaBvBrnt
 930Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oPDeuXNAtQv9fBhiJzJbxRhyqm6iekz5DQDtjJ5WnyU=;
 b=ArBi/xQZNlEcNvhulFkzy8qTf3uz7X4xlW25pOskDAPRUgrWsfoUW0peIcqiku9ZaJ
 sPc/aSQltP+DiLx6wycpG13pu4frveVqXMT/VZKUz+W1qffBZgnH//y/WIWXtanR5b1V
 Dc2d7xC1SQhczu1N623KN1cfL+7hUhmyhCNi84cS1lw15bEuDbNzFOl8/bWeJbQbs5+p
 K/dfZAqh2Lvqcwl9t0fud+z9Cp16O289D4NQIiirhWPYIcodbccmtbA7WqEdZnJ3ItjZ
 KWzFuHG1ODWqrrW9pXdqaOXakREhqUErLu0xhnbssGGtFhsmhmdlXSfv5Ch2rjMVg/wt
 NYlQ==
X-Gm-Message-State: APjAAAWkoVWiN0ve1PrZoLw4bipzDdmBTGE0ad96iFn/96ab2GndoUNr
 Y4LH45DOUZ18hcsGTkUS4P24sQHBy15DBUdHKAs=
X-Google-Smtp-Source: APXvYqyxzZJB5sAFRxMtJ/AJttS4I5dOEIjMdHrhGGxX3Jln0+E96ysOvYrz0U2i17vzjfDiBnntcmlMRT+RYEfp2Po=
X-Received: by 2002:a9d:6211:: with SMTP id g17mr1427847otj.168.1578641679301; 
 Thu, 09 Jan 2020 23:34:39 -0800 (PST)
MIME-Version: 1.0
References: <20200110025218.1257809-1-gch981213@gmail.com>
 <20200110075859.3edfae3a@collabora.com>
In-Reply-To: <20200110075859.3edfae3a@collabora.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 10 Jan 2020 15:34:28 +0800
Message-ID: <CAJsYDVK4RtX92O3M+EOsZa5qS4TxE0OVaEq=KOnAuP6DEHvw2Q@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: nand: spi: rework detect procedure for different
 read id op
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_233440_668278_843FA562 
X-CRM114-Status: GOOD (  12.08  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Fri, Jan 10, 2020 at 2:59 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> [...]
> > +     ret = spinand_read_id_op(spinand, 1, 0, id);
> > +     if (ret)
> > +             return ret;
> > +     ret = spinand_manufacturer_match(spinand,
> > +                                      SPINAND_READID_METHOD_OPCODE_ADDR);
> > +     if (!ret)
> > +             return 0;
> > +
> > +     ret = spinand_read_id_op(spinand, 0, 1, id);
>
> Hm, we should probably do only one of each read_id and iterate over all
> manufacturers/chips each time instead of doing 3 read_ids per
> manufacturer.

This actually do the former instead of the latter. Maybe the function
names are a bit
misleading. spinand_manufacturer_match iterates over all manufacturers
in one call,
and spinand_manufacturer_detect is called once in spinand_detect.
Do you have suggestions on function naming?

> [...]
> > + *       SPINAND_READID_METHOD_OPCODE_DUMMY: chip id is returned after
> > + *       read_id opcode + 1 dummy byte.
> > + */
> > +struct spinand_devid {
> > +     u16 id;
>
> Can we make that field an array of u8?
>
>         const u8 *id;
>
> > +     u8 len;
> > +     enum spinand_readid_method method;
> > +};
> [...]
> >
> > +#define SPINAND_ID(__id, __len, __method)                            \
> > +     {                                                               \
> > +             .id = __id,                                             \
> > +             .len = __len,                                           \
> > +             .method = __method,                                     \
> > +     }
>
> That one can be turned into
>
> #define SPINAND_ID(__method, ...)                               \
>         {                                                       \
>                 .id = (const u8[]){ __VA_ARGS },                \
>                 .len = sizeof((u8[]){ __VA_ARGS }),             \
>                 .method = __method,                             \
>         }

Wow. I never thought of this cool trick. I'll give it a try.

Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
