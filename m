Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FEFC02184
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2025 17:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHPm5p3segaKu+INKnjeEyCEe7YMVYbr2qhhYMu0ipg=; b=BNrs9/PJCARJXH
	x4HXlZZp5dmMf7+isCOrvMPlM30UctRPMKSW1T+QubPYr3QZPiJG/MUTJS1esOITLCHQhXFhGrkCm
	4v8GOjff1qBX83LT10sybo54WwCzkysQAbsJ/7adKVOgwe4Ukahhuao+APTrZFgtZLFBxNUe4wc4t
	3EBF9AvSqqmx0hMVQ15P0K9dq0QS4jUfpcmk+bAskxT08sL17PnI9sgICrPlT8FhHVb3gJWWrqPY3
	nlMAFzfiSmwNkBLKdyTSHtjz2bUyC6aKqFKEO97GL+WgjLpa4ky5tbPrQH3Q3KILayrlR5QXST2gF
	0R8cNOoT6lZw3xxutNsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOd3-000000066x1-1CCy;
	Mon, 13 Jan 2025 17:53:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOd0-000000066uh-2DiF
	for linux-mtd@lists.infradead.org;
	Mon, 13 Jan 2025 17:53:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 127355C4D45;
	Mon, 13 Jan 2025 17:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5136CC4CED6;
	Mon, 13 Jan 2025 17:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736790809;
	bh=Mbaqz/iL9+y+LbYxvbXxmpMiirddhpJkYFEMZRIxN4g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=d3NcD6x4k14wUkN/0Cv23DtM53T1/jRUnqOy81HomBcukfpiKRNO5HmJGz45JxtG9
	 DRPLfrIT/J5+YxTceFcL34R7Z2lRFtj8nw/IxNaCNPWFKrpvzCEceWflrABRYq/9Ko
	 YsrZyt2P2MoNnTTM5CjnkeGStcSsFGM6bHWRk73GeKleQbKc6iXcdAb23ttbhta4rs
	 fUJV3WGsiuvJtYaWENhFy1UJ16xfUYIWnRLj2Hfk5q6kIvY4kehj82DJR7mE0AqNYH
	 2Xp6qaBAcb2rNCqVzudiblSJzZXPgD1zB1QvUl86SwhMhKDnWJMtUs8uVbOiDcZky8
	 Hsrq3x5e/TfxA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: sysfs: constify 'struct bin_attribute'
In-Reply-To: <20241222-sysfs-const-bin_attr-mtd-v1-1-ee13140a4e9b@weissschuh.net>
	("Thomas =?utf-8?Q?Wei=C3=9Fschuh=22's?= message of "Sun, 22 Dec 2024
 21:15:55 +0100")
References: <20241222-sysfs-const-bin_attr-mtd-v1-1-ee13140a4e9b@weissschuh.net>
Date: Mon, 13 Jan 2025 17:53:27 +0000
Message-ID: <mafs0cygq7g88.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_095330_605575_796D637F 
X-CRM114-Status: UNSURE (   7.46  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBEZWMgMjIgMjAyNCwgVGhvbWFzIFdlacOfc2NodWggd3JvdGU6Cgo+IFRoZSBzeXNm
cyBjb3JlIG5vdyBhbGxvd3MgaW5zdGFuY2VzIG9mICdzdHJ1Y3QgYmluX2F0dHJpYnV0ZScgdG8g
YmUKPiBtb3ZlZCBpbnRvIHJlYWQtb25seSBtZW1vcnkuIE1ha2UgdXNlIG9mIHRoYXQgdG8gcHJv
dGVjdCB0aGVtIGFnYWluc3QKPiBhY2NpZGVudGFsIG9yIG1hbGljaW91cyBtb2RpZmljYXRpb25z
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgu
bmV0PgoKQXBwbGllZCB0byBzcGktbm9yL25leHQuIFRoYW5rcyEKCi0tIApSZWdhcmRzLApQcmF0
eXVzaCBZYWRhdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
