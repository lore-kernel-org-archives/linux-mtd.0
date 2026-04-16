Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7445AF8A14D
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2026 09:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tj2/S578iKhx8msVvkEw1zn5RQ8MiVKSUdIJ6kq0e+A=; b=gnA6bzFhgraImc
	HY3KxPK50bnmzzl/DwqSwd6jmdKHWERpBGQBwrllq64Ezd23sj3nT60xyD+qCY5yGClRO0RfKtfKz
	OeQ/QJ4IA7DkjjVnP5EUfYNsRcA8lZCYLcv4CiDelY5nepaQn56ojrGZP31VcKOAITTioB109H3iN
	OhDuOq2aHf4vdj9aUIKfXQ2brcPQUP8CBtFHkh7YF1G/OBq0yXtr4ZSME0wBChyGRhyEKhkU+pN8v
	C0If62iv6e7N816cWNG9fFwz5KLJW5GxwyqpdvMf8W1RaVanA7U5FyKMguXtKzyvFIWbwD5oM9Rlx
	TgVwKnyk0Lz31PU2ocjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJ5D-00000002FOQ-0TiP;
	Thu, 16 Apr 2026 09:32:23 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJ5A-00000002FO7-1kde
	for linux-mtd@lists.infradead.org;
	Thu, 16 Apr 2026 09:32:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43d7a5e77b1so282103f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 16 Apr 2026 02:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776331938; x=1776936738; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=E2ybdNuZ3XUNGyDkVPR7mRG4NeCJm+R9zF2KrENk/Wo/QiwpbY6Y58rBOkZ2ujlIaS
         7kIBMUgQbN/GJlF5cJW+Mimez1LXrhSDJhioLo2aLXlv5BxHZQ2+W2Sr33SD2xYoPiPp
         ufErnToFVSanujp9ngOEcvEjbDtTCHSQEvbYYhzKRXV1hL//2EqjBPNFMH8Vm8jMUJm0
         eWc1BbNV0vWZ/p33PSImzu3FpYxctEaSOuiZUlU7ne57Pc+ycKMgx1ZnrOMf9tP5M2/u
         wZMGtThJWejYsPC+YOnnxMqrCgdIsK/FweKtPDi1QlrT+EDkeSL+H5TR8fWUhWvokNzP
         QX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331938; x=1776936738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=k7jYMsS9aEsJhn2jyE32k+7fKkc45utQZr1sOqnuvroI5TkJyMUdy0qLpqkmPlkEMw
         o+wU5aPsDUE9V0Yv/45j0rLol+GYLpnRMXRv3eC3drzxUG7ESlhpNo29ZCJabm6BS5vc
         lXPqmisHDns5oUKW3Kgp8zV7iyrUZxGrdMXmsBAIpiCCaQfwoivxmCAge8CUwnGLc6Gb
         8JpYHbexnEpMeWAuYxrtQDi0DZa9QPEUcDqAjIfNc9Be+lBzsB5t06VJoWMjRe9FW5KJ
         icFOmV77dUJWOTVc0t+LYrCHdS0lI6A6kfdU8g0kReCMQSjE2bbVGL0a/L0Z/zDsBK3J
         593A==
X-Forwarded-Encrypted: i=1; AFNElJ/Cufog0nPLWpy9AfiQQ5Xcpvls5vFwbXE2yrcoxboRz5QHpA+kIdkdmAv3lnk1LJshzq/UKE6qSFg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwK7WkOmeWaPLRj0BF9DTJ/tL10IsTsFhYyBnAcl6M8O+Y8QOCI
	b75f8Vt5n2sMnW4FnjEsONVitM764GvOaK+J7xc98LxySBKVAUVAGkvOTotIxaoHepor9Eho5GJ
	hd1qtN64=
X-Gm-Gg: AeBDiesZdFEH7mI/xaGTRg5ULuFy4luYKYImUd99KNcr84xYhnRJzNz/FJ7fdRqI/VJ
	3xjH4GBHPd5+roUGMEGiKObVOSm6DG6nANlxWTYgr+tum+/DOXMZu+MXltyLHEWSB9zg6ISy0bd
	Vv02h6Bymhr9FBWuAo3hFOMcPsniVjv9NKz6SHgCT7t16kwFYztwanj4Z+pxNKf+YRTNKLfnkke
	DxWswrrSnDQbmnZp/Z90pGM7WaGVBNbx1cNNO3ojnRd3KQthlR6X+DZntKuig4vr0SHDbBjIHSv
	JkfHKzihx9LiweIuHHdb8JukXGirrwG91bhBLlS5g07vhn65SRSPWh4HO0ckZdsMtJmK+8DHCks
	iGw9kuHifg0ltwy+MvXDs3DrEp9N+m3rHtsB414lssirejy0Av64ZGp9C2f0UFJzE84+yvO6bCY
	4rxrPZVv8PKbNnZ5HFUD72GcTNN67p4N6MTS3e6qDc8g==
X-Received: by 2002:a05:6000:2a0d:b0:43d:210:2b2d with SMTP id ffacd0b85a97d-43eb1ba57fbmr2907897f8f.31.1776331938365;
        Thu, 16 Apr 2026 02:32:18 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5eb4sm12434350f8f.20.2026.04.16.02.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 02:32:18 -0700 (PDT)
Message-ID: <9cd16c55-ba25-4f8b-ae27-e882d0704e63@linaro.org>
Date: Thu, 16 Apr 2026 12:32:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: remove unused NO_OP_CHIP_ERASE flag
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20260416090320.21699-1-Takahiro.Kuwano@infineon.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260416090320.21699-1-Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_023220_484864_E9ABBB92 
X-CRM114-Status: UNSURE (   3.79  )
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


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
