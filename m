Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C92CA0FE6
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Sep 2023 09:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tC++yTqtsu2BU1yfuyjQGTfoex/3Yky4luKSxgKwE0=; b=QGVPWGtVH24uDC
	sbi3dvJ82x050Rjy7Rd1csrBFr6cUQZORXKeJfK/o1lx52uCK1BVDRNGYi2XU5/OZcrIAjTuyUhdo
	v4Ju+Le+ENT6cJA4Aymm0o6un3IrVVnHmgYopahNf3RDf91qbmZYA4mN7EwmMzhNzWN478X5+TEwq
	pdoYWbZZJoKOKw/+ESMtkc2ICBgJt9E3d58Y0mcF4//i+LdyarB5XDmdGmO5XpCyctXIwzglf28Yd
	Dgui2BmYI34b/VE0eCVBYTHa95Qmp7PJAq1DfoZjZ54tv8B2syx56NMJzxHudj34VdupRPL5pS2zA
	AFjai8bMGZCdvPnmC3aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0P4-00Gjoh-2Y;
	Fri, 01 Sep 2023 09:25:22 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0P0-00GjoF-2y
	for linux-mtd@lists.infradead.org;
	Fri, 01 Sep 2023 09:25:20 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31aeee69de0so1421571f8f.2
        for <linux-mtd@lists.infradead.org>; Fri, 01 Sep 2023 02:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693560313; x=1694165113; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oTGLQ9RMDVR0y3AOy/tBoeEbs8t3ANrqtlrlVbsUQCI=;
        b=ZEe3Rk+S6G44xZWg+RCUYqp7ZWXt8GghOtuClPdbc/L+Thi0cHBKbZx+rF6lzcHsmN
         FttgDtH7gx8vXDnUsODjsZ31xdhP+yEcNWY+sYe/SFGxEaI+6veNW7GRUyOvC09Pxe3O
         7OulL39vu5R/x4yI0+0PYEQQ4eGF5Og1xoEaoIyyVDxReWivoHT8AjNTm93qSBUEh6Zm
         96roGrHjcaJoS81i+9Lx7qTO3piPoDHUlWIhSEW2PCSuXzLcwwceqIJEO+9Y4PG3QNTC
         QiFg8hoZ6b/zt2H6R5FtSuLggsn3VKNxZSLsPAa4N1raqUdaT7xtU6bbSb8IdVSI4xzQ
         Imzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693560313; x=1694165113;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oTGLQ9RMDVR0y3AOy/tBoeEbs8t3ANrqtlrlVbsUQCI=;
        b=ZzuCWSQd2QJYqqbxIngM4tSlet9XcTgtFbvI6LYzP4Yp17gIB6Bs3pay+vmjBtbIZS
         vUN+btkTePUab+cfHAn6+Iq0XpVCAZEEkP75liIfAjGgKHVhkpe7ueLBo6BtIVTK/h26
         H6RoUICGslPVgez8/JEpB1heTWhXnr6NFRiunXyAQCCKA2JsKFxs7CoZ38oD4sJ8oyzl
         Sl9IDUW+8IWSTnQntJcBr1hn1BlhFyqE9IMnp8Q83FNI1jUHsamZz/KR84QGNf5sPPhc
         KzOke43llx+lVsIwWOgOvIYDoUtWCw/cm+pgaNCeJPaP8231PXjDdm1ZyprVGv4QnKXc
         yg3g==
X-Gm-Message-State: AOJu0Yx2YKojTJRcImgT98mDdCbycK8R5f2IeCVJo82k3e06OjowREgk
	v2b5a00PzYHejQBrHXVc65/N08wCcQ8aGH8RMPY=
X-Google-Smtp-Source: AGHT+IGR5178JfoaY3KaIp2ip5Yj2VJ41u+CU0PxjlcO2+ZnxZK7nb7jlwmjlHzx57GPNwt+wInJgw==
X-Received: by 2002:a5d:424b:0:b0:31a:d551:c2c0 with SMTP id s11-20020a5d424b000000b0031ad551c2c0mr1618092wrr.57.1693560313297;
        Fri, 01 Sep 2023 02:25:13 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.10])
        by smtp.gmail.com with ESMTPSA id c20-20020a7bc854000000b003feef5b0bb7sm4247725wml.40.2023.09.01.02.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 02:25:12 -0700 (PDT)
Message-ID: <26cd7b8f-abcc-410f-a7c7-e691999f4e3b@linaro.org>
Date: Fri, 1 Sep 2023 10:25:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubi: Reject device with erasesize 0
Content-Language: en-US
To: Jan Kara <jack@suse.cz>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>,
 Yu Hao <yhao016@ucr.edu>
References: <20230831111100.26862-1-jack@suse.cz>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230831111100.26862-1-jack@suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_022519_773868_E3FEF518 
X-CRM114-Status: UNSURE (   6.96  )
X-CRM114-Notice: Please train this message.
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

Hi, Richard,

On 8/31/23 12:11, Jan Kara wrote:
> In principle MTD device with erasesize 0 can exist and it is possible to create them e.g. via KVM. If that happens UBI layer currently crashes

mtd devices are organized in erase blocks, having a mtd with erase
size zero looks suspicious to me. Do you know if there are any mtd
devices with erasesize of zero?

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
