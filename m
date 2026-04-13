Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DACE93817
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Apr 2026 05:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=OFKIy3/YTLpBWx
	f4If56oLOzbW4zt89raFR5VTIaeup2I/A5qS5TmZd7FxZjfwh9BV9hJWuML6jCysoX6ZJqrCQLqX+
	Yq3Z1ZLYs9tOC+RPsO+/H5REseeSZcsBc3a9Kz8fgiLv47lxVDR8m72Ts4GQzV6IA3r0luN7JI6G7
	WDKO0JkUrztmRKKt5raOuz3VB26l/yepMyodCmr2LSpHCXRDNoh+pbEolXsdCQwoW4prVjKGxglr8
	R6gM/xN6vm03lurPSTqK+HLB598R0cnLHsgKZDQcbifgW0vMsk/lv4Xx2js1oBMZxn0QAYQeaCwcd
	Z1DUZXk+ajCGEllYektg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC9wF-0000000F1Mq-3NKa;
	Mon, 13 Apr 2026 05:34:23 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC9wC-0000000F1MB-3kOj
	for linux-mtd@lists.infradead.org;
	Mon, 13 Apr 2026 05:34:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso67798145e9.0
        for <linux-mtd@lists.infradead.org>; Sun, 12 Apr 2026 22:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1776058459; x=1776663259; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=kpalJMQX2m0A3qk2ml3bkPaEEa9FWK0BxPIiKVm+yKUlplwW743NmabuFv9fVKD7yo
         GbQrCgWpORroKWB0EFs7P4bqQyp3WKM762p1FC80PamHg/sdOuZLN3mQNGJpAgD4hU8w
         AiQ5Sh8W/zb/68VZcacb5MF8AU/IE9SFqhEu20mSaxhV/DCP3SoWo2OHpyk0+c2WR0cS
         DTzp9F9aiJsm/0Wh5nUzot+2ooQwq8J3SkdD5RLsuOJlWQ8xeXprcvlYT+5oD2QQt/St
         WsOtra1e3uReTRgBelgml1oNeHnvWZyfoVeWuqhzTjKNL1t92ngJ+AUYQWtNvD/dirL6
         LZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776058459; x=1776663259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=FsMPua3avZ0Io13NZFVIp0E7QY/tbs7VWFHsz8lK6iGUKOQ1zItabpBpz85zL2CLDG
         MzAFuHPIFQy3dipW0d8FO54eYJN62QQn/djxlFhvq/ULafkMwgaHCUgu4KzX2yzD5+D+
         ahv70O5LhYmYJoCCHoFTEPAbKNl0u14xilSEcAVmMkpZzc6JQQFcGYEtYmJnCoAKYW1u
         slHvuSkAKslBw6Oqsh+achIQEDJmkQy/2bmIH7B4C+I2fjZS+JZPQhb5Rd1fseTPBmCV
         oPtoSAJGIcR1usRTnpriJD2OSCzZRDXQximCJsoJobXyYFRQSgYbrVqBE0uOMr3FHPWw
         QT8A==
X-Forwarded-Encrypted: i=1; AJvYcCXjEFJUTtLtxh327hGIOvsm4/fhMjdn2K0Ovxw/RbX2cIIMWOquOHrmlHZfDv+zmiClJkKEZXjoARc=@lists.infradead.org
X-Gm-Message-State: AOJu0YysiwK5CmUgq9km/TqYawwJ0xyZoqyhkzkBIos8K3RxbpqVbGRW
	IdkhqnzvVSA4TI1MarQs2LUGdgEqxD1a7skOG0UOMisGrJK4XYU8PUBKuEeZaeVkAVc=
X-Gm-Gg: AeBDiesRlPBzSWw6w4AyKR6ve38qwQ6fEH06IJ0Wo7s8n+UGbA1zvlFm1pSlMOHL1kl
	FDqqdAK/SWHVbZv2uO0IugJQkfTQcEcOBQrer59kJu6x/fQK3d/uuHKW3t3SrQkHytHaYmihMSF
	tjozdQy3GXKQr6PzFSiPCQTWChtIHz4IcF+73+Ahg1uTqNiJMbpgdKOWPjbkRQ14uvvCsDw/u6s
	V4OvMV1NoEbSR50YJw5hpVd3i7yhEeenqPdkYvxvzu4fBOylV2RFy2+pY54fETOK0yEL81GZ3Q0
	Cp5rfnngo2i2Fjz1sd1sPGGkMpIA/YNxKl20wSHGfSkhOxE/iOIEsudJ0RHuAYzZFIIZkF/HepF
	ian6/ENGHfdaW+8iVsNfTwkaMlehDrIf75pNiue13H6cQAfmjm7hEYe6rJiI6Qn3S+cdXeBoJvo
	AC5jhV6GA0tiLLLEXPzuaGLcYgynmVXWOhBpK77onxX/uOwg==
X-Received: by 2002:a05:600d:1:b0:488:a2ac:a334 with SMTP id 5b1f17b1804b1-488d67c720emr142317335e9.3.1776058458972;
        Sun, 12 Apr 2026 22:34:18 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67b4903sm110566355e9.5.2026.04.12.22.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 22:34:18 -0700 (PDT)
Message-ID: <5c1dc6fe-5f8b-41a4-a08c-ad525bab8888@sigma-star.at>
Date: Mon, 13 Apr 2026 07:34:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mtd-utils,v2,2/2] fsck.ubifs: fix platform dependant ino_t and
 loff_t formatting
To: Zhihao Cheng <chengzhihao1@huawei.com>,
 Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>,
 linux-mtd@lists.infradead.org
Cc: Yuta Hayama <hayama@lineo.co.jp>
References: <285fc676-0f51-41fb-83c9-b95671af4ada@lineo.co.jp>
 <20260213135541.1655355-1-tomas.alvarez-vanoli@hitachienergy.com>
 <8e2c1c4b-96ba-14cc-5045-e1af765098a5@huawei.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <8e2c1c4b-96ba-14cc-5045-e1af765098a5@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_223420_951746_8F41C996 
X-CRM114-Status: UNSURE (   3.11  )
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

Applied to mtd-utils.git master.

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
