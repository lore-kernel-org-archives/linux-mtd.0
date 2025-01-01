Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C61E7718B
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jan 2025 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oThsgKPGF59dHBaRhh2nxPXmvErD3gt2dffi9sRkIss=; b=13gJKVAwxrqHN4
	er2yIyz4mqjUSjx1skA17wBExN1VPpqR57+YIf9gdRqSO5CoNoygqrQNR81unaJkq7+JLWP3HzBNZ
	9jms9RKC27Igw0QmuO2xRB0Ki36ZFLwuwNQUTJ1RaMp8aDCtjtBxo9DNLy8j2HWDcc0gUOrdRx+pG
	+Nn/51iA9zJM3s384pnfRieZxVjOeFc/LI2fHMSlEbo2i5k7IEFPLLmU9ZGEWDYK/emwlmpZsT6Cu
	dL5qQ0wc4sLlE7HYSLS9S8TKrwixFl3ZzMXgBmEWxXBqt6Rp3pXa3W/NV2zvW2tPX7y2iD8DNMSkW
	PeTiqynBV8iTmQ6bJ8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tT1me-00000009C8l-3krk;
	Wed, 01 Jan 2025 16:41:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tT1mc-00000009C8O-3M4q
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jan 2025 16:41:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso65094095e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 01 Jan 2025 08:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735749681; x=1736354481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=673uKSPzcYnBh2TsZV1+vzSMvKs5q5gmZERqpENWy+4=;
        b=bYVaCo5ISMeLxxHXgA0sq43Ox3QgKSRns5rlVMPzm/bcp5t/O/7BWDp3sqLpwEXX/U
         x7r7pXDbva+0PhjpMyOuSCECjN7ovPo24TpmQEY3/0imS73RaiN75cseC2IWFqQB6nBb
         BtehI0hUin0RzTLRPsqRJoOroxF5O6w568n29qxfKFGbaLS2FMPsTeaBHwCPLugTATBV
         NsYkGFrROEV7XW4QMf0SwAsUc/0jK7YZ/dAPSB7Ddiug7uqrAFxnuSoSeBt9WwdjMWp+
         Ne+GWx1kE/gQr4XNsTZsuXkQBZDieK8873sStOjdeNHKCLf2QDJnVdFtNZIOFF3qJ6Rr
         3CHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735749681; x=1736354481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=673uKSPzcYnBh2TsZV1+vzSMvKs5q5gmZERqpENWy+4=;
        b=xHj4g0ImMzFYHNfCD9EIKoc8LJjRinjglSlfyiD/26iQp11wy3xuvhjBwJn4qAfXNB
         aVVW7ws8gNvYjK5pTrbRvPTmgbqypvUxvXiTXnDldcagBjFDC6AUB/9s0qeb55DvYnGu
         hL7K1Kk0M9MmRKkCBjKvd4d/g6Nladq7N41p8PRBHuY4B/4rBS4Km0l5SdhWnEIAFiq8
         9QLOhULYVsNVzz4GKrNPqFz85bpT857z0sCvTgjilhbLJeVG9B2txtW4StlhHp3M/InX
         i/bM67Euz9cCHwoXR7oLsv/Sl/DwHGmo3cPjIzTMx3QhWZY7IhfF88mM839SQf1IJC7D
         2H4A==
X-Forwarded-Encrypted: i=1; AJvYcCXJs4Z81lMSV2xY5SJLs2ae79QX9cdJf/pPDdeh21dyVAa5TZ/49WHrwX+/a3ZpHPpSImyBEluWUUw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyadqNaYbG+97aUFB1RRCJgFHHQd0SArc1kxTBF/EemGcTjbeDS
	X9ha/mBWARRKrX/todjeshJShs4pkmlBdCuRzq1L1BPGQ3Av24Ta
X-Gm-Gg: ASbGnctKQH9cuR0fKAw/L4APkX92CdTcjo7Yaak7eSefnkZI3LD0gg2D/Y9QN5ipOgv
	NY7MUvhrLDKkAN89LPRwpSTfk2qp2BpbDwNgp5Q1zC2oZaqWtUME9EQ1GiuZ81E/d60Q7b0olYY
	w2+EeMdaPveeu/0tz7BTNrgkeBQ/F8qYpAmaAN0K9rkkZojy+1SxW5omr4kWN2wzp7y8nRKNiNY
	p8LlfDwmYCwE9YLE4QCN0DJ6YSJAAPUvH3y0bL+WMZNSJQD5XkiKXNhApnU6yaQycBg2uPzGDKT
	6UQB/e9LMZJq3ttzmVxbaDc=
X-Google-Smtp-Source: AGHT+IHQHSCpLv1Uk9ROvVaAadFohvt3o6x+X80bv++kGLPADaDQj6k0S7ZMrKyj9Dk+KcAYYjcUig==
X-Received: by 2002:a05:600c:a0a:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-436693f7cc4mr339030115e9.0.1735749680436;
        Wed, 01 Jan 2025 08:41:20 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4364b0532a6sm449633705e9.1.2025.01.01.08.41.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jan 2025 08:41:19 -0800 (PST)
Date: Wed, 1 Jan 2025 16:41:19 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>, Reuven Abliyev
 <reuven.abliyev@intel.com>, Oren Weil <oren.jer.weil@intel.com>,
 linux-mtd@lists.infradead.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/11] mtd: intel-dg: align 64bit read and write
Message-ID: <20250101164119.000d2bd4@dsl-u17-10>
In-Reply-To: <20250101153925.865703-7-alexander.usyskin@intel.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
	<20250101153925.865703-7-alexander.usyskin@intel.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_084122_844672_EED05AA2 
X-CRM114-Status: GOOD (  22.94  )
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

On Wed,  1 Jan 2025 17:39:20 +0200
Alexander Usyskin <alexander.usyskin@intel.com> wrote:

> GSC NVM controller HW errors on quad access overlapping 1K border.
> Align 64bit read and write to avoid readq/writeq over 1K border.
> 
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/mtd/devices/mtd-intel-dg.c | 35 ++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-intel-dg.c
> index 76ef7198fff8..230bf444b7fe 100644
> --- a/drivers/mtd/devices/mtd-intel-dg.c
> +++ b/drivers/mtd/devices/mtd-intel-dg.c
> @@ -238,6 +238,24 @@ static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
>  		len_s -= to_shift;
>  	}
>  
> +	if (!IS_ALIGNED(to, sizeof(u64)) &&
> +	    ((to ^ (to + len_s)) & GENMASK(31, 10))) {

I'm sure that should be (to + len_s - 1).
Using GENMASK(31, 10) completely fails to indicate what is being tested.

> +		/*
> +		 * Workaround reads/writes across 1k-aligned addresses
> +		 * (start u32 before 1k, end u32 after)
> +		 * as this fails on hardware.
> +		 */
> +		u32 data;
> +
> +		memcpy(&data, &buf[0], sizeof(u32));

	get_unaligned_u32()

> +		idg_nvm_write32(nvm, to, data);
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +		buf += sizeof(u32);
> +		to += sizeof(u32);
> +		len_s -= sizeof(u32);
> +	}

It isn't at all obvious why copying 4 bytes helps.
Indeed, if 'to' is 1023 and 'len_s' is 2 it goes terribly wrong.

	David

> +
>  	len8 = ALIGN_DOWN(len_s, sizeof(u64));
>  	for (i = 0; i < len8; i += sizeof(u64)) {
>  		u64 data;
> @@ -295,6 +313,23 @@ static ssize_t idg_read(struct intel_dg_nvm *nvm, u8 region,
>  		from += from_shift;
>  	}
>  
> +	if (!IS_ALIGNED(from, sizeof(u64)) &&
> +	    ((from ^ (from + len_s)) & GENMASK(31, 10))) {
> +		/*
> +		 * Workaround reads/writes across 1k-aligned addresses
> +		 * (start u32 before 1k, end u32 after)
> +		 * as this fails on hardware.
> +		 */
> +		u32 data = idg_nvm_read32(nvm, from);
> +
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +		memcpy(&buf[0], &data, sizeof(data));
> +		len_s -= sizeof(u32);
> +		buf += sizeof(u32);
> +		from += sizeof(u32);
> +	}
> +
>  	len8 = ALIGN_DOWN(len_s, sizeof(u64));
>  	for (i = 0; i < len8; i += sizeof(u64)) {
>  		u64 data = idg_nvm_read64(nvm, from + i);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
