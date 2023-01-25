Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0F8C54E94
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 10:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NeLdJG8vLPTrWmvcMu7HqrodJWKo71ySA/vigH09hG8=; b=W884CnPOcYJU/b
	RypLR9TMh1mNkY+3TCVBXd+ApXjvVcM2ddKsPJY9uffu1WMaV7f5gl0qQ6jrjPLLtXD34682GNZwF
	LJ5CrX3X026CzRNnM1ock20CBcqmiiJmprt1RzT0VPknAVBioNKD5qYS85n/GvfBlDJauONkCGrH7
	McmMFzgb+p2IexRo0SfuC34gIfoFQt5+9q68iP+W0i5Igfx4TCiXhJSXEWlDvISQo7LSlGTYK6pYV
	294S1qDIhUpBit0WBDwg4LR2UxQdQURsGVH46G9jojC4fYGx1gQYl2NMD9maZjQo/wAXVhYeE8oND
	c72fqMJecTMYU9ssDuxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKclG-006r9i-9I; Wed, 25 Jan 2023 10:12:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKcjq-006qYZ-J6
	for linux-mtd@lists.infradead.org; Wed, 25 Jan 2023 10:10:44 +0000
Received: by mail-wr1-x42c.google.com with SMTP id b7so16514646wrt.3
        for <linux-mtd@lists.infradead.org>; Wed, 25 Jan 2023 02:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+YbmCODXrWbUn0nWKxLJPq1L6PfEga2OS1d1Yrw45IU=;
        b=EWZ+hu4S4a62p8gA2V9ZYPkv1qLN+s8IMtIROJN7y8CarZG2svVmLvXgd+cIXCTqYK
         NmDzRiCF06lhNIqcgTEj1tarMHcDsKa7kHDQPaG8pOtIq/W5AbCQB6RvTcD1myTpCzRp
         TRVPIsNn/MVN84z/l/E40mM1M3YZ9xN3d/JOW4gawseKTBi9l/HQ5vDPs0OzNhZfxYZO
         aDNpO0Ibc/PEQId4AU9aFKgNJhl4vADNywb3qlpc3BO7gpS9YHIB2cwG5XYpu1Xj9faD
         FC0dRFpKpviOy+GKJ1IlFSq1v3ihdct8DCv97iaxXiys1mUD8mQh4tZ+cpBZvSJ/9qt+
         sssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+YbmCODXrWbUn0nWKxLJPq1L6PfEga2OS1d1Yrw45IU=;
        b=34EPURw+UJVxB+1w4Es+iyf+3isELgovTOrWSy7aGuQRZaghNrXgoP8/OZTkUmCSsX
         vI60XSQGM7qv8FbmrVB0Nbjx2k2Jw8RX7EtQ+SO1hl8VpT775/sNE7x+dnwcBIpHTuBM
         kvngL03aybtrswjhc6cyUnuvxg6cMg7Mt6otFP890K8M376tSn7n7H1lbcx0pz+rQZ7e
         6L1oFljtOl5wha1WnTLotmhVmptLg4WfflUDDkjBP3tKofCq6AOEUAXzrm/qeN3vaNzD
         nnCly5f1wp2MCFeH9DSxA4LAsBHiIH+S17ZHIuax4JU5Gx4aWn0bB8hQOXJ3xbMxwJTj
         +liA==
X-Gm-Message-State: AO0yUKWB/oyk/kb4E9Eh3jYUvmOR66cvCfq4ccGJ9VfP+ODvxLLP7kxa
	0qaQHmWLzefYc0/6iIju3sUS6g==
X-Google-Smtp-Source: AK7set8k1yyqihkL7lEDeuIamGfJrPidQaf3VL7shCTdtPbifYjaUj0j3ZCA+tCz22qbl5k7/4CR7Q==
X-Received: by 2002:adf:facb:0:b0:2bf:b746:6224 with SMTP id a11-20020adffacb000000b002bfb7466224mr2062674wrs.0.1674641440862;
        Wed, 25 Jan 2023 02:10:40 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s8-20020a5d69c8000000b002755e301eeasm4024686wrw.100.2023.01.25.02.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 02:10:40 -0800 (PST)
Message-ID: <859715d1-a442-7f64-2345-60d0fe28bdb5@linaro.org>
Date: Wed, 25 Jan 2023 11:10:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Sebastian Reichel <sre@kernel.org>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
References: <20230124230228.372305-1-robh@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124230228.372305-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_021042_693926_27990B0C 
X-CRM114-Status: GOOD (  11.28  )
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

On 25/01/2023 00:02, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present.
> 
> Add unevaluatedProperties or additionalProperties as appropriate, and
> then add any missing properties flagged by the addition.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
