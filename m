Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DE1C5B543
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Jun 2025 01:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4sjTAHQ5C7FyfC27M3A6XdBKQalXaUec2y5QQkBB/Y=; b=sNx8yqyp8/qFAf
	GXWbghQnvoS4In5J1DzmpoEslGLQAYkeuwBP58UW6y54zAHekSogHC3sHI+IUPGomEhvN/nOKJz9/
	9yOhLTCimsADgonAbXW6W8w7yMRg+QfCC3ay4O3djPzJUAkRLFZH/kfmeKPIi964TMkpMQqMvR2MJ
	ZslTZD73dRHNDllirR1iuer70vQ+rP3HQ7lk5m7t/9WGgM+m64utEXIlZhO7cbxOrqDkdj8TovJqe
	YGf83At4xUsn0+q22HGRzvy1hRNG1637kW6IlJenedvpY+EJtB9g0cD39Tg1tp76jy6shg/P648j+
	vArwcSwOAi/vCKh8KS3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO4Sg-00000002Fgf-1YJc;
	Sun, 08 Jun 2025 01:04:34 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO4Sd-00000002FgF-2kFu
	for linux-mtd@lists.infradead.org;
	Sun, 08 Jun 2025 01:04:32 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so2444495b3a.1
        for <linux-mtd@lists.infradead.org>; Sat, 07 Jun 2025 18:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749344670; x=1749949470; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=san6EgIA1IstcXSeExt9z2VEoKgDpmi06XvXrnY50cw=;
        b=TDmn1tgXKB0rlA6zUkEw+LNf2jjBwKdjz0Eg6ZGxOn+NQJ7DWla4Qoq4Mz8sThYqtu
         XBI8IVq/seQ/3obKqNEntSdJnhLSr9J5xTLbbDK5qd05kciSsFPPHyM9MwMcBi8waMkT
         xQQMxgE3m1pJ7VoDvgYGwpcFLF0jIyr88OEoQIAT4on4LEQJ4vIHRQX72Y+J4DGVDBMq
         q8qqhJThdFhSJHwI8Xz4q510jT1sGBt7GprcSMkdSaD54op/q7Rm2TYS6E5coi/uBHvP
         TVdreOvLBHvyZKsVz5t3q0X/2w/QRjUekmE7g6xxgd0v5pl7kXzNXgo7Ue+LqjgsO4iI
         8xVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749344670; x=1749949470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=san6EgIA1IstcXSeExt9z2VEoKgDpmi06XvXrnY50cw=;
        b=jiqk7+g59w09NNfivRTSyQa4MFrX7pmCbn5ARAbXULs5KmgQZVpx0Oux2UeFdPMgqs
         rVuziU1gV5P3NHGgvL0R/1smUsnFT+vi09IHOM7IBnu9ai9yMLAf5YQWQgr7LH+LJfVM
         5ir4TH6tFL5mgAPlHwrt/NtXBMpefwJkt+pcUZ+TokWIjgNOOQ9gg6WowFgPJbkmCmDL
         XQZLFPHQ9wVn/aew2RS1kYksrbXnXyoZz3RT3Zqwbo+C0I7LcsNOmSgjUOdWbeFuqUT+
         3Cp332vctBhuDzD7kFWCPiq8e3IamPDLFUTCQKzIH8W00coZMLH+C+nRoId+OzQu7CFu
         M8lw==
X-Forwarded-Encrypted: i=1; AJvYcCUtRhVzCAcS8dRbP6PlePrNSL7iPHV8bC49ZTbgLDqEweX1aRPWh3g+u9x2GN+hw3eSlJ1+gYfDOMM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6DOB/xKCbV7C6vlGZ395ybciI/TkZSCYwHcIH+WBjG07x92lC
	nJ2OAw/KNPM/zlG1t0KT0WIwbWRHAIjtGR7BIVRYqtFgHDMAyZxJ2nLB
X-Gm-Gg: ASbGnctTjWa1Awm2jTqmWLcFg/GAA7R321ANxVnWk0krs+kxz414S6HoXXgwiX0JGnm
	gA21iearEcPc4cRdXXVBv73NyfyrdDZc2S/R060XJK1tGJSZaXONoNGCl1Vs+o/pasj6Z+cow6b
	R9n1Ms01j448pshpFprh6mpWRN5tT4jVKab0nh3K8JTaAnpQU3FU240zH7fI98gDtRJDD7W1x2N
	5mytP7/qA7VGIFgBNYCmTbSEJYl+FFp3B8ClwGD0GRj5HMuOiCONfRCLSPI6/WeDkifex7B/fFF
	YShEfU7p6DrJRtdgdIlhJWMxkJUo8VhVjgoSIgkCjosBNNt3CGZjFZ8jGWkZmD9KSc8UDpz9POw
	=
X-Google-Smtp-Source: AGHT+IHT+bqzJmd9l7kKFwCcX3st0MUeXc3AL4tTu8d426WHVHLBuWjnNHUStZbNmErFqYlMkXFepA==
X-Received: by 2002:a05:6a21:6da4:b0:21a:d1fe:9e82 with SMTP id adf61e73a8af0-21ee2628a02mr12992970637.30.1749344670486;
        Sat, 07 Jun 2025 18:04:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c00d5sm3298054b3a.120.2025.06.07.18.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 18:04:29 -0700 (PDT)
Date: Sat, 7 Jun 2025 18:04:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org, mwalle@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
Message-ID: <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407075400.1113177-2-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_180431_695520_50BF0476 
X-CRM114-Status: GOOD (  10.48  )
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

Hi,

On Mon, Apr 07, 2025 at 03:53:58PM +0800, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Many flash devices share the same ID but have different part numbers.
> To avoid confusion, the part number field is removed.
> 
> Additionally, since SFDP already provides size information and
> functionality covered by no_sfdp_flags, these fields are also removed.
> 
> Furthermore, when 4-byte address instruction table is available,
> the SPI_NOR_4B_OPCODES flag is no longer needed and is removed.
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

With this patch in place, some of my qemu tests no longer recognize the
flash chips (MX25L25635E/F). Do you have a suggestion on how to handle
this other than avoiding Macronix flash chips when working with qemu ?

Thanks,
Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
