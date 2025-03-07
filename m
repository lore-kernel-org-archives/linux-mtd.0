Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B26C282DE
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYEkzGGhdSYHema7sUK2jEwa0vJdHJVD/8MpLDfT8pg=; b=ggpODofnawbWNX
	9auzaNUWk6EiNgdjElGuf2rNzryXzd8G9F4rxtA1qVhRa4Waam+3XMr/j2Fi0HGwI1cC8XtJxw4uY
	ADEgmI1gnyLaU3GOiuC+8Z73pm5b7o35+EzuSw76E4RuC6Bggsp/wher+KiU7L2AWWPwISNdJERXx
	5JNRdeZof2srkcFDdqX9P+6IfF9gHenQ/bK3iZzx0KgsTLZ3oYu4BviLnQhrsEfgeU90ucFqd+x4+
	/xUcRRaMJUWy1x07NfSQw2Sin+2Nye+lLeTOXLcOllzUBN/q8XL4ufuRuLTf3drLKPiAKuv7nL0y/
	VWJB6eDIKBtwtFBhCf3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZuE-0000000EkaM-1S2w;
	Fri, 07 Mar 2025 15:46:34 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZqL-0000000EjcF-3Ima
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 15:42:34 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e4f88ea298so3486605a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 07 Mar 2025 07:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741362152; x=1741966952; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3YuW0oXrBdYtRMAGRMastKIQLtGGLBfW0tz3GbiXdp8=;
        b=LZDnjV6ELj3L6Hk6AihF0O2HnoTrG560vFSzWo2OyPZ5CL3WiebPo2UIkDf090+DgA
         i5KqOpUYdKkGEOuDUOCauEKv4vH4WrFMCGoyrLGrfmJV8aJ4SDF/esUVkdqD8Lwfg/cg
         nTyfdV876tNI6mDSr8K8sNaTsAbjO1K0ISQO1d+P09STkLfELHpDEYg1SiqCwGrQ0gkI
         geqz2b2rWUOWTS4PgeP5RIHvj+rvlRqeyjWGDT+7IFcX1q0dnZaXxeBTjW+t8/U5kN/X
         K94mfUafB6kiUA5EtsWpJMW6xAvj6JPETo1i0h2vPdYDEzhMNGR3E1LG7PmAl/w9rwAJ
         s1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741362152; x=1741966952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3YuW0oXrBdYtRMAGRMastKIQLtGGLBfW0tz3GbiXdp8=;
        b=B+bcADQMvQMCOt3OA1LHFhnA5fpSie9NGPjIPk9eLY8gsueDgud9ZMvFcQ302VLNOt
         cqiObg0V/nntT5xle7hgleQ6zLswSGI8R0mrli7kQ9Yze+R1GQctEKrd990A66MxtvUp
         pkhygzkMikaY7iD4+R+LUxSmr0rqAcFz5QU8R65VxAik/3TIi4BGoDsuCMKLRSm7wrUf
         FRIsY4X0VTW1oLEDZ7t1kPkvUtfP1vY62AFdUSTQPLA44ZvsstADWsPgM5inQEoFhO+u
         IOeWIhLy84suWnxgguIPOSjQDye46UNJC1l0BJGaINT/e23e2NQ7TEV14RZFI4NxbRGO
         YcTg==
X-Forwarded-Encrypted: i=1; AJvYcCUlLe0R+BsUGPNz1F9EAFji01XR7zrAfbOxddnjOsZDxt/tWsEp0OJueNCUMxlaq+ydakV6+WO+evI=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi7IaGSHrUTukLXTGdaJqZ3c4kyq/xBSA7Iw4pzpzncQaDQrug
	NavF4wWdoAqPdVzqCCetNKs0rB2fV/eQIimAXu13C46nK9QnD4qlp+DB1+wC+5EiCEnS/StVR+/
	y
X-Gm-Gg: ASbGncvmTo+hcNm1AvGmjLM36MRWOc01+OrPOLOPhyTJyrpC+2LgryIr7/ZYuye68vF
	dpYFHvfPAuJD1XPiHZyYVXdQd8AlGcmGzjwf2gnT1GAVuzVHlbbRER2rRq8++bQX0heKF9ZuH7f
	VCvUX1F6UCJovXbLNJwcZy0Q9Iq3SeRugicX1IvjxRfHo3gVdeexaXgbND+JxEUvHWPFznq5kuI
	6Yk4IsGmNAY36zjzB5U5uVI+teK5mJ9+5FlS8VSGXSOVFtUuNZxMoaL5f8gEpZm+rJFjdlCstLb
	Lm7Y0zj/RPwEdz7sQLN/oRDvFti92dXrYhTR9NQLXkgh1mFavk0N2A==
X-Google-Smtp-Source: AGHT+IEyat9oHWfOYyiXKs8aTVrlJzL6X4S8kHWHMWCXsCBduRWhn6F9bDNlsKCZelNqCqQeEmR+QQ==
X-Received: by 2002:a17:907:7e9c:b0:ac2:4d80:232a with SMTP id a640c23a62f3a-ac252b878demr402191066b.32.1741362152017;
        Fri, 07 Mar 2025 07:42:32 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239482f62sm287401066b.40.2025.03.07.07.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 07:42:31 -0800 (PST)
Message-ID: <6a384a1a-ec92-4688-a0d9-4118ebd667e2@linaro.org>
Date: Fri, 7 Mar 2025 15:42:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/21] mtd: spinand: Use more specific naming for the
 get/set feature ops
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-4-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-4-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_074233_834395_7C3336F5 
X-CRM114-Status: UNSURE (   8.23  )
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



On 3/7/25 3:08 PM, Miquel Raynal wrote:
> SPI operations have been initially described through macros implicitly
> implying the use of a single SPI SDR bus. Macros for supporting dual and
> quad I/O transfers have been added on top, generally inspired by vendor
> naming, followed by DTR operations. Soon we might see octal
> and even octal DTR operations as well (including the opcode byte).
> 
> Let's clarify what the macro really mean by describing the expected bus
> topology in the get/set feature macro names.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

this op is likely to extend, so:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
