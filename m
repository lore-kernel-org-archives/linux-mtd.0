Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA14CC5B572
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2026 09:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eGe04e0PpXxEYcJw8lMm1gVTobc49B2Pl6jGgQCpI9A=; b=rjR7ubDGkWrtqF
	yjKRXaWRk2F8c7sSDY+fpz2pZoNi5KSUYWh1H20nnVPoWRWj3ajpCAgpQzZi3jF2D1dTOfl/zavZq
	OveuegafE7Azg0Exo6ntdJ8AlYGV3wsNSUv0CWc5h/wxzxJl5CxB12B1+jy9Ti+qK/ZpC0dzUbWA2
	FVf9Vft4M4fcEVVz3SKs5NXgyfFD0r2kQU99CC5G0VF77ImGoVGCpQ31f4P/JAbUIg3IMUrrN4aQZ
	r3DXTfasoM2DgudYuJ4Mpuwdya4OwC7MM38OZDQM7Wjgf+j23wPyFlqBfGRXu2xVtMnGLNBkzM+Nl
	Iera+18oHVtMzQd5AZ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRly-00000000JmU-26oI;
	Thu, 13 Aug 2026 09:30:50 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRlv-00000000JlA-0Vwo
	for linux-mtd@lists.infradead.org;
	Thu, 13 Aug 2026 09:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1786613443;
	bh=8VNeESPcQFehuUcPO+mlISItg3X/NhtgmV3aZuGO204=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YlOFpqG/4C/M7k2QMk2eCRh/S/mOQtosyavGNIFzUyXAaeEvJwjNgjOK/IVhFAp1w
	 eKihpjUoY2XJOjZBxbHKpIHgf+xGxo+Et97GWubFX7TxMtEDQ6qINhFESLy9de4Lg9
	 OxLT9//H/YTE0JoPcOHRWWlvFmll3KRTKFexo5DYeGNNvr0Mh+GHx7OzofjHNEQ3tQ
	 oeyawxxEGMBc4sji5jNKBUiqWwSYvOISA/PB6LKO1XhCxUC62bdR6tjIY6GMDWhEDQ
	 Z6URdmSxm7KPsQYMFYfIAPpCPv7Ux8yg/RlBR4eqQmd+0JVcbjsJjz5qi1VAS8PZue
	 06GGiRyGudJag==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 7503C6E3
	for <linux-mtd@lists.infradead.org>; Thu, 13 Aug 2026 18:30:42 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=biWqc1CV;
	dkim-atps=neutral
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id C985E65C
	for <linux-mtd@lists.infradead.org>; Thu, 13 Aug 2026 18:30:42 +0900 (JST)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so21196955ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 13 Aug 2026 02:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1786613441; x=1787218241; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RBHWByBuLBDZsbwfIWc5rJuZ8chbs4+pLuEKTz2S0fc=;
        b=biWqc1CVd6DnrJgjmUS4G44NaL+ZN9ARLJjPM4nJAqdxEFdYwVa9QvrXUj14xtvkni
         YdwWIfgzcES8m9QnxkWaf+wtj6AwyJg2ZUshNIeud3svqcbjkImCJis0JhgeGHr4YI2D
         Fh9cEghhH1AKFlPnq+wV9KYsShw8IYepBOMcoJxs/H3pFcSHhxI3Ss3CkzO90QCv8l6p
         L8XB5Y8CAY+bGE664G/157dY4BCYLiCu7cIhpoHMzs8W+NYUO7DDL0Dm246Wk8WogvYZ
         30okoWWMnvuuen1BrisMvqOz1+ckXxSoN9Ngc2EFZXClLMBFL5EZYL75ejEPhN81a03c
         8TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613441; x=1787218241;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBHWByBuLBDZsbwfIWc5rJuZ8chbs4+pLuEKTz2S0fc=;
        b=X/PA50VKMCUyuop9hOpa9tISVil9WgULboo9SKu1lpmGuBDt81rxgwPYQjKw1IxUQR
         MtoucmelqQjngrH/6RwrlavanlMcBHIVD5GMLXcS9taTuWFCEqoMnTgcQBTHFcx5sfyt
         b+ROPyd4a47v8Pp0K2CovltzqhVDub+EWB54r+WsjFM0nXg9RKDT/53E4QtX1BFnmIPl
         VReN8xUeG/ScaVd2sJcKE07gBwAuOvsoYVSmv1KKawwPdxWN4lJ8uggI5UZkCqZlccET
         mWs8me+JclI1B9TcnEy3W+sRy3vm4fAUDlNDASAyGkGKvQI95pSJiGo2JMX/tjZYXi00
         qsWA==
X-Forwarded-Encrypted: i=1; AHgh+RomFx2S25TVMn7I7uH6GXTE9hEKQI/Ev1DdJ7yfM+4WxkdQZ9gFEMZGlC10uu5pqj43tuXEI/3kpmU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAftNpvHFr0f5jBbFa3xcqJw5EU7o+MTSpTHVUMgWRsZiyulOm
	loSJ3ztGFg8F07DAsdEeGnkcaXdSjzKYDkAmGUGZOwWZxktBw0DvTjxc+S1K+P3ihPGeLzMDDzV
	XxRdKgamo6JDivhsEB+lhhFTyyCx4NSCAhR3II9RAH2JBNNjC4+b8/2Vn8cPN9ZRGPK9C
X-Gm-Gg: AR+sD116b1sDnoCBlF+0+rQqLdsB/EM2BvnJzvSE9NkbzTKszqbMvvexc1QKJroUgKH
	0F2F7D6ya66xQJqVPBnrLId3F+YWGJNoND5/HKKroFzXFICfPOwfvgbYVyu7eaBbxFLS+zgtSz1
	4WfjOprNiBMsn8aj75m7WsozqujSYMLtedQpqnsFe2LStMk65lFN6Gl0dC0RbuFhKMKJ75LZVhW
	IsdBf3HGTtzGMp3vOfZaeSap2elt1iGOmXYOvhdNJ2XnNAjiGblMU2UuWuxkGZVigt6Y2SOJCxG
	yJlonTNg6x5FXWKanYZE44aOvFkmNp3cKjniw4bwpD2rHtSg5vsLc7Cl/OHYl/fm2veM2bW8tSn
	gcI0hSGYUWH0doiUOZ7LGlnnmsoYQLNokThzNiBSgmwdCRtYz
X-Received: by 2002:a17:902:cf09:b0:2cf:9347:f445 with SMTP id d9443c01a7336-2d37d5810abmr50497075ad.10.1786613440782;
        Thu, 13 Aug 2026 02:30:40 -0700 (PDT)
X-Received: by 2002:a17:902:cf09:b0:2cf:9347:f445 with SMTP id d9443c01a7336-2d37d5810abmr50496405ad.10.1786613440177;
        Thu, 13 Aug 2026 02:30:40 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2d37c49ce11sm6472065ad.67.2026.08.13.02.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 02:30:39 -0700 (PDT)
Date: Thu, 13 Aug 2026 18:30:28 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Md Sadre Alam <md.alam@oss.qualcomm.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Daisuke Mizobuchi <mizo@atmark-techno.com>
Subject: Re: [PATCH RFC v2] mtd: spinand: winbond: add support for W25N04LW
Message-ID: <an2OtHX62YRg0ZYZ@atmark-techno.com>
References: <20260812-w25n04lw-v2-1-deee97602fc4@atmark-techno.com>
 <87mruql9fn.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mruql9fn.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_023047_868346_0EB1074A 
X-CRM114-Status: GOOD (  40.41  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Thanks for the feedback!

Miquel Raynal wrote on Thu, Aug 13, 2026 at 10:19:08AM +0200:
> > OOB layout was defined to only show ECC-protected "user data I", leaving
> > "user data II" unavailable.
> 
> Fine, there is not strong rule, and anyway this is only useful for non
> UBI users (jffs2, typically).

Yeah, I was expecting UBI to use it too but I looked it up after posting
and saw it doesn't, so I agree it doesn't matter much for us either way.

> > As an extra data point, this "user area I and II" distinction is the same
> > in W25N04KW (same 2+12), but w25n02kv_ooblayout_free() use there returns
> > the whole 14 bytes as a single chunk, so I explicitly made a different
> > choice here.
> > (I believe that's not something that can be changed easily, so we should
> > discuss this before merging)
> 
> If it's the same layout, I would go for keeping the existing one and
> avoid the proliferation of these helpers.

The layout is similar (each section has 2 bytes for BB marker / 2 bytes
user data II / 12 bytes user data I), but the number of sections per
erase block is different (went from 4 to 8)
For ECC it's the same (4 to 8 sections, and offset changed from 64 to
128 accordingly because there were more data sections before)

I see similar helpers in other drivers (e.g. alliancememory.c) use
mtd->oobsize; so if you prefer I can reuse the existing
w25n02kv_ooblayout* helpers based on this?
----(untested)

static int w25n02kv_ooblayout_ecc(struct mtd_info *mtd, int section,
                                  struct mtd_oob_region *region)
{
	/* 4 sections for oobsize=128, 8 for oobsize=256 */
        if (section >= mtd->oobsize / 32)
                return -ERANGE;

        region->offset = (mtd->oobsize / 2) + (16 * section);
        region->length = 13;

        return 0;
}

static int w25n02kv_ooblayout_free(struct mtd_info *mtd, int section,
                                   struct mtd_oob_region *region)
{
        if (section >= mtd->oobsize / 32)
                return -ERANGE;

        region->offset = (16 * section) + 2;
        region->length = 14;

        return 0;
}
----

(
  Technically could go as far as checking the ecc strength[1] and also
  merge in w25n01kv_ooblayout_ecc (variable ecc length/offset step),
  then if we're greedy also handle oobsize == 64 to replace
  w25m02gv_ooblayout_ecc/w25m02gv_ooblayout_free, but that's starting to
  make the functions more complex than I'm confident in... :)
  [1] mtd_to_nanddev(mtd)->eccreq.strength
)


(And in that case I'll happily give up on the non-ECC distinction and
keep the current behavior that exposes the non-protected bits)

> > That aside:
> > - Alam, would you like your name somewhere in the commit? I didn't keep
> >   anything from your commit because I already had one, but happy to add
> >   a Co-developed-by or something
> > - I kept NAND_ECCREQ(8, 512) like W25N04KW but the datasheet says it's
> >   based on 8-bits/544-bytes ECC, so I should set it as (8, 544)?
> 
> No, we are protecting 512 bytes of data. 544 is the area including bytes
> used for the ECC operation itself and we are not interested by those in
> this field.

There's also the 12 bytes in "user data I", but I agree it's probably
fine to ignore here.
nandbiterrs passes, so I'll leave it as is.

> > - I'll shamefully admit I do not understand the read / write /
> >   update_cache_variants() I copied from KW,
> >   Alam had the same but it'd be great to confirm using the same
> >   callbacks makes sense?
> 
> There are various operations available for I/Os. Depending on the spi
> controller capability and the routing at the board level, you might want
> to use single, dual, quad, dtr or not transfers. And depending on the
> speed you may need extra dummy cycles. All of this is captured in this
> array.

Ok, so I ought to check that e.g.
SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP still needs 2 dummy op
delay?
(I couldn't find the _1S_4S_4S_ meaning explained anywhere, but looking
at the commands used the number is the number of lines used for the
command instruction itself, the column address and the data itself?
the datasheet doesn't seem to handle any command with a *D so I'll
ignore the S/D...)

Ah, okay, the dummy delay is in byte and looking at the datasheet I need
one byte worth for 0x6b (1S_1S_4S, 8 cycles at 1 line) and two bytes
worth for 0xeb (1S_4S_4S, 4 cycles at 4 lines) so this makes sense, I'll
take some time to check the other ops before submitting v3.


(And I guess that's where I'll need to add stuff for continuous read
too, it doesn't look like I can reuse the
cont_read_cache_dual_quad_dtr_variants as the ops you added don't seem
to exist here, if I understood it right I *think* I need to set some
state register then with the same commands keeping CS down/clock ticking
should keep providing data...? Well; I'll look it up some more too
before bothering you again)

Thank you again,
-- 
Dominique



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
