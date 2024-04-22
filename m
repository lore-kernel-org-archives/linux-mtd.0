Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43534C4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Apr 2024 05:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9DDp6xZvLTu+JEay4DNvX3gdPUgNbdezUUdR4f0DZM=; b=pRb6BI6h9ejXxX
	JeGREvm7ehEZ+/s+zzfHcY8a17Ne7MrQdb9rw2l7dbwPjV9kimDfyYSz9lbrAm7VE8LTRMp+HPmFa
	1A+EactOF0/4KMFmA7J6cKWUDqt8YE3niDvg6Cd8tC+AIqj17J0PYLv4f140zPkxedtlNEiu+dJ7/
	uuz5lI19t5TChFTW+f4fMUJfTWfGkL8smuQWkts8rszBx281Ek/JjU/1DwJxA1enuTeE7emSSu5Sz
	Lt14enpwtgf2DUEqNFHApX8dsB0gBkCekvCQlQTUfd00u7JzOLODcWUR6aj3GwDO05mbjTLXqmSga
	OQ0TECTXhnRxDdomdsog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rymea-0000000CBiB-3svS;
	Mon, 22 Apr 2024 05:55:48 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rymeW-0000000CBdo-2je7
	for linux-mtd@lists.infradead.org;
	Mon, 22 Apr 2024 05:55:46 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-34af8b880e8so393717f8f.0
        for <linux-mtd@lists.infradead.org>; Sun, 21 Apr 2024 22:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713765331; x=1714370131; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=g6cko9m3ZQrVZpoFNmloLhuZ6ZsOZVfIvotCeIr6WE8Pv30XHaAKV55WdrPFuinBt/
         oRRyg+pHy/Bw7IZN49WOA0XZTEra7Pw+D1yVowtCLUMwWgfNOyYgmK/yK8AfnnRHGQsJ
         KGN++NCLsjKYvwdp7F64plwE47KqBdmggE5qGb0q2I64ewzON3ZvaT1m0yDo0UBB7yEm
         0ylKNqV4lZiN0rMpkHxCtin9BIoLaEtr+hrDKx5jagtbBn5/1bMX0KII+Q4j6gSAU5c1
         t9Xj8Qc5qG2/WdKAbs2YgPa2GTW1AalTLyhE2YkEcXkEqPvLnsCgJoivVzscOHkvw3fr
         S2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713765331; x=1714370131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=fqqz0rXwZuBqbxzymoZQDNTQJxg9jDRG62yVyNpV6tCS6OfmkpbZFW0BE0wELhUk8w
         +VYj7d4mznjDuQchHEqXH1umjhlra+ErQrST23h5CD6wX26EBa53yeHaXHV79IhPV6vs
         OTFBBu2+2mgiiQX6T4nm2wL4Xx2NEjsUESmzY+mwHWsyunwUwpO9mhUOde70/0wii0Eh
         EVrvFw/mQ525ai6epBxI6H4J9eYqa6ePn0+ec8O7WQOMVMs+1thja+kQKbiiRX8cKSLT
         Jo2+7WwhVIyIerGeVPYGHifThlhv/2BjYccB64OIAVOhz6QA85FhQCQfguoxKe2+oMrH
         UO5w==
X-Forwarded-Encrypted: i=1; AJvYcCU8yVxDsy5ZNiT76FkUQuz6srY+KJWIPxK3HU2l4ti4kDCNS/oZesXtgEGlRsjKD77aWbGq6/Y4wOKp1MVE1sNQ5HF/91GP29swB+NmEQ==
X-Gm-Message-State: AOJu0Yw3XqcfiirQ18LNSga6kQVy9bQn9OAy0KDYk9jDHlMyHaqy+2Sb
	zQc3W5tXw1ULpPKw4cj4MOyKKnAHuY8135tasHF9gSKPlMDNtRGd3FRjICQewGQ=
X-Google-Smtp-Source: AGHT+IFwehGoU4C7S7pThJD6H5xRO3FxOWtzO8AS1uALt/2FKe01ucEOx0N/yELDrpV+GVGYiGh5IA==
X-Received: by 2002:a5d:5706:0:b0:34a:4fa9:81cf with SMTP id a6-20020a5d5706000000b0034a4fa981cfmr6267897wrv.9.1713765331011;
        Sun, 21 Apr 2024 22:55:31 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.100])
        by smtp.gmail.com with ESMTPSA id e5-20020adfe385000000b003455e5d2569sm11203602wrm.0.2024.04.21.22.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 22:55:30 -0700 (PDT)
Message-ID: <b6547140-0d2f-4e09-8897-5e557955e08c@linaro.org>
Date: Mon, 22 Apr 2024 06:55:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] mtd: spi-nor: remove .setup() callback
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20240419141249.609534-1-mwalle@kernel.org>
 <20240419141249.609534-4-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240419141249.609534-4-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_225544_779738_02382401 
X-CRM114-Status: UNSURE (   3.96  )
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

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
