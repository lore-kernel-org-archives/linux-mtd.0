Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37949E77187
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 08:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zg7KmwWwiyecng5vDujBAUwluh2q96fDBl50BAZ5ZHg=; b=uKEwHsUvTTHAO5
	G9A3O/G8MgYlINHoWpxDxF0Al7dKkhokx33z9LA7xMvqimiGMjEPbTFOOyPqsRy6+niog0nVzQpM5
	D98mFEf0GuoAoDw0YEAdxnAK2mv3n2oMAtUn68icNGNAq/rB8Y4wggqhKNEYc3fJB6A3GDiZAfN39
	I39Y8Pivwa64BeDts623qFtaQ+WUe69c/eFbewNcWDEB0e610Y0HkuR/IJS7dytQYJz26Y3aLD0Z+
	z61W9Iqkomi03GEXWXSHfo3kbP0Mc5QPFeciraJwI8CQMzkw7zCsOzzseR5O5lTKuaZsygewLk7MD
	UdQW16MgcwT2OKYcRTkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNp7b-0000000Ftm2-0Nar;
	Wed, 18 Dec 2024 08:09:31 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNp7Q-0000000Ftje-05jP
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 08:09:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso40963665e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 00:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734509358; x=1735114158; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZRjVLU79fxtlCs8q/RqJY5LZOSIYLIuscUTeIz5cyfQ=;
        b=ckmmZ0NBUXVXSd8wYKfEQoZFR7gzOCxJmP5aHc7e8YvH64pgIVRHgGVjIZdgM7DY5u
         ItT+qBqrjGF9AKQly/Yamz0aVqT4l38W/0LJ6ii58dpMK4njR8Ov42XbIQRLCGdP0SEv
         UVInMr3Vp51rsV349NIcadv7KuYsqrZ4uq3EQ5bgdmfXNaveaz6IrS/TyzSFG3Djm1+f
         K/vpqgFYXh3Pa6jyODfAS1V1O8SI8rYOE5tw/sJfSk44SQL2t7TGFIC5ubY7JuVEyznw
         /tGAXD9O9oS5Lge+gsyhDqX4UeOeU5abj9SLdocvdrHjVEfceDJaY6rODXCM2Z8GobtL
         o30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734509358; x=1735114158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRjVLU79fxtlCs8q/RqJY5LZOSIYLIuscUTeIz5cyfQ=;
        b=d5ZophFpOQNpMHXcPx4o6KKLBXkIgghXE31cUWff6EMBN9zO9DmBr+PZB0nnsTMGPx
         uTSHLrVnADIcsRP5zg+hBqYBiF5yruHmikVr9f0saUCmK3jFpVZ/WbnG86bMA/uvvYyM
         m/0hqnH4XD4buuxxTqPU4irLj+4k2PgRXS+Kz0GhlI6atTDaWzMuaAdqjAr3iczUxPIG
         4EdxlF5z747E1tEUgxAeWdVHwuUzFIkXTtzfkH8CygsK2U5U7QKqhqStxWODWA9mDSAf
         tmNEADCpaNVbYOpAybhkcuf9sasncKPPw6dpIDsUgUeDbyGFGQy/r5XQfaIMlvyGGqei
         sp0A==
X-Forwarded-Encrypted: i=1; AJvYcCVysE+Lc1+PgyCVZIqBwj2qienGGUYySvdxCtUVLj7oEgOpQ/BiIZ5VbbDhXuapk+m//uasEWGaogc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0RyHq6GOty/GmIYBeCE3EgbH3mqjXwZSjjWh8CdsZPtidCvo4
	t0ZY+o9jBJZ/+ocQDSdZ5IXbcx+N0vMNnERl1ceyzYJG4LG4U0Rkc8zLV2PIUyw=
X-Gm-Gg: ASbGncs3uF6gq/CYb9xmkWN3F+4/pC16t91HNiOjiWjtoYkqnx4sk8EFfUSeO9xJ44y
	M9CdEzqdMrlTH3EbemCkb7MNFQZpHiler4QmvaTf7bND3APIW3HL3BVpkuMFW7SrPp1P2HV92q+
	jMiuCHP2i6gMpnqzgsC15McOESa3oNkxZfHd0mjL2qy++SmYIMJTLl3wZlxdaUvXnhINQ+mZhcY
	ZwzJC0VcQxtCe5g90LQHjnho7fpYeO/nQb5kwOe4QXiFyodj14lnL1nSBCAIRO/
X-Google-Smtp-Source: AGHT+IGOAC3FvXgS5bR4S3TJX40I3g683RjVqEAtFMj/u/nm8PyH1S1tnMwfp3FxLzNoeKSWEmEo+w==
X-Received: by 2002:a05:600c:138d:b0:436:1be4:c9b4 with SMTP id 5b1f17b1804b1-4365540c42dmr12112905e9.27.1734509358224;
        Wed, 18 Dec 2024 00:09:18 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b12399sm12326065e9.20.2024.12.18.00.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 00:09:17 -0800 (PST)
Message-ID: <8feb356c-58b6-434a-99a0-d707b68aabf6@linaro.org>
Date: Wed, 18 Dec 2024 08:09:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/24] spi: amlogic-spifc-a1: Support per spi-mem
 operation frequency switches
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-5-miquel.raynal@bootlin.com>
 <9e942bdd-6ade-40a7-ae4a-104ed288a09f@linaro.org>
 <87o71fn6yl.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87o71fn6yl.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_000920_074138_0846AB81 
X-CRM114-Status: GOOD (  15.43  )
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



On 12/13/24 11:44 AM, Miquel Raynal wrote:
> Hi Tudor,
> 
> On 11/11/2024 at 13:42:31 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> On 10/25/24 5:14 PM, Miquel Raynal wrote:
>>> Every ->exec_op() call correctly configures the spi bus speed to the
>>> maximum allowed frequency for the memory using the constant spi default
>>> parameter. Since we can now have per-operation constraints, let's use
>>> the value that comes from the spi-mem operation structure instead. In
>>> case there is no specific limitation for this operation, the default spi
>>> device value will be given anyway.
>>>
>>> The per-operation frequency capability is thus advertised to the spi-mem
>>> core.
>>
>> I see the driver sets ctrl->min_speed_hz = SPIFC_A1_MIN_HZ;
>>
>> Do you want to introduce a struct spi_controller_mem_ops.supports_op and
>> check that the spimem op freq is not below the controller's minimum freq?
> 
> I was about to do that but I think we can do better. I am already tuning
> the max frequency depending on the op. I can just check in the default
> supports_op hook that the operation max frequency is not below the
> controller's minimum. So all drivers with this kind of limitation will
> be covered.
> 

Sounds good!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
