Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311B2C61DB8
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Jun 2025 01:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUGFDj65pCslQEVVJDZcG0z0xuXaXuriWYUEijkg9Bs=; b=wKvOwk6o7JGMEt
	QPD5SJ3tisredqZA2npgL5Nf4SPGN0t+8XyiEADTTkG1fFAsu1qgF7WjsAYK2zv0lUVHYHmEH5cLI
	trmmfqy1kFOYEgkK/bjBcQGu4npoZke6xDaumStbaWBQgQOpbyJhXit5ctOOhfpSLJrD4DFUHGjdT
	/Vty4gpu/VpOLQOc9apU72FT3WfYJ+iP/An9/Y/kBb/C37FHY1wcwzSu1yaV1lzI4fTHkt92W91Fg
	vfaxZ7+W8icFdr4oTE7VoXn3IXjEx/OQAw3mprY/U0bO1GFc5hec4QnuZk8DGlNS2xEjv/Ncpb6I4
	K41mshmwhVrNmqfa2OHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO4yf-00000002GT4-07uW;
	Sun, 08 Jun 2025 01:37:37 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO4yd-00000002GSL-0kWj
	for linux-mtd@lists.infradead.org;
	Sun, 08 Jun 2025 01:37:36 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2345c60507bso23107825ad.0
        for <linux-mtd@lists.infradead.org>; Sat, 07 Jun 2025 18:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749346654; x=1749951454; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sqvYpLGb/0ZKu/5EGoiw9KApDKUisG2VJYva5h7mD0=;
        b=LThhTGdfMSIDL5RUS1z7vUzTH0Gci0eKaF0UPDn28qquGzh0gY3p9cAPCpift9qxyg
         CnioIZvGx2ZI+I0VRY8E5qLnNEBvzyHykjvhBYjw2RGawRJkzg2a+aJV0sj+4SdVimpi
         cAoJ6C8AYRwGTCOxaSAVW0H4O5M8m2QRPkyJpW9Qs0A8XbLP8yHNidHZXlg7dmXeaHvl
         7KZjDs5myLB3C0QptE6GmbqkxygQPML7dWTSta+rfoeXM6BRPnsNifobAJ2Yy9zkkAye
         F7QdLsRSd0IvsVvmxTXsB0bwsFV+mhwpbK1fyT98HopDR7SQHOF0Dk9iK8jYz1Mt4cqa
         P8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749346654; x=1749951454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sqvYpLGb/0ZKu/5EGoiw9KApDKUisG2VJYva5h7mD0=;
        b=DJ1kviWRg4D7z0PEKAcRN0E8Pwxao72abFqTEAPEMxTe0NF+ysbud9vGARO23GdKSb
         4dOYbtpB1hyMHQHLSJivq9/3yGTWT2UGH7Osrn0oPfapxE01eKsrywq8mI+zMLQcw2rC
         cxjW07OmXW0W+FyzyshCYSTb01Oix/ke3ZwGwGW80jUDjIJIinw0XP0oIWhVVYgbvH2u
         Q4VWOSwu/RM0imXlQ+0acdqfDbkLsltXc+QNAdprmhOmWykDV2XXJhyUGUniXBfSbZG3
         g2vfxwRe9HgRTC19efOfP3CKqsYaBf3gWs93IdPRNUop0oEByqZYFJQWTdvXA5qbXDre
         geoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5jLMM7b6FXODzNRPSoELKI0L1Olq3M+9Oloqnfrft5ICe3qLqIveVyeYUNqzlRl5FJfYXFTP8go0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMKR86KgDUlBzlr4mspGKtM/XS6SL2QFpQtaseCRekJTs1Yu0m
	6f+diWNGedydBOgjUGbmIsh3oU7BODzLzCCZHHhnEn/1f/zBOCuk99OY
X-Gm-Gg: ASbGncsnckvS9qJVa25jixSnsWoqvyPDvAhrNrRIjBK/d1OSGnoK+F2eZHTsMKh2Xuy
	HxFeXDjLhLRU9vH3NeBDrvxMbfFSU40DIMGbI303E6D81NAwiwanwrJ1z67m4kNCLemM+PoUTqe
	ZIAbZ2H60DxS1GfTvjuGscvzENUQmJVsfr3FC+W+xtsLy9xXLK7tWfxSQO4pdIqmw81OCVVpG9q
	wVqRbUh8sE/MG8sp0V7hrAfqDgqgZxWAEZk5N5TGPq27hWQrkSioTrrEXHpSwfyo9L9eU+Fil4N
	7FejAEuDHPQqNSHORQrhMmunqKbgJTbcSs4oH9JmEEVm1Z7iuRCw0q9oatz7PrwkCnECt4cPxcE
	=
X-Google-Smtp-Source: AGHT+IEjsGLQhbeTJWsjluro9ebaeJGp9VHRlZ28GkxruIzIQd9kN018WpRicQMyZGKUiyZa1MSGIA==
X-Received: by 2002:a17:902:d484:b0:235:eb71:a37b with SMTP id d9443c01a7336-23601dce87dmr124564185ad.46.1749346654313;
        Sat, 07 Jun 2025 18:37:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2360340f945sm32484705ad.192.2025.06.07.18.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 18:37:33 -0700 (PDT)
Date: Sat, 7 Jun 2025 18:37:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Karthik Poosa <karthik.poosa@intel.com>,
	Reuven Abliyev <reuven.abliyev@intel.com>,
	Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
Message-ID: <9dfb2954-fc3e-464c-a4fd-8c1a4dffa327@roeck-us.net>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <20250302140921.504304-2-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250302140921.504304-2-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_183735_220062_D93943EC 
X-CRM114-Status: GOOD (  15.50  )
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

On Sun, Mar 02, 2025 at 04:09:11PM +0200, Alexander Usyskin wrote:
> Create master device without partition when
> CONFIG_MTD_PARTITIONED_MASTER flag is unset.
> 
> This streamlines device tree and allows to anchor
> runtime power management on master device in all cases.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Several of my qemu boot tests fail to boot from mtd devices with this patch
in the mainline kernel. Reverting it fixes the problem. As far as I can
see this affects configurations with CONFIG_MTD_PARTITIONED_MASTER=y when
trying to boot from an mtd partition other than mtdblock0, with the
mtd partition data in devicetree (.../aspeed/openbmc-flash-layout.dtsi).
Is there a guidance describing the changed behavior, by any chance,
and how the boot command line now needs to look like when using one of
the flash partitions as root file system ?

Thanks,
Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
