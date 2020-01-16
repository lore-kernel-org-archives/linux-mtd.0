Return-Path: <SRS0=QXPY=3F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC293C33CAF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 23:19:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EC8D2073A
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 23:19:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EUP7J75s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryWBTFDf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EC8D2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJY57j9QH0YsyvzYL0RNpgL+GPdm55c6OV/cp7eXbCg=; b=EUP7J75sJGmdX9
	hHSfBbxvqpvgOd+2KBmocbBqvzzoiui+JfR/qKja+d+GQBaEsChjewKaUD4NFR/OTIEujSh2KjtC/
	bhCxZwHFigI4c6ivCd1M1Bjy8KbkAlsUKtWUc4RcqeLQbTou+EHacwXZnqURtilEY12zIsc6aAoYO
	g4zW2605a3kR0LqpErEJBx3t9ZbUn0HhYsgUEQEzR2Ikz6EdnAiOPC72OQn6qHwsasC38HtSF78V1
	p9qxFQKGQPMeENpqWub/Sr3qsP4yj5GRzrbodz5Mvr5MI6dYTr/siMxUz9WrDPygXRjWZ7RRhg1fg
	dGmzQOR3Z3CEyzJrdmWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isEQD-0004yJ-HM; Thu, 16 Jan 2020 23:19:29 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isEQB-0004xU-7Q
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2020 23:19:28 +0000
Received: by mail-wm1-x344.google.com with SMTP id f129so5637540wmf.2
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jan 2020 15:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=urnnO5Ga3ZxYsNA1To0e/dDpxaBchMRSW/zBiTdJxPw=;
 b=ryWBTFDfWmPfxbRu94HV6DwR42ZHcIGLPqK/kdlax4B+qcIy3//TD3dfcK1WcnorBg
 8eqPzUvmk1KAPK1sb9QXCO4TjGWHCDeUvxmmnUdJWnyZp2WdPuM2ZxqEZRLui920bDXm
 TLW0srn+7XdoYYp3hM9mAwMyPZk9JCk4oYdkuNGEdDXJSgbKKTR1xTApVacsxBW+6rMJ
 Jl4eed0D63b5Qg9nI4ovVbXBZz1uqydhZWN0fXu05OrAUysCXmelxt3bW48K1nSd/i6f
 B0bZq7/gW0lJpLv5Vp+ZWX5Hty6EgWbMTW55nT7phFLzSLWk7LTz8ZqRKPjFoIuowToS
 J+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=urnnO5Ga3ZxYsNA1To0e/dDpxaBchMRSW/zBiTdJxPw=;
 b=HOrMm9kln7fAUd6kzo2MkmzB1m6K8ddUwJeo7drvCWg6DUw6rOLDjDAfAFY+DDsCFk
 9VB4CDX0qdJjx77B2NreGtUYwr7SqFU45DGc1o5Vq+kJytmo2lIyLdQ8oN/S2tTQa7MI
 MUtHXqu3Wox5TSBs2ijg414eTx5MpxFBRL7wZBg45ZciEE5436cSd6SFC1JTRge0dHWu
 3/HwfPvkBOBU6IXnRdSYEjRVY7mcJee8op7EYxSVSeASOwdwLvfLEBnmtsfhm+dJ03Lw
 KWOpSRBvfy+GYC1wBkLnjqWBZtDZtXBW3ZW4ONWoQ+xp0vezvrOkKg50BACwLS7mII6N
 nmBw==
X-Gm-Message-State: APjAAAXqUpC0qEecmkMGobaEvRFf2g+B9Hvv+OO0nTBcGR+EdJJdQRIr
 tsmNOCHXFl1at3A6i/H7E6vyhx1nodgop2TZry0=
X-Google-Smtp-Source: APXvYqxm+99uu+UVcbq3aIyDtJVpgnwvCL2aNcT41m4dRDBhkjmoO3cpirmmq/b8nplB1Aju/mDNsJmCEBUJmQgjPWQ=
X-Received: by 2002:a7b:c949:: with SMTP id i9mr1426694wml.131.1579216765789; 
 Thu, 16 Jan 2020 15:19:25 -0800 (PST)
MIME-Version: 1.0
References: <20191130094800.141345-1-houtao1@huawei.com>
In-Reply-To: <20191130094800.141345-1-houtao1@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 17 Jan 2020 00:19:14 +0100
Message-ID: <CAFLxGvykNXqd1c40WyrDCtLpZtoGA6BnBFs8XCQ_g7wWK+xf0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] ubi: check the presence of volume before call
 ubi_fastmap_destroy_checkmap()
To: Hou Tao <houtao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_151927_298873_6A9BA245 
X-CRM114-Status: GOOD (  10.08  )
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
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Nov 30, 2019 at 10:41 AM Hou Tao <houtao1@huawei.com> wrote:
>
> Else there may be oops when fastmap is enabled and init_volumes() fails.
>
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> ---
>  drivers/mtd/ubi/vtbl.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied. :-)

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
