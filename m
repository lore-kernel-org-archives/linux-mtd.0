Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACDFEB64DA
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 07:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EMVVDo+4zfcqxrNpicaD2K19EfKNJFlU2kNyhVJyRf4=; b=F11LMDO4qoo54H
	pX9ERIuwLfixxUlg5ezLsSlgLuIEmOlYmgRkeGNMNNYaZ6MNofLsYzf1csmUHVaAq8gR82uRFIaIC
	an+5OrtZzBkcKxhqFFcQgPMCAZQGl9zm8b8Orc3m/5bEV7Jz+l1eI+WAzMyl283gyGDxhlT14NEPR
	EP8dvOZWGEpuEHQnPkLn33WMABEHr15t1TrmLPh2pQQcPxJTUu0Vnjg45K8xvsH8u5S4rfE+aXE3j
	XxvwD5ZAZYlWPy+vKN+z6XQUBcsbZm3aUZ8gZtLa5GeICcy9c7pbE+3BM+FLBK4A0hHn/Ak/IgRxs
	23SXUuY+M0eWZaszgRYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qB9KB-007hNh-35;
	Mon, 19 Jun 2023 07:29:19 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qB9K8-007hMr-2q
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 07:29:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f8d5262dc8so22068435e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 19 Jun 2023 00:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687159755; x=1689751755;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyLt2KZ1ml3YFs4zspiZBVz/E9g010txFpOTIoFMTVc=;
        b=Pc2OELXSuk3q0bhkbW4zrRFF55zimmFa5yhgrQmVR8ModfL5obACiDMDPRXyB+jNB6
         qBz6BwGMUA42VOsFWMTyya2qr6k81OaaMaGYbbGe2EaanBqCFPcAgx0sl09ku6sDZGPq
         +l82A40YUZq3BJcNMRvVp8C7OrDYaQri6k+dxEOpwZD/DO5Eiu0USh7BXnFtujDwXspc
         e3B0bNmHtO17mDju64N3umjT0xQupltnjNgwxssJyjFlGQZQ+tJ5P9vJ4skyIMroeC5m
         HwHs8PkN05WORwjSYX/McEOA+EcC+vNlb8CrgRsh1tupGIcfitvhs59Hd8NLkgNBSESt
         mCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687159755; x=1689751755;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NyLt2KZ1ml3YFs4zspiZBVz/E9g010txFpOTIoFMTVc=;
        b=QalWpcQucqArUs+Z4Jtp+skKxe74gFUtJNr4yLA+8I1SAueriXG+V251TG2s+qxOk7
         WCnxHx+MaQh1uQlRpbqpFwlo1eArdf9n04b2t1G82PcCzraYIgWANvI2+3JvLzFErayG
         nlMnOgTZisdOu+MnoLZadflXtBH2eTBiA8u6hDULA2PMN1g1a88t5tDqM6/tYT0LY1f6
         AARmrJNG+7+dUIAassX/6FV3Tdm0PecbbJC71qWTxpu/CeIms6igR8eL9FsJtbMRyddM
         VaA6adDfGyz1PgPccBvuuRxvzq5NBEnI6h2l72E0P8gO1DHPJt/hLmb3XGyqtIjwNbqh
         XPug==
X-Gm-Message-State: AC+VfDyx79gmd6HDg6A2PSkB3x51SWjv2MaaZzqul+r6L3AHJueygN+e
	ImuteOKoI2Pe9V6WrS68YPIWcw==
X-Google-Smtp-Source: ACHHUZ7A1l63kuBq6xEY3k2Lpf8p/ztr2lQOUbOoKnYdDzeBgkksJGyLV5BOpl4Pz2woqj6hgVZNVg==
X-Received: by 2002:a1c:4b16:0:b0:3f9:b261:be13 with SMTP id y22-20020a1c4b16000000b003f9b261be13mr817502wma.16.1687159754641;
        Mon, 19 Jun 2023 00:29:14 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.157])
        by smtp.gmail.com with ESMTPSA id l22-20020a7bc356000000b003f7e4d143cfsm9731256wmj.15.2023.06.19.00.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 00:29:14 -0700 (PDT)
Message-ID: <cf3855e7-260e-52cf-7e76-8b02b707911f@linaro.org>
Date: Mon, 19 Jun 2023 08:29:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: No SPI NOR PR for 6.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_002916_917103_8231289E 
X-CRM114-Status: UNSURE (   4.88  )
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

Hi,

We're at v6.4-rc7 and I don't have any SPI NOR patches applied.
Don't wait for a PR from my side.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
