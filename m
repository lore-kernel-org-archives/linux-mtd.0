Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6679DEB64DD
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 07:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WdZZOuBN3RlIrU6BfI6IyDaLZnjwRgD6Vtf+uYg/dZk=; b=gX0/+XBwO5PIRS
	ZuQ+r/JtiNq5d6+Jv1EIxE9XzgimgRQfps4mcKKdqNU2zUTMJUywmculu1ZoHqwEfpVN6vneBA66J
	8SJXcdn/J8TqcIxf1ArVlV/U0r3tjBLof1Keq+a4p2uZ2MRb1UPp/b4cNXF6Q5cHU4hfTfEDikiT9
	Qh9//PU1fPYWI1xODSXXfRDCcNuk3GAduBxlzyhr754xywVLGt/sd75r5KzBd24LNpTnjGZgvBtqb
	sgM3qxBvnE7hU4lC0v77XoFACVh4MOi3gE6LOzykZ4tLW9Ns9s7AjMo6BZcGRjxlMaAN3U8Kb67kt
	YpLL6Gb0VnfIJ1YBpzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMk7R-00D7SG-1V;
	Fri, 21 Jul 2023 07:00:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMk7N-00D7Po-3B
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 07:00:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbc1218262so13911515e9.3
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 23:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689922798; x=1690527598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cMdrqooyWKqxdTLZ4iD2/9uda0+BohGDRw1+oGm+Wxs=;
        b=b2w37NYiNqObUrnUOJoN/Ki7gxvv8RV5P8wxZgITvls4FnsfqNeaszQpTEO/YPXn6F
         TVnddCcU1jsWn7HABRFksFYzEBpNwDhsGHZB8aSsj8WS3wiReIDzwWmuiYKqYnz/UssN
         EvGgNyRSODHxdfZMt5o8jgFwXiM9Ww23OJCvQpzlG3Ljq7+52acD/QnfB8VNCs/HymLq
         1l7Ga5Y6z14LH+gk57oSwkvq3/06EtY8nxTrYkg0276GOPfhSjUCkmhoXSB5iHKt8OEN
         YwIfyGwnicG/KO9/7EdC8OrEDuHzPgNWtYYjFe5rtIZ+Q2b4VFvUR5K1oGr1g5NxZwAs
         g5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689922798; x=1690527598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMdrqooyWKqxdTLZ4iD2/9uda0+BohGDRw1+oGm+Wxs=;
        b=I6gFrAj36BEEEyZCuzaT+U9bBvI6ScYY1XKAbU2WEA4b1J1mHjCZGM9SfO5oc/sqco
         Y2cH6B/tM2hGwgLE3IUuIwaMrJYYFXZ8qUedoPhA5orif4EyccKLtPPNScDOItb0824x
         llx10iuo5hZTYY2ARwCF1I+cAHN+7KNtndrY+cXROXEAwS9R94Rgqf8EIo6Q1/51eT05
         svPDjlys39N+ULiX5Heyj3TxbDqtWr3esg1zKN+pbskm8UCKeBvAijCQFTjA/6ifOKq/
         ue58uCJR5bipdglmxGO7rwJcrAfgGyTMFybL/256MpnE0DPUCv1A3LKG0KVo+iOqcFsn
         8Crg==
X-Gm-Message-State: ABy/qLbdCIbefDp1Ahm1BTZw+3zqPKCV2QhEFfHHsEBuVTYTS+bzL18J
	pH1NkMe+oCAIkqjfEoT0bXMzbg==
X-Google-Smtp-Source: APBJJlENcMCQE+vF7Mm8olbbTa9ERp9pLxe/B4KBzog7/zYTMzoUX5fABPfgbpcIq8Co9gK+iPBrhQ==
X-Received: by 2002:a5d:4a0b:0:b0:314:4ba7:b024 with SMTP id m11-20020a5d4a0b000000b003144ba7b024mr722969wrq.9.1689922798057;
        Thu, 20 Jul 2023 23:59:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j6-20020adfff86000000b0031274a184d5sm3301652wrr.109.2023.07.20.23.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 23:59:55 -0700 (PDT)
Date: Fri, 21 Jul 2023 09:59:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org, Julia Lawall <Julia.Lawall@lip6.fr>,
	Harshit Mogalapalli <harshit.m.mogalapalli@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: fsl_upm: Fix an off-by one test in
 fun_exec_op()
Message-ID: <3319d61a-08df-42c0-8882-5d4c9037f5e3@kadam.mountain>
References: <cd01cba1c7eda58bdabaae174c78c067325803d2.1689803636.git.christophe.jaillet@wanadoo.fr>
 <6f3c9139-cf68-4761-af06-462a72bda978@kadam.mountain>
 <03c69172-b85f-d9c2-6fd4-33f3ad149142@wanadoo.fr>
 <604b0c70-01cf-4cbc-b387-8c709c972fef@kadam.mountain>
 <587c59c1-17f2-4c16-b2b7-1b1208e7c128@kadam.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <587c59c1-17f2-4c16-b2b7-1b1208e7c128@kadam.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_000002_108784_7B81374D 
X-CRM114-Status: GOOD (  13.88  )
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

On Fri, Jul 21, 2023 at 09:55:02AM +0300, Dan Carpenter wrote:
> On Fri, Jul 21, 2023 at 08:37:02AM +0300, Dan Carpenter wrote:
> > Harshit and I were mucking with this about yesterday.  He made
> > Coccinelle script as well.
> > 
> > We found three bugs in max9286_parse_dt(), hisi_inno_phy_probe() and
> > jent_testing_store().  Only the one in hisi_inno_phy_probe() is real
> > life bad because the others do an out of bounds check followed by a
> > mask.
> 
> Actually wait.  hisi_inno_phy_probe() is not a bug at all.
> MAX9286_NUM_GMSL and MAX9286_NUM_GMSL are both 4.

Gar, wow.  hisi_inno_phy_probe() is a bug.  max9286_parse_dt() is not
a bug.

Smatch would have found max9286_parse_dt() if it had been a bug.  The
reason why smatch didn't find hisi_inno_phy_probe() is because of how
Smatch takes a short cut when parsing loops.

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
