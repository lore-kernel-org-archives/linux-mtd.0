Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48591CCD183
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Oct 2025 12:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+9avtz/c0DAi24bWpKe/H/ojvuSBckcK/4i3QZCrSw=; b=RIX11dgzEuBHCq
	ln4asvYwz/0ockNxZjb8sPcUc9BQhs/F9UVXHYpgl8scLRlOPNt8tGulComGSt66iMok2U242ds/e
	YqdDNVQnoaVkNOsAdHambDPhcfb499uBeBKl7Vhr0TbTZSq8hDVKjX11RIkKVEtpdWsrq596BO/E0
	0dr37VXt7bt92yqDWqjpF4z2azRAjIpHvktKropEmp2kgPlT/Q+ivK8mEMnSY0I88369FMMQMIwgI
	EpKUhbYXKShX7ZDNENgNPWDbN8ZFnbps3QVhzSN3OlFPl/40XJrO7SYa8eNb0oZzrKLgsS4VW0PzN
	fmBEJdlGSufshSkDLn8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TTR-00000003q7h-2ddi;
	Wed, 08 Oct 2025 12:40:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TTP-00000003q60-0KuJ
	for linux-mtd@lists.infradead.org;
	Wed, 08 Oct 2025 12:40:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C227743957;
	Wed,  8 Oct 2025 12:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CEFBC4CEF4;
	Wed,  8 Oct 2025 12:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759927250;
	bh=ScMSz4dASWHUMNw3VMR5HsvVzsipH3DOHnYd9nCasRY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CfU0F376MJf5m4TlX85hI6/0B4baf0AA6sM8NcaosCKppQUqeyigqH5Hj8nBSzTYP
	 rCxb3+Hkn0ZoPV0GYWc0XWS9+BQ+L6CXWdtukRSo38N3yGfFHSMzxLcc2Qc7cJj2O2
	 tUCBKpTkMqvbhpxPZNDMAX3wgDLZssPOyJv1V14oaNLoj8aMALyGb7NQZZyiyUOMoX
	 qWe4JwDqddCSmU15PCtP9dmXaNDOxBUo3Wwa2ix9HAubCm9Tn+ru/Q1lUpXFIhPlmk
	 iky8HbbHJpb0VCgTlyT+kUec2ULq7M3GLxyspFSi21wKh83/ScvXOBfa5PsgmUjf1U
	 wYe/OOkG7/IZw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,
  linux-mtd@lists.infradead.org,  Richard Weinberger <richard@nod.at>,
  linux-kernel@vger.kernel.org,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
In-Reply-To: <mafs05xcpo9sz.fsf@kernel.org> (Pratyush Yadav's message of "Wed,
	08 Oct 2025 14:30:20 +0200")
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
	<mafs0ecreontu.fsf@kernel.org>
	<4888cefa-e8be-4f0d-9d4a-c82f9ff6cda0@linux.dev>
	<mafs05xcpo9sz.fsf@kernel.org>
Date: Wed, 08 Oct 2025 14:40:48 +0200
Message-ID: <mafs0wm55mur3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_054051_157013_E699A2BA 
X-CRM114-Status: GOOD (  14.96  )
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

On Wed, Oct 08 2025, Pratyush Yadav wrote:

> On Tue, Oct 07 2025, Sean Anderson wrote:
>
[...]
>>>> Tested with a mt25qu01gbbb, which shares the same flash ID.
>>> 
>>> Ughh, is this another case of flash ID reuse? Do mt25qu and n25q00a
>>> flashes behave exactly the same and only have two names? If not, then
>>> how do you know if n25q00a will also work with these changes?
>>
>> I examined the datasheet for the n25q00a and determined that it has the
>> same status register layout.
>
> Can you share the links to the datasheets?
>
> Also, test logs would be nice to have.
>
>>
>> In fact, every n25q and mt25q flash has the same status register layout,
>> which (as noted above) is necessary to support capacities greater than 8
>> MiB (and all flashes in this series have such capacity).
>
> Do they behave the same? If not, do you know how they differ? If they

To clarify, I mean behave the same in things other than the status
register.

> behave differently, we might need to have some code that detects which
> one is running. Not necessarily as part of this patch though.
[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
