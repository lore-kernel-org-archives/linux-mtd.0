Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2DFD4979A
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 10:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aUUgVURqQ5z7FHT1wyug7l+upEPhZ8wXNqvetTAWvw0=; b=o6CJZcxxjP5Lf0
	UzvieDQ3qF/ikMQR2OHpi9r2iUTeo0HA+GFnIiSikNjYVhoRPW4A7nsQBAD21l4nt+Unn9zNtYIlb
	+EFOr3TAxTynyaNILeGoCGfIc8i97GqkcxTNSAEqehOBii1pKaVNL31JrsUc3UyPzVcZBnGnxFCoo
	+WxVwKrGK54PlL9MHnw28RoYHOTEBHbkD9jXRrvqS8eyPXY0vuH6718nDs6tT2k4EK7npO0pRhcOF
	a0SqFuojfrQ2UId3H40HqJzEbRhL82nuLu6q1yuxi92hCr48qP3ZWhWeD4jNupg3XqpmOsh5wWQTc
	3FZgdXIBcEjn7S2STDVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPla-000000091HL-1Bzm;
	Tue, 03 Dec 2024 10:04:26 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPl4-000000091C7-36ge
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 10:03:56 +0000
Received: from [192.168.1.107] (87-97-106-140.pool.digikabel.hu [87.97.106.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: hs@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9565E88E6B;
	Tue,  3 Dec 2024 11:03:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1733220233;
	bh=HokNuuQzeMkWB9URPxvGeb03vo8XymEkhKykn+Jl2dI=;
	h=Date:Subject:To:Cc:References:Reply-To:From:In-Reply-To:From;
	b=l/DikrR2H16CyHIB2zaOEkPdN4a4ujradnztGYdXKfXkaYMpw27NCBjk8YKoyjgS+
	 slUP5zUIn3vLGoDsLO7JbFSxB0hh2t3XJ22/6i8AMVrP8uxFWL/I0S1ouZNv+ftx0K
	 wjoNWsBURNe5/rJyaKDTPhpUVKZQTN0qZYrwSFk8CJQkZOhBd/ivKVSRj7PZym+Uhj
	 k0ZVMxJB/3Y3LhaUEiIJntUvVq1HCOIq3Wp1MGBi0h3DZHef9+/+iB5AMZKXyZVYuI
	 +mzQqSQfLTqpQmRfeVJKDj/drkEfRGO551k4Py352i91Gm+T7WfKKYwecj00/ftWIv
	 QaiDFhq+n58Ug==
Message-ID: <983c09be-232a-c770-59b2-98859ae60e6c@denx.de>
Date: Tue, 3 Dec 2024 11:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/3] mtd: mchp48l640: add support for Fujitsu
 MB85RS128TY FRAM
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
 <20241203-mb85rs128ty-v2-3-42df3e7ff147@pengutronix.de>
From: Heiko Schocher <hs@denx.de>
In-Reply-To: <20241203-mb85rs128ty-v2-3-42df3e7ff147@pengutronix.de>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_020354_933290_B9C95E25 
X-CRM114-Status: GOOD (  14.28  )
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
> The Fujitsu FRAM chips use the same command set as Microchip EERAM.
> The only differences are that the Fujitsu FRAM chips don't really have a
> page size limit, nor do they automatically reset the WEL bit.
> 
> Signed-off-by: David Jander <david@protonic.nl>
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> ---
>   drivers/mtd/devices/mchp48l640.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)

Reviewed-by: Heiko Schocher <hs@denx.de>

Thanks!

bye,
Heiko
-- 
-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
