Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3768C3600C
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 10:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vu5RaAafamfPULOkh/EeDg45v7AkQ5OYWOugm6LXV4I=; b=T6pYF+EWeUtnz2
	is08TFY9PbgKWMjMsYVIst6I6JWeZYIPw21bLb2McPk47/VssK3YC6Kc2NmcV35N8s3y0qy7VNTTW
	9xSZyqmkViWyLNbDmMy0qLqLYiby/9VdTXmjVdxQuYHEBBFi79kI8AQGz4fPe8KrYBXa3B45IPxtb
	6/6j8GML9KuDwRd6hAGuW4IqNyfg2NVTtw7Wx/5Wz3f9kEZ4v5+/JVyUU6hpKlzPgZQRn0strb/Em
	iEiQrqrW+0zRCJES6LejA+xnxElb3K1wLZLyjHou0JGopEVX9uB0Iadw991HdOo11u7zj/sgEsDR5
	WsKqxsok+s3/mBA/4BFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HgO-00000008YBB-1LUn;
	Thu, 03 Apr 2025 10:20:24 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HNU-00000008TUO-2wDB
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 10:00:54 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38f2f391864so382557f8f.3
        for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2025 03:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743674451; x=1744279251; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPIHZcH7jsHk3BCGOsoXS/UMGxCNVe0vteMtqWkEZco=;
        b=tZ3uVmPhv1iKC6bDKUfFh7ZkQcPajesxw++qZqXyjYbojewZA64nfJE9gN6B31+JnB
         UjMCI230uVDEHUXpb6QW/ls3ujJsc77xKmqHha3On+0Iea62Q5rsGUh7XGFGnh7pKfpo
         uXtlOECGR+mG77XABglMZ5F5YVklkd/DQ+U+251WsFRTv5iZzF+C3MSSv2fQZF6BgqW3
         VYGnhTJ8F6VWyjz3ll9USQkllsYfS8QvUFF6mZZkIDlovcgbVugcQbLHu52dmlRgqlLm
         k8hSgqBsK0LN5mw++/y3FIPr6S1bm4MKWEPm2vAsW48H0e1YMh0oMB4qDVhjXJ4iULR+
         VkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743674451; x=1744279251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bPIHZcH7jsHk3BCGOsoXS/UMGxCNVe0vteMtqWkEZco=;
        b=Ry1sj7zd/XKtLxAVBruGgbJHX+Dw9nb6IrnItrHh0CrnvZwX0RCyg3TY/cBFzIPHtU
         xXf06XA+WLqNkK51eM4ztF6DU0JYyXtogvzi4HFD32/tbApWSfk8rBIqQwuST6JbJFql
         wjQl1YgEd26ZL0vm4Lrsjnt5Lt5FYZQ1wP5O/UrMUeabGNTqfaguNaCCh2bSsAhsSD7W
         oH6lx3T4dYOPuSjSEYsy1PMLTlO7Yd8vCWA1LcBpids64gYYoInf7OU7Gb07DLh+eO6L
         IiBHzDVagte8AfU8zEQnbhL1ok4DvVa0pPNZU5vJ71j4S10vPKlLBO1+mbtrIwRSdIfx
         7FOA==
X-Forwarded-Encrypted: i=1; AJvYcCXmTokFUpQTCQzebfS5FZdJhzqALc3IgHbSbVsy3jLTW4wjFtzSZmDYzhsEf8Xp+HvQsl7pwvozL64=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa7ACI07AxpqNdvJSuFjgRlLsu5L3DibafFROnKqBfP8lUzfBh
	b3hSXNcipToGkiquPS63PdgsGZViHmDYX9ARPZWzcw2Puv5K7SUAbJngKf65/oU=
X-Gm-Gg: ASbGncv8hKb+rfw/Zm+PkA8LHY0gUZOFXRx4LbHb933E2PO2jmRcfSFmxMA2bVoxSmi
	0h+mFzFIH/e7xN9Xcl7Q4DDVgTdRsIOtbnebYSx577meMpGYIlPamp5rA+AQoUlO740Ded8+Sfe
	I5h3Yikeg5quZ3uM7GoWieGKyB+Ntyx8IeHavuSYTy4hvgwCKIsQJWGOdRiBzsSVonsFlQDJ+Ew
	7o+Dc/9KLn1evzuupuAVFi29qTh0+41B1UB/7U7VYftTSXBHvl25H0u8qqMRx63os7COwDo6ovg
	S9gF8gACjpxVxgYAT//8+qc90w+iaPAb8wFuyA3zr6mhQDNJlyL1Cw==
X-Google-Smtp-Source: AGHT+IH0shxMDrYSFcYgFsaXsSZ9dGimeYXwNI38c1YfGi4Au1JKWd6AbU69jfYhfTtey+OesrvxBQ==
X-Received: by 2002:a05:6000:4211:b0:39c:1efb:ec9a with SMTP id ffacd0b85a97d-39c1efbee21mr11054386f8f.6.1743674451013;
        Thu, 03 Apr 2025 03:00:51 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3009674bsm1341602f8f.3.2025.04.03.03.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 03:00:50 -0700 (PDT)
Message-ID: <e1d8108f-50c1-4924-bb68-53436728e701@linaro.org>
Date: Thu, 3 Apr 2025 11:00:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/19] mtd: spinand: Use more specific naming for the
 (quad) program load op
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250403-winbond-6-14-rc1-octal-v2-0-7846bd88fe83@bootlin.com>
 <20250403-winbond-6-14-rc1-octal-v2-14-7846bd88fe83@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250403-winbond-6-14-rc1-octal-v2-14-7846bd88fe83@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_030052_987622_7CF70910 
X-CRM114-Status: GOOD (  13.56  )
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



On 4/3/25 10:19 AM, Miquel Raynal wrote:
> SPI operations have been initially described through macros implicitly
> implying the use of a single SPI SDR bus. Macros for supporting dual and
> quad I/O transfers have been added on top, generally inspired by vendor
> naming, followed by DTR operations. Soon we might see octal
> and even octal DTR operations as well (including the opcode byte).
> 
> Let's clarify what the macro really means by describing the expected bus
> topology in the (quad) program load macro name.
> 
> While at modifying it, better add the missing_ OP suffix to align with
> all the other macros of the same kind.
> 
> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

I don't remember giving R-b on this, not seeing it on ml as well, so
please drop it when applying.

I used Acked-by and not R-b because I wanted to signify that I'm OK with
the general idea of the patches and that I'm OK with them landing, but I
may not have reviewed it as thoroughly as if a Reviewed-by: was
provided. Please use only the tags that I sent. And if by mistake I sent
both A-b and R-b, use just the latter. Thanks!

ta




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
