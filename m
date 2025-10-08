Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E975CAC5BB
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Oct 2025 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zV4ox4T7cyrRFl2toTVLlVnDzF+2/VmINi/It6jri3I=; b=NWSF6shxbfV60+
	A129Jnsb+yosNlW9gXHSesnWa9IvRXU9xszw21w4CYch+5Eh6ESIxGUhAXtwyLruY7sA3nJDEYs37
	j3ATT4Flenqz7NuLM4D5Vn9tuC8rltFIiWP766qJ6idDtmO50YIgI8Tgyw7DNYn1tpZNIbdfMoP5p
	vLQtvdmdq89RppfeISmfTkHjbjBuk639zJycK0jN2d0S5E25NqawoBZkk/HpJUUnfITH5DOXDtHJD
	/K8YO0lLgjrE9Kg4D4Z6bqRAVeDGRKS/aTwQLvbAb2Izqq8qC0+t98VBPcC3EU1BLwPhRLCLDGzjC
	kI2cKXQwcw3ZrXx+9ZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Qcq-00000003ZiE-0ZE5;
	Wed, 08 Oct 2025 09:38:24 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Qcm-00000003Zhp-08b0
	for linux-mtd@lists.infradead.org;
	Wed, 08 Oct 2025 09:38:21 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-54bc6356624so496964e0c.1
        for <linux-mtd@lists.infradead.org>; Wed, 08 Oct 2025 02:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759916298; x=1760521098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6l+B9owPtIKrCSeyTE4F8NmW+PJqEJv1NByjt8yVUI=;
        b=i7ta4CL7pCVQsWHpMG9cfJSCWNfy2lRydp0V1doB88nvSUQewpgIi1yP/EG2JgvDMg
         pBTm2h5Dnpnx1tgcz3/R6rg1UM94FmjDmJuwNyX/zjtOpArymiS347t/I2dOx9Wi7PX4
         FeHawaQjaGdSDwbbI+qM8uPYZkeTdDGb302I7a5prDk849SdBX+JHvcPOh8zhemeKvdd
         L/LXBFboAC70b4px570oOgYmeH6x0kp2t5dNw2W7k61NewDX3eaUSKTDBxiJeYcK67yX
         rbdKNqV2QEwzPUAwpCcx/chxAfjFApn5laJsHt2fxzuExopuhMyCcTa0WwCxsBbbY5PY
         JZUg==
X-Forwarded-Encrypted: i=1; AJvYcCVU6qIm7ELcop87EUKt+nNqIOAz6ggoLOISsxJnRY7zyZn2yItv6buWleaMlIYJjcnDrZGJSyx4VFc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPr7FzHbEFB1DoXpxX9N+Z69HlpuJkaNaU0o06+AUapu9FDeyH
	4Ciiy1DbT04td9Gygt7wX2JT6vDJGZh4lEZ86wvo5EyPtWDd+LCQLTfUdMZSoJoj
X-Gm-Gg: ASbGnctqUP7QH781/K961cbT2hZc2O9UFtOsErzm/CN0Mrs6I7AO1hEA3pNKFg6r+UJ
	M8zcXA57kqLBGIp1blzW9Ebs9PW5YZrU44cD8R28ECKBRUy7iT/hPeWl01zL6nBBDDvxYUlN5ez
	cUclMd4XwOZyYgbxCHZnIgHSG1EmrHqK7s0UkoWT+tYx/maz0pcENfMWBsL0fTafqgg9h5pKJAD
	CU2t/hJbBcZYa50Ta2/22pkSJzavxMfb4hGz15V1AvkWF5TtPY2TvHE8KijJ5JyXYfv4Kcs3i0h
	74x4apAIsHAD5iX0AUqRcCRnLgx8t7wNc6/BfuDR/MhJ9TYXPn8L3FY2+Z0CRscHV+qsWVeY4K7
	c6h11ynE/cq0E8TAM/g9zXLoKVvKlz/JoKVoF4IONg9kMaauQF7A+q346MsodW+jCXj9uRVUTvQ
	CRaw2XqYCxIK4NBl8QyUOw9BM=
X-Google-Smtp-Source: AGHT+IEV6BlpW+/PldAgWCD5zyCJ7RpXN23lEBHl+OzR192paaiQ/VhagukoBwtJMRmjDKZmv2EoOw==
X-Received: by 2002:a05:6122:3296:b0:541:80ff:31a5 with SMTP id 71dfb90a1353d-554b93b1b43mr244698e0c.3.1759916298101;
        Wed, 08 Oct 2025 02:38:18 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf65395sm4421229e0c.23.2025.10.08.02.38.17
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 02:38:17 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-54bc6356624so496936e0c.1
        for <linux-mtd@lists.infradead.org>; Wed, 08 Oct 2025 02:38:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzLxE59c6TfsjAnUqiyc5JKhgoWwxzb52gZbUxNILC9ts/UTLi+ljE3uba8bv4guRnSpSj+xEVlbc=@lists.infradead.org
X-Received: by 2002:a05:6122:e011:20b0:54a:8ad3:7b5 with SMTP id
 71dfb90a1353d-554a8c9b568mr2813894e0c.1.1759916297008; Wed, 08 Oct 2025
 02:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <aN-XoqpP2Jz75pjj@stanley.mountain>
In-Reply-To: <aN-XoqpP2Jz75pjj@stanley.mountain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Oct 2025 11:38:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwpWLvnAWhHqPUL1Cg7dq3rX8wzptHrWC954T0sh9bEw@mail.gmail.com>
X-Gm-Features: AS18NWBegczPMChD6JEBf2DL6C5D4h1G1LphqBzffcl9ZraTnd023jN3u5ksKbg
Message-ID: <CAMuHMdVwpWLvnAWhHqPUL1Cg7dq3rX8wzptHrWC954T0sh9bEw@mail.gmail.com>
Subject: Re: [PATCH next] mtd: nand: realtek-ecc: Fix a IS_ERR() vs NULL bug
 in probe
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_023820_073135_61B6BAFE 
X-CRM114-Status: GOOD (  16.75  )
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

On Fri, 3 Oct 2025 at 11:30, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> The dma_alloc_noncoherent() function doesn't return error pointers, it
> returns NULL on error.  Fix the error checking to match.
>
> Fixes: 3148d0e5b1c5 ("mtd: nand: realtek-ecc: Add Realtek external ECC engine support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
