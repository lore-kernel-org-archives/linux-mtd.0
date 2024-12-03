Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411FED4979A
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 10:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nakWbXcGqdN9x+oYF7OhmrE13INUsh0Ycb6g33n8388=; b=FxG+64o5y9eyEK
	iNzsov9vvbefK/clsIN/7cf0nSk5Pq3crg6Tt96LIzbViMNvam5a4h6An4MTbXT6/ZPX8n0Vmcxt5
	PN0hK8T4FuOgiJVPQQm0xs5y/PN7TKfMEAyr5BbAyqcvYgahiqVz1ivirWC+TXBgFRuALx+YGH/QS
	EA2P8v+/MpK/CTQDDag741WHKaHIuYLriUfLnDhLvDgtytt7mVr5AQb2yTrNXAmCI30Z8ZHnq05zf
	0CTc1T9Nf6w+AFYhCSr9vwphQYI7ksC6uUuVkLhqqqeMlA1Skr/pIM9sgOSsf8alvwi8ddmD4JIRg
	o1WxsGhB6bT3ik+ljWYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPi5-000000090Oj-0Vmt;
	Tue, 03 Dec 2024 10:00:49 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPfT-00000008zrT-0C83
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 09:58:08 +0000
Received: from [192.168.1.107] (87-97-106-140.pool.digikabel.hu [87.97.106.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: hs@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id EBA9588FED;
	Tue,  3 Dec 2024 10:58:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1733219884;
	bh=6+kB5Wl7gjZPdI2OI0HIygHEI3G3GMS7nXK/Vezw7xo=;
	h=Date:Subject:To:Cc:References:Reply-To:From:In-Reply-To:From;
	b=vX2G9rAJ9adCKPoap+Xcp4Uo/S1Z96k4xEvEe0teFmng5ZVSvEGp/fTr/Yh8wqo5F
	 bki/oa7qOjg+nikw2aPWTYLhisdmtInvjSx9e6ecTS1oVBZhnXQ9VvtsggKs/jgFSn
	 Bh1IElZ3Vmja4OzXmu6PFdiI+2fZukaHYW4Foiqrmnb+P7qVP3E8BsFiBEYLhtLXl2
	 GtBLrUkyg/80/1+p87v3XVnvYlxMKBZadEaBnBvNz/eKeFbuRHlnXKwwMWE1FEIqn/
	 BuLwzx2PbepI/qUE/7qFMFecap5TBykU8vCFHU0WvdfwYb6txowtTtk/QeWjWr8DHB
	 NbKtwUvmcM6vQ==
Message-ID: <71e330ff-c5bb-fcd3-1ebf-630cef8fc626@denx.de>
Date: Tue, 3 Dec 2024 10:55:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/3] mtd: mchp48l640: make WEL behaviour configurable
Content-Language: en-US
To: Jonas Rebmann <jre@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, David Jander <david@protonic.nl>,
 kernel@pengutronix.de
References: <20241203-mb85rs128ty-v2-0-42df3e7ff147@pengutronix.de>
 <20241203-mb85rs128ty-v2-1-42df3e7ff147@pengutronix.de>
From: Heiko Schocher <hs@denx.de>
In-Reply-To: <20241203-mb85rs128ty-v2-1-42df3e7ff147@pengutronix.de>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_015807_243586_945DD0B5 
X-CRM114-Status: GOOD (  14.87  )
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
Reply-To: hs@denx.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Jonas,

On 03.12.24 10:37, Jonas Rebmann wrote:
> From: David Jander <david@protonic.nl>
> 
> The 48L640 resets the WEL bit (the Write Enable Latch bit in the status
> register) to zero on the completion of write operations. In preparation
> to support chips behaving differently, introduce .auto_disable_wel
> capability, and, if it's missing, explicitly reset the WEL bit after
> writes.
> 
> Signed-off-by: David Jander <david@protonic.nl>
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> ---
>   drivers/mtd/devices/mchp48l640.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Heiko Schocher <hs@denx.de>

Thanks!

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
