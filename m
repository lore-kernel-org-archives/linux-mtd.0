Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D83C6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yp2Thp7wjPliUpXH0O5v4mC2B7xLYSe77ftCwSl1tu8=; b=11Zx20FrXP4KYF
	Ib7zeyccTGUt2KsASYkS71DdaseaHz17k6gxPQiucJdhH1IfW+oEdqQ+bQJqIjSt84m/b3FDvFxNC
	RQYj3YIWNUfWDhVsNfzGz/Xa5YjKkiBnVwBWsq2UyF4Pz22suI1KYJKOVHQGyPLnY6qv0rGROW2H6
	ZRg5DeoldATK7HVraNy60q1rm44wVT647S2jMqmYLKqlj384A7tpY6lHfQB6QDwa25SePySVU33k/
	we2vy3Q9um0BRpqU2JjkhN504/NUiOjs25emRmsbqEvrAthsTHzXFS80LdDRLiEXrkjCV1vkrN7lA
	M7eSDZVHHcZ7bnXZ5NaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pie8f-00Avrp-3B;
	Sat, 01 Apr 2023 16:31:38 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pie8d-00AvrB-1B;
	Sat, 01 Apr 2023 16:31:37 +0000
Received: by mail-wm1-x333.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so16909252wmq.2;
        Sat, 01 Apr 2023 09:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680366692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AH+0bN1WVMkRFsPVRu+iIPRXnwUZbJTtFLk6cby4eBE=;
        b=jpepsIRw3W6IDR7ifzEST4IQLONfqEXFBNsHDCkT667xCPSgqnKpS/8OLO5OK8e2iF
         utgZFEWgkcUBrj+W8YeiT4eGdW5h2hRQDKvm4ke4hipJBa7BsFILtoSztIolkU4r7fLf
         yfX1g5loE+mVSHpTYk8ExYQkuTyEMQBicrSO888NQEf5LfnkcC6sPcY1mcVmrds93zv5
         l6OGh3lBmjnEQmer9oxmib9wOfWzAYDDv2nShLa5buyZagYbHyflYzcmnX8kZUBdzBW6
         JMxvAqLI38lQYc2j9ZZQIFI8lNaluR1dy/aLas+2q2P3d7opycJvtT+66pKobZ5Is2VI
         7glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680366692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AH+0bN1WVMkRFsPVRu+iIPRXnwUZbJTtFLk6cby4eBE=;
        b=cSLc8ykgxqOzH0FO8d3eNh6FG/Z0ACEFyYGjVPy9SB01NNpN4NqkAEcPoKe/cMpMGP
         XOlq3E+4Ed2N5zETnSj+5+ClXXBBtkC5GTuZj1LZC9fkMcLqPTgcOwLOSa/4uYxS8fnE
         +86TW7LO8AjT8xrZU9PcZAs2ZAxgqHY7m5WlpBgCLneYMBx6NpJnlMykpIEZKUlCDEuM
         JPBI0a26P06tYeqDEyMQjMIGZA0J7BjUlEAaYQZJbPzFNmosrmVkZlPbnxd21VKMlgCe
         F5INDKp59wNPio7WENGwEDnCpZEsBSWv0nc8obx7RpGHumMs8N8cm/pfqrFdzSDU9yK3
         u2EA==
X-Gm-Message-State: AAQBX9dxLv8VLixXWjvESazLY5VK6McxCHDPLMX95VYzGGDcKCmzLhTe
	bNoN8PXJkwLAS1U4VVyPDmE=
X-Google-Smtp-Source: AKy350byHRXINA1w450E0QwNu7Ahu2wY0/s2pJ12q+ZhfS1Zs1qC/Svj5UvTIxX/n92vaCt+lRHr9Q==
X-Received: by 2002:a7b:cb58:0:b0:3f0:3ce6:9b0e with SMTP id v24-20020a7bcb58000000b003f03ce69b0emr5786431wmj.13.1680366692161;
        Sat, 01 Apr 2023 09:31:32 -0700 (PDT)
Received: from jernej-laptop.localnet ([209.198.137.155])
        by smtp.gmail.com with ESMTPSA id u17-20020a7bcb11000000b003ef5db16176sm6590622wmj.32.2023.04.01.09.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 09:31:31 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de
Subject:  Re: [PATCH 46/49] mtd: rawnand: sunxi: Convert to platform remove callback
 returning void
Date: Sat, 01 Apr 2023 18:31:30 +0200
Message-ID: <2676543.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230401161938.2503204-47-u.kleine-koenig@pengutronix.de>
References:  <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230401161938.2503204-47-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_093135_900476_18AAF33A 
X-CRM114-Status: GOOD (  10.76  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Dne sobota, 01. april 2023 ob 18:19:35 CEST je Uwe Kleine-K=F6nig napisal(a=
):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> =

> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
