Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B0FEB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 06:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVbh2Tmebt4kFdf41XCf3tDMYxmdVTs8+Wcjh8ObP2Y=; b=00t9+lCyW5avkW
	0LUXp8IPY+FIqsn8CIEtleTFr2UoAYXrCpZC3i8KqKot3svc4RexWBQWQMdHIEqGoea4vRzeVN8AV
	J7tGPmZZvMtOAjxo3hFrg7tMM2q7l/CVDQcI8nyAMNy+8zBPv35sUUMfEU6IHdhIE4fMJb7Rn3RVv
	YdfNkBjUy7f/J5RjXAALMd8cyaiocUknN+a5K5zYZwDHDr/6mRQ2puOTmlxhrGChNJ8haGazB0Rct
	IT+mJsm1oKr+WmfnFeVqp2b34TVQ4gqFE4+niJ/0y2TD+a//OqOYp4umWa1eDDAVorjgNxG5L6z+U
	e1qUjNqEnYVVfhOk3U2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMk2j-00D6ZH-0Q;
	Fri, 21 Jul 2023 06:55:13 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMk2g-00D6VG-0t
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 06:55:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3163eb69487so1729783f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 23:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689922508; x=1690527308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xNmlJ3n3qyZkESUqFDbn55zZvGbTykf04wh3VlzzJ2M=;
        b=fA2EDLuWemqTcPzlzlAmx7gqs4R8GeoY0s3ZvqfB0cD8eyNdOxy9CggCCu91rSNuZZ
         tDHGmUIRj8MaHRkmSDPWVXK3IG8+qR5LMkm4heBVzehUyUuxRh2wrCKebGEUlEvzWzHx
         6HwfhGGzKLBEsJjAkXgPoyfokKEmEhJcpmkcL7zWQg9b/4jbXzUxJFrUaB0dnURAV8rn
         bttkywZISAzbLjykzQPS5FJBtBvPVb4kbPR8wywfHPYVxqSS4pnv8aaw/BwfVK/bU0O9
         J6Mz7sD5ZOR/bNfkcEBfMu3DxC9JZKmA+KVTOifgkMkQrojTzDRSvLpBJyuR6Cw35sHp
         6q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689922508; x=1690527308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNmlJ3n3qyZkESUqFDbn55zZvGbTykf04wh3VlzzJ2M=;
        b=IMN+yea8LvXevezxyAwiFBEMeZ20kaiDFYMqx4YVo0EsR2icqZpVi6si1TtKN/DV7G
         R7aQGAidMi39o4yGW83BJwRpyxI70WmvAXEFKrcObTuQ7KpsXNRsVoPEAfr2gRsIqLDt
         PuIJr3exwPj5N94RN5OVbn3KPlZTZmUXyfLZSPmyuSsC9cQs8v7tKK3WxvOg/fj/qi1/
         8QbxGArGv7lcSYwTOP5wttB68z3k8pxTBa1GwxlmLivdWwycLkYsymA10LalBfSZa6qJ
         26zA//t/SBRwfLaSJGSfiovWHEA8LnAepL1iW0CG3Q6zg0VyCVtDXoeCCZZYUw0HN6Wc
         mPcQ==
X-Gm-Message-State: ABy/qLZO45B1j95zeONz9HzfuzO9ycoIL6C7noiCxjLDrlt22oSNrwYq
	mKWRxDKm02RD3fpXbbi4U849aA==
X-Google-Smtp-Source: APBJJlHAMjvc9srETZeqqF2QeqDhmDxQakmm/3s+sSUcsZ9fpOqqrCeUyx6rx6fxFezazMkoh84RmA==
X-Received: by 2002:a5d:4564:0:b0:314:1096:6437 with SMTP id a4-20020a5d4564000000b0031410966437mr847140wrc.19.1689922507952;
        Thu, 20 Jul 2023 23:55:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k18-20020a5d5252000000b00317046f21f9sm3276880wrc.114.2023.07.20.23.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 23:55:05 -0700 (PDT)
Date: Fri, 21 Jul 2023 09:55:02 +0300
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
Message-ID: <587c59c1-17f2-4c16-b2b7-1b1208e7c128@kadam.mountain>
References: <cd01cba1c7eda58bdabaae174c78c067325803d2.1689803636.git.christophe.jaillet@wanadoo.fr>
 <6f3c9139-cf68-4761-af06-462a72bda978@kadam.mountain>
 <03c69172-b85f-d9c2-6fd4-33f3ad149142@wanadoo.fr>
 <604b0c70-01cf-4cbc-b387-8c709c972fef@kadam.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <604b0c70-01cf-4cbc-b387-8c709c972fef@kadam.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_235510_754959_1A1A7AA0 
X-CRM114-Status: GOOD (  11.17  )
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

On Fri, Jul 21, 2023 at 08:37:02AM +0300, Dan Carpenter wrote:
> Harshit and I were mucking with this about yesterday.  He made
> Coccinelle script as well.
> 
> We found three bugs in max9286_parse_dt(), hisi_inno_phy_probe() and
> jent_testing_store().  Only the one in hisi_inno_phy_probe() is real
> life bad because the others do an out of bounds check followed by a
> mask.

Actually wait.  hisi_inno_phy_probe() is not a bug at all.
MAX9286_NUM_GMSL and MAX9286_NUM_GMSL are both 4.

I was wondering why Smatch didn't find this bug.

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
