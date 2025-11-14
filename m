Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F7CCDB463
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 00:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CoAV65sVaoD+f5vre2OZIt6k7bL1qHV1NTVt2llbA/A=; b=mJn2HnWBduE4BH
	dgnftY0fi7wUpsEcZ1nLV4mktZHqmdLVkVe7WcIhn8qOJO1N1wPdbOs4di4e5XO91aQvSrUOS2HHW
	+f+Slc0BM426Ueuyh7VwSuTO84Ku++3TiD/KRu3ch6f69yh8DsuAMo5mfvGK9hy13SBb59TegaWi5
	nEgJ1rDX3fBfb2rF2wpSPODnE9Z/VhGoTO0q9UnGI1sQ2bITPMSbBsiwbVkYKarRjMqi2ylFOOnkQ
	9rbl1mW4eOd0oa0+tpFj3anvahK6nOZr0WRVrsXEhqdkBWNTRWWcG09f/7h1UJjHL3J5LJQh83waA
	HFKRWGGGXNA5a8ldZfHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhWG-0000000BKR0-0jYV;
	Fri, 14 Nov 2025 00:18:28 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhWD-0000000BKQX-33gQ;
	Fri, 14 Nov 2025 00:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763079503; bh=tgj4qwPSqtvlzEkcm/52+P7MjV0S+qAniHiohDPo0A8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GkyGqkS6IIMZxaCKBhACdQHQ6mvERyT/r9NqjDiGFo16Z+NwCTOssy/7DcOeZO0Cn
	 yxFij23RxT4aCPdScnr5kgXCzHjuqey4u6b/8cPpieuXicXPHmvFqKlZMB3jwYMMPm
	 Finoiz3jvHnA446GR6mz7Fk5Qd+5/BvTa6ji7mhrkc80beA6tV3c/AdsGzzCLVyDQY
	 4wQOUDLpYEW//Oe0xrXrCPi5QvNjo73jjMgezm5AJw/wJxuHI5Al6mMnuTZl5cDF6N
	 kR6t0lvwT1kXpBjneCgFBVzmv27k3osXmeurlN/n2M48/l2/vAWxx3f3IF+WAZWNHl
	 HuRSh6naXR/cg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id C20663E1239;
	Fri, 14 Nov 2025 00:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763079503; bh=tgj4qwPSqtvlzEkcm/52+P7MjV0S+qAniHiohDPo0A8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GkyGqkS6IIMZxaCKBhACdQHQ6mvERyT/r9NqjDiGFo16Z+NwCTOssy/7DcOeZO0Cn
	 yxFij23RxT4aCPdScnr5kgXCzHjuqey4u6b/8cPpieuXicXPHmvFqKlZMB3jwYMMPm
	 Finoiz3jvHnA446GR6mz7Fk5Qd+5/BvTa6ji7mhrkc80beA6tV3c/AdsGzzCLVyDQY
	 4wQOUDLpYEW//Oe0xrXrCPi5QvNjo73jjMgezm5AJw/wJxuHI5Al6mMnuTZl5cDF6N
	 kR6t0lvwT1kXpBjneCgFBVzmv27k3osXmeurlN/n2M48/l2/vAWxx3f3IF+WAZWNHl
	 HuRSh6naXR/cg==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 46A0F3E0CE9;
	Fri, 14 Nov 2025 00:18:23 +0000 (UTC)
Message-ID: <bc32d69f-70a9-4f52-88d3-8e2e8cec7829@mleia.com>
Date: Fri, 14 Nov 2025 02:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: lpc32xx_slc: Convert to use
 devm_gpiod_get_optional()
To: Haotian Zhang <vulab@iscas.ac.cn>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251104100842.369-1-vulab@iscas.ac.cn>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251104100842.369-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251114_001823_810894_7A366C8E 
X-CRM114-Status: UNSURE (   6.87  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_001823_810894_7A366C8E 
X-CRM114-Status: UNSURE (   8.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/4/25 12:08, Haotian Zhang wrote:
> The initial fix for a GPIO descriptor leak added manual gpiod_put()
> calls in the error path and remove function.
> 
> This follow-up patch improves upon the fix by switching to the
> resource-managed devm_gpiod_get_optional() API.
> 
> Suggested-by: Vladimir Zapolskiy <vz@mleia.com>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
