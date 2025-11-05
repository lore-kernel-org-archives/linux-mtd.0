Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF1CCCF9F8
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 16:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTLPVYrPRnWLd9/7Dc0OkTJ6VX/M7CCyuVmYgBtAq1E=; b=3B9qABU6Yr4xcn
	nCyq19k66wg8OBO+2NGueeeVHoDrzm8qubvrayrTJfpH75Iz3VqvsEJ8Liu3ZZUyNJmzMyl+wdjTi
	N6rS79d8oJ53fTbDyzmznE1wtR4vGCyhuicOMlJjAm013bg8dX4ManILlqlmuKFaKumjgfJQ249vV
	a8ENB0iWJUX7ppuhwzxpPvpdtMV2s08VlJc/K73jmUK1IeMreK+GI6otG3mxEouMtdlUM5VFa93nx
	Ji04xsNarPj+eRG7uPeWDyKv/DBVj2OQDSSmVGOXrWheyRwlO0aEs5kq0NxE30bTWVVrXfHJvUa6G
	XQCqnysKDZMEVdlYLztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGg26-0000000E1ZY-1yO7;
	Wed, 05 Nov 2025 16:06:50 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGg24-0000000E1Z4-0O8M
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 16:06:49 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b3e9d633b78so217638866b.1
        for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2025 08:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762358806; x=1762963606; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m9b+6Qd0RrFy0k4qrFIgFV3TWvTpO/YcaGxKS9mqK3E=;
        b=Te9OdNXxLbOomc2zW7Acmkp8H3JJvGYD6MCpwpb+QLJk9Z2xLqkzk6TTb/Ojm1CB7D
         0VjDDREpme2VtVX31iMM7yIAIMEuu0cLyhu6ZLs74NX2CwduFMcyALljUgR+vGpILHWp
         AnrhYRQMHd2VcA/hKBdKJEhA46llgSAkLg4tEv/bYKdGebj3kdtnE/K9+YXpBlkDOFzJ
         DcYBtIn1uPq43z+Tc7EYMaDlM42/jgn6hE/FuR+LtHg0RVvP7PhvQlLsDVhyPUPTG6xs
         GI5ru4QdQF5e8dYKnPzEd/nzHru/DiGrF8QgWAo2TTTi4JfYEGLIrZoAwKpCHsyvBCPF
         meBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358806; x=1762963606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m9b+6Qd0RrFy0k4qrFIgFV3TWvTpO/YcaGxKS9mqK3E=;
        b=lUTnZYd4Sg7lUS1Xf7I3SejEj9uwIe2kG3ZRjFXdiciyoWOqqTrqRrpvKCOSZDug2R
         +XjceaQya7DlaIdlRPCHLOeqk/OfBO6wYgINZ/TCrAflq+bffHveNeLUHx8w3KbjJe9G
         kTtZUd2Zfb4VMXA3uPgsEgLMcCNskYNXQhUH+QhRu9eYd61LWBljBHgWoPgEkRG3Qd9S
         To/YmSsWSmuQS4LBLZMdZtbCEYc+jtmpwvudqFcQ+5eGBsTTc7c1NO9Bu97WYaP5Dx5c
         B0MHkOonqXshUE0YJfD2cmpaoIHzEWwcPSuZzHZpK0Kii5TJi/V4fPju26UXO9qec8Nr
         T0Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXfsPHyDdJ6xxLyIwbXbbLZgx9H1C51zHM9FRhHzowcjsVZeEiccYjxYjBldpIdhMKJXg8QGHjhPIg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0sR0uFE8VRqaB7rp8MnOFzW2vOHol+WcEE7SQiV3uuIOzyfii
	ddlOwOFyh+bbBAfS2HnHqeAfJVDvSEcxQtkZX+6jtqSwSZOIoMsce3t4+Zqv3tdDYvo=
X-Gm-Gg: ASbGncvIuveLp790Vnu5wpPuGaY2B7jhnia9i8ogxdszyMU97LEhfhJkbFFqUz36L+h
	BESn9sKdtw8n4Dr/2UNEDX7E56Bset0QeK1EvEqhRsD+EsRpa0UHT1rT3d4oBw0JfbuK9JgA+1A
	tksHUmBtR2weOwdMdKGimQ32NFOAMzk+rvf4f+KLTUFFZVuCQAjoytM/5dd+/CgojJuwGog/U1E
	bX58/PcBa3fqhIfNeKZSubFA0/BHmnA4MFAGyD635QIvKtFThV75HFXl27oFcStrWFBgPkE7R+h
	DkTTzzgSrYDeoUjqk0QYSszXX238ZVvjrWwC9Z0yVk5WdHPyI9nFC4dV81VU2Uh9X83/6OgAa6k
	bgWg0+ZXjNfVaPqdW9cltRJ4wH8DdJutcq5wsHdFCSv4cwaJvO8zPpekC0vJ89NcG62fjshwCu5
	nf85ERp0hQF6vOSA1Qyb6cruo=
X-Google-Smtp-Source: AGHT+IG75jAMbaFvc4eUbrny4N5h/msFWd7WmC5fwk/VMEKKvJ9mo2OYEnDfZlTd6IeuC0xb1XzJNw==
X-Received: by 2002:a17:907:94ca:b0:b70:b9fe:aa56 with SMTP id a640c23a62f3a-b726320200dmr415235466b.20.1762358806257;
        Wed, 05 Nov 2025 08:06:46 -0800 (PST)
Received: from [172.20.148.132] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fe3902bsm512775666b.63.2025.11.05.08.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 08:06:45 -0800 (PST)
Message-ID: <a852781a-70e1-4da3-a283-a81be10daac5@linaro.org>
Date: Wed, 5 Nov 2025 17:06:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/28] mtd: spinand: Use standard return values
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
 <20251031-winbond-v6-17-rc1-oddr-v1-7-be42de23ebf1@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-7-be42de23ebf1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_080648_161530_38C89587 
X-CRM114-Status: UNSURE (   6.01  )
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



On 10/31/25 6:26 PM, Miquel Raynal wrote:
> Replace -ENOTSUP

do you care to fix all mtd? :)

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
