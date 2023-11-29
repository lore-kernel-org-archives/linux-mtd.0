Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE07C4167B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Nov 2023 07:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKwqYkniu9N2v/faVGNXFtjg5fakhoEOyIxXyp5JEPw=; b=NRfIj2mdWp1vGt
	jOsTWkeRJDQ8xfJbQhg2UctA6Bl1c+JYDLkL0/Ubrl2bU6fsg968kGPSoGvdO3hWR3b6Nez1i48zd
	oWUbMXguybXghslw2iI7TSSpUuO1GEs2BEufIkyIcci/CI9TceDDB40/zzFl9wWH+PKtHcCgCNQKW
	6n9m0E29ikJGLqVas6TWefZzAwLEKnIhyQXeDtjlCSWXoEQVqzCYxfKkmojSI2PC1Eth9/Bl0sWKE
	zl1NQJKahHN8BwOYP9tVDmOvJP0RgxjCejMrQ2pUu/HJQzE1DM0gG7zRfJHDw3PLy5XktTrXjBy1E
	QIoAaJI2GqHSlXo4KYvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8F9w-007Ner-2v;
	Wed, 29 Nov 2023 07:39:00 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8F9t-007Ne4-2V
	for linux-mtd@lists.infradead.org;
	Wed, 29 Nov 2023 07:38:59 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-332e40322f0so3997420f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 28 Nov 2023 23:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701243533; x=1701848333; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7cONzvX3DJ5N2tJbhtl/3F0xHVQGSzTxNADSagct+E=;
        b=ozcr2NMC3ip4tEJ4w8rX+d9rbsET7CzH4cI72vBVZ8xMSImqseaOZxC82iUfVODF15
         iUMrCqris2qJRhoaFt/Y/iZdpEjmqpeQ3n0uVPwJ1UZ/2s3ogcy+AMGCmv5HTUlppvXB
         K2k8pqJK/o0iEWFR9ftjT+AL7+2O14rgKZgEHlgDKYdr8PY8+1U3kMFs99S3BJJ1Kacq
         b++K1vTY7IDiIWhXo6V1J/oKMD6ZyiUVnCI09zfqN0OeUJnxywQB/JN/ZaoZymDuUccf
         /IG+FZ+QVxtXGLBngXoFhBftqSMkHw4fcQ0hYV1XTrrgP510EIV7ZF2IvSsCe3H3bewt
         PCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701243533; x=1701848333;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7cONzvX3DJ5N2tJbhtl/3F0xHVQGSzTxNADSagct+E=;
        b=nQGHKyHVH2qpQw0JTVOY7HxOR+uwGPzDUszxfM99xh8Cd6c1zehAJmuEAZiJhCt9Qc
         /0UMq+Qec3V064XP6G+Zs92hgkFicR2yiY9UQ6ncz6hVC5a4XVzPZonq8uhEE0xhno7N
         uuGpREd8vlDISvQs2Wb5tdeCgCIVTcgrIulUEEXNw3k/B++S5Z92KA26BlHjPgn6G+Ch
         gnKugdcduxj4Q6w8b+2xObGUHHvVXjnnq6UApJZyf17zw6LWZSq23CrWyoTBPwQWYztQ
         VsIwhelAry0tBStqa0crO/93obo32mB3t8f+FwVxzF/0agDxx4ujzpwnmAnpeuNNHgCm
         U3Eg==
X-Gm-Message-State: AOJu0YxXRO4ZoCDP6NKtDZIYSZ3CFebMvPrUiv+V/AL6oRn/uC/srTPi
	vXvlV9/GZJsIODIe/zmZMAvCHA==
X-Google-Smtp-Source: AGHT+IFqgVfitjC6Sy5J82ghxl/laZe5/WVwnFlMaeybrhcaJUuv6lF2MT2VXyu3Pser2LNo37WYQg==
X-Received: by 2002:a5d:6a42:0:b0:332:c50f:45ae with SMTP id t2-20020a5d6a42000000b00332c50f45aemr11339918wrw.44.1701243533133;
        Tue, 28 Nov 2023 23:38:53 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id j12-20020a5d464c000000b003330aede2besm4262686wrs.93.2023.11.28.23.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 23:38:52 -0800 (PST)
Message-ID: <6e81a443-4e28-48fd-9bec-224d07f1682d@linaro.org>
Date: Wed, 29 Nov 2023 07:38:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] spi: Unify error codes by replacing -ENOTSUPP with
 -EOPNOTSUPP
Content-Language: en-US
To: AceLan Kao <acelan.kao@canonical.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Dhruva Gole <d-gole@ti.com>, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Kamal Dasu <kamal.dasu@broadcom.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Mario Kicherer <dev@kicherer.org>, Chuanhong Guo <gch981213@gmail.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231129064311.272422-1-acelan.kao@canonical.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231129064311.272422-1-acelan.kao@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_233857_844591_E1D02732 
X-CRM114-Status: GOOD (  18.34  )
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



On 11/29/23 06:43, AceLan Kao wrote:
> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
> 
> This commit updates the SPI subsystem, particularly affecting "SPI MEM"
> drivers and core parts, by replacing the -ENOTSUPP error code with
> -EOPNOTSUPP.
> 
> The key motivations for this change are as follows:
> 1. The spi-nor driver currently uses EOPNOTSUPP, whereas calls to spi-mem
> might return ENOTSUPP. This update aims to unify the error reporting
> within the SPI subsystem for clarity and consistency.
> 
> 2. The use of ENOTSUPP has been flagged by checkpatch as inappropriate,
> mainly being reserved for NFS-related errors. To align with kernel coding
> standards and recommendations, this change is being made.
> 
> 3. By using EOPNOTSUPP, we provide more specific context to the error,
> indicating that a particular operation is not supported. This helps
> differentiate from the more generic ENOTSUPP error, allowing drivers to
> better handle and respond to different error scenarios.
> 
> Risks and Considerations:
> While this change is primarily intended as a code cleanup and error code
> unification, there is a minor risk of breaking user-space applications
> that rely on specific return codes for unsupported operations. However,
> this risk is considered low, as such use-cases are unlikely to be common
> or critical. Nevertheless, developers and users should be aware of this
> change, especially if they have scripts or tools that specifically handle
> SPI error codes.
> 
> This commit does not introduce any functional changes to the SPI subsystem
> or the affected drivers.
> 
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> 

I'm fine with the low risk of breaking the MTD related user-space:
Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
