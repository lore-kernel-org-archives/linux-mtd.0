Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB70DC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Dec 2022 08:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LewRyA+OJuybGpUBK+H02tYImMNvDchihb0K29h5FJA=; b=KilwqQsEG30TV5
	EiptMddXjzH5+ydvukvacl+VzEmjTiHcHGFL2LdYHZlqxNvbx2Ul7Kqtyb/XgGAfk/DGIojnyEsYd
	/M+cpjEI/o+yeBeeWOpIo3kO1/3XVmtJ5gMO5Is7vhequwtaY+UKbZi7y1zVTiYYgflMEvnKq0mf+
	tiKHVXhLDIX/PdlORB+13Xz/otmcyhPFWEg+ZCBqJbOELp+cNFVq/MbpoCTx3PWNEeXdoaDyVKBo6
	1I5ghiGYlTG6Na2adJYeO/R71Gf3KUp7JtnLXPpyGiZESCxbgEfqwh+8nq7qD+/XzbP9/9MqOIq5I
	tlqRIrA+SQRn9hp1dkKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7unq-00COIX-Qa; Wed, 21 Dec 2022 08:50:18 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7unP-00CNvr-8o
	for linux-mtd@lists.infradead.org; Wed, 21 Dec 2022 08:49:52 +0000
Received: by mail-ej1-x636.google.com with SMTP id jo4so26248755ejb.7
        for <linux-mtd@lists.infradead.org>; Wed, 21 Dec 2022 00:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tkOSuHUzBTxFkwSXJ90hPWSIh5LICMT5pIVgCEzDQ50=;
        b=oqBs7mzdPwgyRidlzC5e+yBROeh8xMaYm6oCWIi1f8Wekk8p9U44UyhkslGvwceNaA
         5opmRYLKS9MKQ96t6qznlNGNP8+BYBNSrINKtFVAUkew4MTb0KQzQY2nLttG+Qq+YPlK
         xQHcW155w2lAyMTjFnw8EOPGbk37XvgzAoeHwpo6F5ZryU6emN7vWcNqUiQ5yohE2yFe
         Gj1dzGHr/NewHnrzOUHHbVJ7L5butdYwbhWrnqEeHN3rNbP+dDK3Sb6bdakxy91cGqJs
         TM5oGh0BY8HIcdf+2Rz/zgoUhIhcC6C2s8SyXH7ko+S9LUHLWv2brperAQijdvqqt/lx
         dSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tkOSuHUzBTxFkwSXJ90hPWSIh5LICMT5pIVgCEzDQ50=;
        b=wIcUPWgVxgbfX+hzOBMDfyAymDoOstVM/y1Ym1h+5TtV33FYyFOuWD5PLmRklOYJfp
         wvfT/3jIw15PZ4/VqZmFCfxi4yunKbfnyQCSQtMg77tM04wCkQh8XfqxvHiudOA8+uD/
         5DlNXP4B9v56gtAAjLa+qWuxHOEJIsm40kf0O91tP/Sjw2GOhuAexSGFCDLTj+nnQnZo
         aPAlJwFOuskU+8HyrWSVxWNlYChwI7Es5WPBtHcNZz1foji9OjRViWYh/9B0XUy8fC5p
         W/QwPrh+oD5iOPrTDBQPbY8utG1ZI1jfwY5m/9xGTvmKpWozaiLfOs3wYInyLEr7Z5TE
         VygA==
X-Gm-Message-State: AFqh2kr54+0Qd1zJHhgbQvppQUHtmkQi2HKbQtKCjXqqjKmNUD68ZI9P
	6mbcaVi6t65V7EEfGrVACaivHw==
X-Google-Smtp-Source: AMrXdXvfM0m5x2b9n+k7dskqxPIZYdggUAbEdzBLxPMaE9GUYYD8axtNUQl+Hw1cIZ7rgcUiiJJVMg==
X-Received: by 2002:a17:907:3f9f:b0:840:4901:901f with SMTP id hr31-20020a1709073f9f00b008404901901fmr144882ejc.3.1671612588568;
        Wed, 21 Dec 2022 00:49:48 -0800 (PST)
Received: from [192.168.0.173] ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id c13-20020a0564021f8d00b0046b471596e6sm6720705edc.57.2022.12.21.00.49.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 00:49:48 -0800 (PST)
Message-ID: <84378cf6-c0ca-0cf4-c3f2-c65b40bc837d@linaro.org>
Date: Wed, 21 Dec 2022 10:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: issi: is25wp256: Init flash based on
 SFDP
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 greentime.hu@sifive.com, jude.onyenegecha@sifive.com,
 william.salmon@sifive.com, adnan.chowdhury@sifive.com, ben.dooks@sifive.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220920184808.44876-1-sudip.mukherjee@sifive.com>
 <20221221003009.GA280250@roeck-us.net>
 <96b4574d-8fe1-7662-5029-fc375f7b9ac9@linaro.org>
In-Reply-To: <96b4574d-8fe1-7662-5029-fc375f7b9ac9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_004951_368585_AAC5EB9D 
X-CRM114-Status: UNSURE (   7.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 21.12.2022 09:03, Tudor Ambarus wrote:
> Would you please revert the patch locally and do the
> tests from below? Thanks!

Disregard this, I thought you have a real flash. Michael is right about
qemu.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
