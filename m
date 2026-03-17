Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2C2F33806
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 07:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMozDLdep9+sAX1m6d7YABwo4oKzan8Ma2Eqmo59Wms=; b=TFrC1FweiM/9LB
	WjvONe4DDtVPWOqQ73Ef5nAabAog41MU0DW7HPas9+TxgvE4pW//i34iwwgXaWVvjgdxMdTexwmRT
	9mpUvT5trouZ2PFOdG4oixI0JpqbXzln6iZlrkj+nNVjOgsdHjhfnohlAfCqB5bxoZBzZ9zGKJApR
	1yG9NSFt4epQeHUphykAYCUNd4kxwmZNb3MI9FrptE4EX68DuANAj4qhvgQ5nJP3VGse/juqpw4u9
	vmnSjECqO9B2IU/KJg9vmf3vy2QiQfKHeTuiDf/XceY0O4MpdIgincXJp7lGAhvQQxely381rnwCj
	3iMTk8HQlQT7Lzwe/m8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OUO-00000005Xhd-1hD1;
	Tue, 17 Mar 2026 07:05:16 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OUK-00000005Xgo-48zd
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 07:05:14 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b9795ca4e6dso483899966b.2
        for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2026 00:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773731110; x=1774335910; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0pTzuv5GUZXO6R/acY/f1spJxGFies4uUgUrj3I9Fk=;
        b=VT3JfafJkbBz3m7XH+WLJla2H+4Zuk8whXlxn+B4djo8rTMpEmyRelPru/f/PeQsRm
         qb4S8IJCocCnW+KvFpCgOW1SWMS9uZPtDJ4gDHBPuQM6mwkEtPruTkKRlApn4I7bsg2U
         zS/tK7LKO1aeV1UvtkdRxR2fyyL4H7KBWNgxcwZuxR1VRzfMfQG99JRSI91BfFC0CIFS
         uGXhOC99LiyickzeOheIlYV6BIX5v4S2HhdEIZYYNyWNCb5/fNNxOuHV9n7qk3f6oUjF
         yHQ6SkUMEygBQ6ns/Lhcqtr8Y9o4b0PzaVU6gT0ftjAzrh9p15wPFCkcSdUCY0t5RFD6
         wWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773731110; x=1774335910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R0pTzuv5GUZXO6R/acY/f1spJxGFies4uUgUrj3I9Fk=;
        b=BDzhbGDvE9EbYsqs9SGOh4241c5EJP+jiPXna418gyPKJQSV+jYbBmpJQv55Z3fCu+
         eme6yRIga2w8IzAooj76JPv72fq92mcBESXPIN3IW/wCtOJTx4wLTSfulgWKIkvjBI9/
         wbEuZq+Tx69hzmmLqE1PQFj5Us8WbIt5b/BeRXsl9+m0zYtwOTDRjGy4kEVGHLst1QZk
         ZmylZjlbFcJ9mTIU8DLkx8+rUY1Kj1fPV6w0jQmiDqP88HHGiFUJmCVO8hiUqY2Zro2C
         93Afs3wBA1wI3JZ1BVXwE0+nr9ZEJk+ot1cHhmwpAEz8NlvhSLACZQMgsInoc4CItPyw
         ysAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4zsDEkpcLKJmTGfx1MgrT7EXeqPbo7Kd8RaOq16O+PIxaymUoxwlUc9AYhLZ3loL3yvukR6flegU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRNvIwyHwN1Dk7Mnn1sVmha7v9YQmlyLeIX1UXsEMkmGh5KQSw
	NYMrE/Ht5r6KZcZFcbxEbj4NOW8zElAOMUH4qDfRVUGp7RO+072MjPwJ
X-Gm-Gg: ATEYQzxlqdR/lrWRjbKQsUMA3lYF5EzRoJNAismUvcrCpG3nlOdOVW5ysUCTHppZvXL
	p1t8tAXb5zL+sphe23StMfx4NFK84LgsGsD1RXl/zutnMv8NVcH18EjZKDWyc8dXvCaXVeVN7nv
	h8aVyJLELuHACkTk9l64t7yXGRE1LKPI2/cyYIusPlk2c4pBSc0V0+oR2Zfa9y/0Yp98LrnAe8P
	B8p0PgPtafJllnicJxK9OEJKS0YMZWNI9LW+80sY2l/BiJjqXX3ItqPTagRnbRIyyjC5gy5IbW+
	79rDcNoHlU8SQLRuKzRCWp9RVSzbue/y4VEhnvH4wR8tjdfE6rNnef/BcWm+63VNmIacdh56YOo
	uwPM+rgEwTDGojj3LR9436hSMlZqwa4bY2Eiwxd3S2DSEJF4LeMXXSWa3ycMkquEtFNcwlIAVgm
	N7qhuK6pQ0sTMkbkxL497X5Dt30mlWitxVi/ZKeX+Q
X-Received: by 2002:a17:907:868a:b0:b97:b379:b3fa with SMTP id a640c23a62f3a-b97b37a17a4mr455390366b.39.1773731109939;
        Tue, 17 Mar 2026 00:05:09 -0700 (PDT)
Received: from localhost ([2a02:a03f:b7dc:2b00:a97a:8551:7733:cb60])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97e63c30bcsm16449666b.21.2026.03.17.00.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 00:05:09 -0700 (PDT)
Date: Tue, 17 Mar 2026 08:05:08 +0100
From: Olivier Sobrie <olivier@sobrie.be>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrea Scian <andrea.scian@dave.eu>
Subject: Re: [PATCH] mtd: rawnand: pl353: make sure optimal timings are
 applied
Message-ID: <abj9JLf9bvIZuqNq@padoso>
References: <20260304211823.569972-1-olivier@sobrie.be>
 <87bjgogo0g.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bjgogo0g.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_000513_038860_F1A38397 
X-CRM114-Status: GOOD (  16.52  )
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

Hello Miquel,

On Mon, Mar 16, 2026 at 09:46:39AM +0100, Miquel Raynal wrote:
> Hello Olivier,
> 
> + Andrea
> 
> On 04/03/2026 at 22:18:23 +01, Olivier Sobrie <olivier@sobrie.be> wrote:
> 
> > Timings of the nand are adjusted by pl35x_nfc_setup_interface() but
> > actually applied by the pl35x_nand_select_target() function.
> > If there is only one nand chip, the pl35x_nand_select_target() will only
> > apply the timings once since the test at its beginning will always be true
> > after the first call to this function. As a result, the hardware will
> > keep using the default timings set at boot to detect the nand chip, not
> > the optimal ones.
> >
> > With this patch, we program directly the new timings when
> > pl35x_nfc_setup_interface() is called.
> >
> > Signed-off-by: Olivier Sobrie <olivier@sobrie.be>
> 
> Nice, this probably will deserve a Fixes tag and Cc: stable.

Do you implicitely suggest that I should send a v2 of this patch
with Fixes tag and stable in CC? Or do you take care of that?

Thanks,

Olivier

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
