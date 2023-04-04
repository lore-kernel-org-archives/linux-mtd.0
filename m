Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB445C7618D
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Apr 2023 07:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnFl+MLcwM7f/V4d9VNPADGCzDAfhwOlxmytRh9b7hk=; b=YGE5f9spmizeKY
	MeUGksHFZyslryJ4vEXG86mE68u1EZQOOWPtUKmRbj5/pEvNH1k7UYntohr5BKFm8du8FPYVAfny4
	0JHTdt0+qEDHiv2KRIXUe6hSdMPReK+5YpgB1DePXWPirHN+yKD4b7gPw7AF1Qk4G0w4g9nSqC/Fo
	DsAYSBoGNazXjOyHE/p6/DgfR/7ZDY/eV+zQcuEJWv8D+AVVL6Iiz+L6SyeMj0VRjmp5d4FVNTyi1
	+2FStr8wWCSDqHvC9GGcxjsz+wc8LxctQ44O0jbm0rgO/hmLVFAnpxlSuBkwAd3N/17k2Yu2z2DUV
	iHPXrm7UIZt7Swe1qHlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjbMR-000LJA-2E;
	Tue, 04 Apr 2023 07:45:47 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjbMP-000LIe-0r
	for linux-mtd@lists.infradead.org;
	Tue, 04 Apr 2023 07:45:46 +0000
Received: by mail-ed1-x533.google.com with SMTP id ek18so126915963edb.6
        for <linux-mtd@lists.infradead.org>; Tue, 04 Apr 2023 00:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680594342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSqtZRoO+7oxS/Zs6qJTOEa2kJhX7hpILJFi1UXlEwM=;
        b=GvSetiJzd3iVYwQJxnNpYafD/6sVuAkHcFA15rSAN8yLZctPc4fHygPvSV6sJVCzVK
         uiyHWJGzpXQRS+mIVip1KHcWWANUYxZ6MQhFOLJfyRJvdhCYYcguNwZ+iWjqfLg/0V04
         tJKbGeztPA0OpywnHLEVe0ANxxC6qd++dLBEVSrpIgjTc3or1vecnYUYgr34QdZyT4I+
         k3kdIkMEbgE/gCD0doMh3r+r4wvn+F5wFT0faYIvj2tf1Hs+4pnbaHRdZL76GhI9nVnF
         IvjnNKD7qcE0hyXT4+lfTqzEuEBU3D6aICvOwHiBn7vDYlrs2Ka7Aw868zO3t7nNLG7c
         xDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680594342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WSqtZRoO+7oxS/Zs6qJTOEa2kJhX7hpILJFi1UXlEwM=;
        b=jeDkmmH8O7lJ3DIm5WmN3SAYjmtTvZ7P7zVYolz3/AWhKbtpZneMiv6xmITmELisjs
         JGQ32wL67wVChmTCH1DGxE8TZJcXGfGZSWdGU59WErNa1Rf2clSa8jEXVK+KF9etrsJK
         Opyau8aw/I4l289IRfnYWvmf0SiaG7tcCooQGMqq15K3UZrytj1RyfKXgfDv9jS+FRJA
         6cYftzTSYgtVIlXGb7cLccjazvoEw1WUinoIVyuL9TprVUCeVTdqfN9JTMsU8G0PlNET
         Jdx3x0qlpMWCuvzmME26Er5DNRYSidTUZCOIqEN9qdrCJcHSb8U3hlH2WgWt7YLT/lCG
         kumA==
X-Gm-Message-State: AAQBX9d0xKH2p7Ml3hrRH9yAq1U5YllWr7OvCNOMM9xTJvMOG9jrXaT7
	RF5SGd3J6oE30bq97ck22+bxCw==
X-Google-Smtp-Source: AKy350Z3MM5JqSahgjKwjpZjaUWuz4ULqKos1WYldHF0rRpjXXUgAQJPvQ0r02V1I/6OZM/HPk1aNw==
X-Received: by 2002:a17:906:e24a:b0:8af:3b78:315d with SMTP id gq10-20020a170906e24a00b008af3b78315dmr1337161ejb.23.1680594341917;
        Tue, 04 Apr 2023 00:45:41 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id h11-20020a170906530b00b00922a79e79c2sm5603482ejo.217.2023.04.04.00.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 00:45:41 -0700 (PDT)
Message-ID: <86b0ce12-0933-1fd7-d9c6-6e18ad7a9c56@linaro.org>
Date: Tue, 4 Apr 2023 10:45:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] mtd: spi-nor: spansion: Enable JFFS2 write buffer for
 Infineon SEMPER flash
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, stable@vger.kernel.org
References: <20230404071715.27147-1-Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230404071715.27147-1-Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_004545_334400_32C2820A 
X-CRM114-Status: GOOD (  11.77  )
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



On 04.04.2023 10:17, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Infineon(Cypress) SEMPER NOR flash family has on-die ECC and its program
> granularity is 16-byte ECC data unit size. JFFS2 supports write buffer
> mode for ECC'd NOR flash. To activate it, MTD_BIT_WRITEABLE needs to be
> unset in mtd->flags.
> 
> A new SNOR_F_ECC flag is introduced to determine if the part has on-die
> ECC and if it has, MTD_BIT_WRITEABLE is unset.
> 
> In vendor specific driver, a common cypress_nor_ecc_init() helper is
> added. This helper takes care for ECC related initialization for SEMPER
> flash family by setting up params->writesize and SNOR_F_ECC.
> 
> Fixes: 6afcc84080c4 ("mtd: spi-nor: spansion: Add support for Infineon S25FS256T")
> Fixes: b6b23833fc42 ("mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups")
> Fixes: c3266af101f2 ("mtd: spi-nor: spansion: add support for Cypress Semper flash")

Would you please split this in 3 patches, first fixing c3266af101f2,
then b6b23833fc42 and then 6afcc84080c4? It will help stable team
backport each for each flash affected.

Looks good otherwise.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
