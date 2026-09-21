Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20FEC982ED
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 16:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJb4b8T4AoMLZO8RP9yR96oHvlzJmWcK8Q+dopksJdM=; b=j/liVbpzxgHOrR
	xpoArDhYRiDb/pAg12Ueh+Aj4klsb4C8OGwst4KUxEYInWDO9rhkaIwhR77JX505KRSfhL+SnnvFC
	KyzHnxcho213TcpsnYNOr8M012gidEqxfo8j5Zy5ktNCqrfdyIpErm204zxrSyyzMbDIK53Upq2mL
	Q9N85ktJ4mCXFX1FnwReop3iygE2/wOUgGDQ32pRPdA9YrRyjiSmvZZpR52/Fctmc3Ex6XHwTPazp
	13cS99+y5Cq2TWqhdNSejeXeFtSNHcSWWB7KPK1SMi+0oe2sReV58X0GV3+Rytx5HpUeIacb6MEcg
	lbDbfbL/gGffTKxYqfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gXM-00000002m2v-1DGc;
	Mon, 21 Sep 2026 16:06:36 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gXI-00000002m1m-3R8J
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 16:06:34 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-868a9c48f9eso3784348b3a.3
        for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2026 09:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790006791; x=1790611591; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOTeQSx76a9v/ZV3YujOIEiYlAr7+SRsnm3/O5Z68jU=;
        b=bTUE2kvT7LWXZZjUKe15gYC1N+XD+r4E0A+noxe54mhlxQshCS+CScZvLjAA9JtTFW
         BrBJjgmnn+9dPGpslg3RxBUbmffxYoAtXNxe8UZNdIPU+8UwJEZWtySvKXuduaqcnj+j
         QdZCbcVC6VoqJc4Moc+d+QLHUhU38z1BEoR6nGJqfe6YXFSIdJankdOSyZVleiK05LyJ
         PuIy7rFijB5+qib2+ZzD3TYz0qULsNao5+Ri8kQiY52zzwIAFM6j+ymc0icE2//vHOiO
         v0lKSKwg+o5ZWEt9oQ61z/M3Sr7GECmGasgdcff1dptFRW4rj+eu83Q38ZczivZYCuS8
         VWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006791; x=1790611591;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UOTeQSx76a9v/ZV3YujOIEiYlAr7+SRsnm3/O5Z68jU=;
        b=d2ZJdW1Q8RiOaU+i32+bkV1kx8SZvj5xtjWJg5oGmgCSVJvh+vi06LAukvP93/Yujk
         xWevqueIr6c1pXBl0wv5RO+r/liY0gi9QVVPB/bQ6naRnHFRB//K05i/bM+rOmolgKE5
         CHVQ2/KA+4UM/cTptUnCwr7NDZASbW6WaHnsXsUUx/F+8UEo/zguAjHRQffCRBXaO8QO
         N3Kx7fgdixKKJf4gp/e509wqBLtI2KqFIsoEpQD83/KrYrFd5omsS67a5k2Lf12ycbPL
         47N8r61zNqDhTH7wN8AD9P/Dchmr93WgZLn16Ixk1KHqlZd1RfSPMfuGaClkEurck+mT
         u/AA==
X-Forwarded-Encrypted: i=1; AKwUvBx45lZkbbt2yewqNAAuIyvnnoJiyd1Ijlw5klGJRCIt2l94KslEULMuP4dKqB39PSadO32wt+1po78=@lists.infradead.org
X-Gm-Message-State: AFuF++mahmDlN0+ZnzNEWPwu3jKSaocsMqnULqmJUI2UhEv/fcaVLZz5
	X5pknNiNCvUwMngqY73EbidJ7pcj+/TExVIb2hdxnrG0WCoeHxrBkSPtm2AoBXo8ZMI=
X-Gm-Gg: AYBFou2MOBiFXPJ6kwaHoIVGTZnSCTMLe7v6NNQhbl7xXOPzDD62b9pyAu5jRXzShWD
	xVi99K2gntjMVzbgqY4cobQEPCYl4Mdjwe6+LK+Qequ6kHUO6jLqErRp8OJIWAid2xQzouYS2mg
	tsTb/8AIFOCYJr8RWbZ+uo6Ouz/zqNRFydnKt/j7sg0ZQ2Hg8ZVrqBukF/9NM6trEdkLKR3gD2T
	8/WlHlwrwFQk/n//05NvnPbEmK+jN0ovrYj75dOzNk03cp8IbgvHG8Xbu29T8itDQ3w4HoFU9pR
	gu2JhHizapTeyipnFa/ijCJlki/B0a4sN0D5jvklB1R3HCIMlfn8LC0IYc/R2g9m5IgBqmCTViW
	SIq9m761B8RcUfXOL8KU84Ey19XT2j66ni1MJl3B+uYphjh01UTAKGCgXPLEKuIpJQbegv+42Ex
	J92FbZYbrR0dWegGd3uBrQotCYOC/nx0aOsstXnLR+MpX92ZptF6wpQY5g49u9kKRWZCA=
X-Received: by 2002:a05:6a00:ac8:b0:878:34d7:6a30 with SMTP id d2e1a72fcca58-87834d76f20mr8319100b3a.36.1790006791257;
        Mon, 21 Sep 2026 09:06:31 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-877a95f915csm3487490b3a.29.2026.09.21.09.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:06:30 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>, soc@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>, Andreas Kemnade <andreas@kemnade.info>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Paul
 Walmsley <paul@pwsan.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Helge
 Deller <deller@gmx.de>, Tero Kristo <kristo@kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Aaro
 Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH v2 06/14] ARM: omap2: remove omap24xx support
In-Reply-To: <20260914140821.1805449-7-arnd@kernel.org>
References: <20260914140821.1805449-1-arnd@kernel.org>
 <20260914140821.1805449-7-arnd@kernel.org>
Date: Mon, 21 Sep 2026 09:06:30 -0700
Message-ID: <7htsnid1x5.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_090632_861391_49D26539 
X-CRM114-Status: GOOD (  13.40  )
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

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The omap24xx SoC platform was used in the Nokia N800 and N810 tablets
> released on 2007 and was among the first ARMv6 CPUs in products that
> made it into products.
>
> Unfortunately the early ARM1136r0 CPU cores had a number of quirks that
> caused a disproportionate amount of work to keep them compatible with
> later ARMv6K/v7/v8 implementations.
>
> Drop the support for this SoC in order to allow removing ARM1136r0.
>
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Roger Quadros <rogerq@kernel.org>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Paul Walmsley <paul@pwsan.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-clk@vger.kernel.org
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de> # omapfb
> Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Kevin Hilman <khilman@baylibre.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
