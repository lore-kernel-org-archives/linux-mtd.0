Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50114EB8FAD
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 06:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ymLWLwq7uRRkdRgnU/jW4w0ykDeXXMB1z+xCHflrSYk=; b=MqY6brA+hV0IBX
	QArWZ90jyi8pvbOKKGeK0atUNRHui8gWPnSILscer9vjQfU8rIXc/Ie1WmAtMmnNjLvl3WhYpTTUu
	oAaFw5REfCye+fkhyAwpK/5cw+eI4dgH++R4W74bEmqTtrjp0jFaxXUDj3JKvoERpl+rGljgtnYcC
	PKFxTcTHoDQiDVkyvNhaxzD0tXLtp/mcfCP4Xd/Ck/N4vhQJAJhyeqPG/i4DQkUqs63kJFpCZ2/Wr
	zbOqkdPKo5ka39vGBxJpsgxgBXAyCuP5KPbOvMW4GljOKS/1Et9KuUVxq2FUOo6bbUzppwqUtHYBM
	9HfA0x1yn3xKNca6rv7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdleL-007Kp3-2l;
	Wed, 06 Sep 2023 06:04:25 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdleJ-007Knz-2B
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 06:04:24 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9a1de3417acso124190666b.0
        for <linux-mtd@lists.infradead.org>; Tue, 05 Sep 2023 23:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693980261; x=1694585061; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PcgL95jlhuL9v+UQ06Odrz5kXmZyQ+NUuEBVUZMU0fw=;
        b=JxCrbfHUE33lu3aXyLqw0jTV+df695rqeYXdGHBxs85JeAEcxvVJbu2fyfDMLaUiQJ
         6D5J+YQ7OM5b5fppcxAPX7vnCOixvM5LfxlJA7GuEW6/IWYwAIAaVIzQ+krd6IkyuetJ
         KloknIvIEP/xlg/k5Hm5TBBuURPca3Xaph/gYsQcea26NdbatUtEWt0JF5ooAMlwu07n
         idWPdcGSIcyDGCwYalBdSlGkAJgIGnrSxNG6E0GLcAuv0cNRAPTeovTefSmvhK2gc2XZ
         GIffQCYt8eV18r3w9cHavYXPB/axjo0vJNFSANlDRO03AXNtYYsKVD6J0zd4eShBdzxj
         Frgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693980261; x=1694585061;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PcgL95jlhuL9v+UQ06Odrz5kXmZyQ+NUuEBVUZMU0fw=;
        b=U32DMCnSYlD6kyKAhKNajr8fRGPwBF8S7CfK3ilq+Ss1wjO4GCAj9CZgR+dGADBijt
         ysmvYe9bxivPss6xuiPAZhfIVKKJ6hcgjcQz8k73YwbvLW/kHWG9uzbGjJ5SZ5KhOd8O
         F5fuDfDdy8shtNnK8DEUPM8z3eDnssAMBXZ+ytzfm+OqdMhS9M1YQ28PairnfNbPluFf
         Ab0Ifx4u9YwXCsSSjfpvqGVHAYNSh1S8JTD5LZ1Q0ImakACEvfX6slDja7cZgCfqooS8
         j1beQNcuXF+tt2FzXx5iBQhtUk4NjLtfkcY2CLqKgImlRnzHygpkxWVyUnxVPwBAg2UM
         74tw==
X-Gm-Message-State: AOJu0YxvrLXI4JWg1JwOgq7pVdGP7WWP2LPdNsFThHqnxdU6uVzb0Pv0
	F/NxzHJFHlbVgUWA2dgeoPZaNXZyruOlscYoYpk=
X-Google-Smtp-Source: AGHT+IEEmHWRBET5bV2i98awi2oScToFvbEe0MfeN2KyG+2Pmif7nqbTrq/EpyAFFYAcbqWll6W+AQ==
X-Received: by 2002:a17:906:58:b0:9a2:143e:a070 with SMTP id 24-20020a170906005800b009a2143ea070mr1823949ejg.20.1693980260959;
        Tue, 05 Sep 2023 23:04:20 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.137])
        by smtp.gmail.com with ESMTPSA id ov22-20020a170906fc1600b00992c92af6f4sm8658029ejb.144.2023.09.05.23.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 23:04:20 -0700 (PDT)
Message-ID: <aefff5dd-925a-41e7-ab56-9c3328b672b7@linaro.org>
Date: Wed, 6 Sep 2023 07:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/41] mtd: spi-nor: introduce (temporary) INFO0()
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-12-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-12-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_230423_718877_E55B0DF7 
X-CRM114-Status: UNSURE (   9.46  )
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



On 8/22/23 08:09, Michael Walle wrote:
> The id will be converted to an own structure. To differentiate between
> flashes with and without IDs, introduce a temporary macro INFO0() and

why do we need to differentiate between them?

> convert all flashes with no ID to use it. After the flash_info
> conversion, that macro will be removed along with all the other INFOx()
> macros.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
