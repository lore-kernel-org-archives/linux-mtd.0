Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0740AEA8550
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fh62D1ITYnvA96MM77+T1OZhpwIHER6t4citEkpRUAo=; b=d4o6UqG1sqA3qM
	K+XEbWymg9IwPhEk5V5IFfFnJpWhMOJFJJacZTVDzYNIZHLzT/bL8fwFGwdxhJlKWRY2Pe+j2IKYx
	UWSBwSacXCD8e81pWAD/RjhkVwrIM+qiIJImYdupCNnEozwnABPN3wZBl9D9vP1vX03jJ+WFec7RK
	Rm/OtplSmvOh+MCRW72OYDHFntwYX5I4C2iC2GXqpH3KQ/MNiAbqAGtP1pZmhtrfL0bImcECF7LJi
	l6wb/bQRKtV07w8TS/KVD2B962iVauScikjjXh/CHP1cluV6DCSKVfH3Y6v7d/4y5nIniu635Fldu
	Pbbk9YGmB9sYBKVPlIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztYE-0000000975i-19WG;
	Tue, 10 Mar 2026 09:38:54 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztYB-0000000975D-3C8j
	for linux-mtd@lists.infradead.org;
	Tue, 10 Mar 2026 09:38:52 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so33551405e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2026 02:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773135530; x=1773740330; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3yPn0CNqyrdETcvaPEephgk8F10vObbMCvkHLc2q+S4=;
        b=DpObtEV4l4Jn+I0R44eDTXwrQZdALFj2HQKGjnnG6VGPcCVEfPiFKeoHZjB7Jirx97
         3SGzH/+2E/d3CwwmQm1bWGrR+HK46scoSlWzqUsj0GwKn8AccoLLc6JTY57Ll/GlqTkm
         qjU6wNJFwFIjYTO4YdIjIU603XHsckUuOsSW8RWAVUlcYYyES4tOaIz4m/zzVaeZzhwA
         T1mzL+JP1za6RivYHZrrfTt0z2ugiJiXmDgXobyHZUpHMx/Pf9NtE34WLEjNjyyqbwpQ
         vyiuihWXarbn6U1GiKaThehixk5WaU/YdYXX1a8xH4aNOl4VzNm4mkLrrK4HKUwg8AFj
         N8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773135530; x=1773740330;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yPn0CNqyrdETcvaPEephgk8F10vObbMCvkHLc2q+S4=;
        b=LR0bqnk1CufEzx538zRKUFw3cSV10D6j703k5d0e0d3Dq3fC/ldGv4zQ8W3MXaQSSc
         p/gVy905Po1Ogt8pKEHZGF8ju8gL6y0Wru3TYgRBD0FnJNht3oMVd1s2ua8EMpXzU+Wd
         cDrb+qDJiYZnQRiygo0RsGl6TmeJ1dt4a3YeaT76+f/r+QJRq2PIGZbpzxcXkc0X8/K/
         CUR9aOB1xJaNgCtBDk/1k6qbJlLClWLUWjS7k3fPqlFxG5QSbimhDcJnsq09uJNwgIbX
         RI10BB4JkMKwT0HSGLJ50Y54T9WF1wnkxgPgNUYJJYjBHDmwgO6uQ81n1s6LIjoCDgy7
         y2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZebA1eeTQbsg4vZZzXE27HwxJFKP8dh1o7whY7atxlW06TVgL8jCpEqc3fxeyzVDXwIrlkHozpzU=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpv+TasGljtpQ6f6P4i7TGK+8V1yArTBGGddVBFAQe3FC0WYku
	t+T704UE8/1HecuBEpwYuVbRZ7aebPbneMbhr4KSC/8WdIsI+dqGINWk3BE/JGQu8qA=
X-Gm-Gg: ATEYQzy1pAfcAWm6jz1xkyfcNFh4RD17QtwNTpFDAWrvAZhxLu+2bMFCcTS1zXfOnTE
	ExcEOCLuMgdhvtg9y3lkcf1oqbVNqMUkz7ykzN0BNWiMNmlrexzrzgmIYeWwe+UVPg8liN9o6Xd
	0NQkWNWngycc8AOWQ4ArL5ADg8NFDbXip7xlG3NoDP/0JQaKYCo/vc4wHH3Jcgivl9ajBsHnwhR
	RGeUVAAzy3B98iIPeIoqXvWRougWFJC66IKgHIKWXI1WZtNc7iHW4RvZ7BmcgU+mWjffPOojf/r
	8AfiUa1VdEuDxtF0qT68hHtPrH2hK7jFPsSCt+StZoIfgbikbPus0NdT6GTAEljEAnaBvmWMUjU
	8k0psyVyWipEEnjPdC/Lp+Wel/SMC7aV4NPSitmH31v58yucoYjBbofW0eR5CWLNeYvIGbUW/fL
	PCVwXMLuibrtVN5UX9JJucalTsAP0L+0k=
X-Received: by 2002:a05:600c:3d90:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-48526930a4fmr220913385e9.12.1773135529622;
        Tue, 10 Mar 2026 02:38:49 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f3cdsm69967215e9.14.2026.03.10.02.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:38:49 -0700 (PDT)
Message-ID: <cd6afbbb-0df2-4f4b-a937-40313da518ac@linaro.org>
Date: Tue, 10 Mar 2026 11:38:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix RDCR controller capability core
 check
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Jakub Czapiga <czapiga@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
References: <20260108121430.1096844-1-miquel.raynal@bootlin.com>
 <873429oxwf.fsf@bootlin.com>
 <acc9c661-d102-4302-a276-fd8de20562db@linaro.org>
Content-Language: en-US
In-Reply-To: <acc9c661-d102-4302-a276-fd8de20562db@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_023851_838527_9BAFAC1F 
X-CRM114-Status: UNSURE (   6.44  )
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



On 3/10/26 11:24 AM, Tudor Ambarus wrote:
> for page reads and page programs (despite its generic name).
ah, and there's no such thing as page reads in SPI NORs, one can use
a single read instruction to read the entire flash memory. We all
understood what you meant, but please reword this so that's clear for
newcomers.

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
