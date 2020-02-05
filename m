Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B103C35249
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 08:31:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AC2720730
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 08:31:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W3WGVG4Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCv9gBZ8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AC2720730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zqQHbIkvG4MdeHMHY8rC5qOfcxjToYJqCIqbxT5yJR4=; b=W3WGVG4YAU/3lBfVZQscw41dw
	pBY1WItKFNiREscNZRepUIbzOI18/xbaqdKprneKv0oHFg3PI0o8/xWcZJFt5GjyJm7jnEJlMac2A
	07leUYhGM2laBLfcrWzy3yn9qKFRM7pk6s5ymaHx8887d6VPLxc1N308d/nainKY6ypWYzCa15eFz
	mDpe1yiEZsJU1rAj018tOUOnIilRylnNecv/N2SM8P4wSKtt+EcoPhQ3eIwKHiWJhWFAiTgBg+jE9
	TBJh/tTzJyTVBk0fMfvDTy8R357YnSCP0l/zWbhmVD+l5xpY6nYcYqZg5fI95sN1RWhtw7FNOuM56
	vxzcMzaFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izG5c-0004VY-Te; Wed, 05 Feb 2020 08:31:16 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izG5Z-0004VD-P3
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 08:31:15 +0000
Received: by mail-lj1-x241.google.com with SMTP id n18so1401438ljo.7
 for <linux-mtd@lists.infradead.org>; Wed, 05 Feb 2020 00:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=c8n0mXSccT+l6YN9HAsG8bOOgXHE9MPTQrvWGoZzRN0=;
 b=NCv9gBZ8s+Hd0aW9t4fGhh7NP6QoDggSeW7bm+8LB1v1XtGdGOyx/1CKOjq//2R7nz
 JS0a7nR2LvVvOkAFG/zyiqBDqhk/41q9qQdI67LeURmaoankbzQrIQXWm63mkDgxY0bp
 K3h2aENaCj0F+kQRm7BK3Mn/ohWAd4OPYgT9Su96qMPrL3b42/F6DIJbsupgZdIlZ/Kf
 FJ+rFB9MI7hWYf+mdYJum7BWJ1JMTs8dEXaIC0CsDDGLln7cP34MzLsJUUhC36WS0tja
 UWXLYj/oUZoV6zl/h+50QF4hQFugbDuBFtCWeX/epCZI/8fcitS8a67tD3cdahKDgBJt
 osUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c8n0mXSccT+l6YN9HAsG8bOOgXHE9MPTQrvWGoZzRN0=;
 b=BeuAlAKF6Xaqb/b6eFtD4oGTrwD4eZz1zZxfiaUIT1vgniG3Yai8QMVXophJ8lwqok
 /mIRsNiwDneH8iqNPctgk4PgRtbzbj8xtHZEdaylfwIPg1aSK+Zy3wnpDOk3l4iKkGsG
 YdIdhkQVVjoc0+ZdYQXp9js+9ev79DG+oTUhYeKg2aBuVufKihqpa9K5/1HekCnx4+MZ
 /yfzxSHtrgxCBHQbk6V0qCTqV7GWxYM+ZkqFiovBNUsM0fTVgp8+rdMb4KgY9f4ARccQ
 +rNuD4ppMRZMCRgueEZtKpbS5KJxa/9KZDJjmVA/p+tX92c+d4ECaNHr8Gy6url2BsGt
 BnUQ==
X-Gm-Message-State: APjAAAXDfvgHznCRjsBjKQ+d/teIYnLnDCPMkC4MuUoLIVw6d5fAxKG7
 nvDEqJpczgbCNh20DoqbigcLj886
X-Google-Smtp-Source: APXvYqwgymKyFiDe2PxfIj4p9UeVPWKvIYodvWwNcXd5wO2F94yWSv67GbTtyz3g1j4m6ZoGKTPRZA==
X-Received: by 2002:a2e:9716:: with SMTP id r22mr19685003lji.224.1580891471251; 
 Wed, 05 Feb 2020 00:31:11 -0800 (PST)
Received: from elitebook.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id w19sm11769545lfl.55.2020.02.05.00.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 00:31:10 -0800 (PST)
Subject: Re: [PATCH] mtd: core: allow mask_flags to be set for
 mtd_add_partition
To: Bruno Pena <brunompena@gmail.com>, linux-mtd@lists.infradead.org
References: <20191126212511.1218-1-brunompena@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <449b471c-3604-ffab-b75a-47ed119a5ba8@gmail.com>
Date: Wed, 5 Feb 2020 09:31:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.2
MIME-Version: 1.0
In-Reply-To: <20191126212511.1218-1-brunompena@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_003113_809832_059ACAE4 
X-CRM114-Status: GOOD (  11.19  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 26.11.2019 22:25, Bruno Pena wrote:
> This patchs makes it possible to mask certain flags for new partitions (e.g. to make them read-only).
> The change consists in the addition of a new argument "mask_flags" to "mtd_add_partition" that is passed on to the "allocate_partition".

Your description answers "what?" but not "why?".

This patch adds a new function argument that is never used. This seems
quite pointless.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
