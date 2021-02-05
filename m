Return-Path: <SRS0=fkbb=HH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCCCC433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:32:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEEA164FBC
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEEA164FBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CiGY3eywL9kLqwT+TcpWAzQAp3+Zj8jvV8hIYOEepQc=; b=vEtQ4ypc0Mr0TUwJ8xryO6M7D
	ITT5AvinlGlVoGKU3aBFpaz5Jqgob4y+r6dsdaZ2/d/MIxOiplmwewmB+WTbwp73aT8XgZBkS/T6S
	ydUycehJzMaL+lxgZkjG2MXK47deWyKf6FmN7BXU/muwkmy+cv6zKS5mgg3F85RuSKPIlpI3TUZxN
	aBD7jrBDZTlcRYjWQhMK6uF0tDRHTXv5eOa1ZYh5LepkudS2JvIq/A2U/aAoBsI4dEBoblzTF0mId
	tuJ4PMsAqo1orNazKwCAEFx8XOWPVQLRgPSeZjSKa7X1xWv5pZnUu1S1fmGCg2SkVUmYRlH19o5fZ
	ngwZ2L/dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l81D8-0000CP-OH; Fri, 05 Feb 2021 13:31:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l81D5-0000BI-J2
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 13:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1612531903; x=1644067903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TJ1Xni7oqhJicMe/bn1BWlaG9kF212vvJiz63NgX33g=;
 b=mamMVWQ4UOu2o9+Pa9MujL1a3E52DbzYUnbOe8oXPwNOQAPI+ao5j2w8
 QGQkC44bIc0Flz+IHUr9ijs9rwA/RV7NJNggPrCitJtUSAvoBS0z0aANw
 AJbwskp6I0JmxpDoYU9ZDbTNIowVvenWTpF7JDzLZHz/N4rkg7p5yNuXc
 y/56fhzCdF9/Bmm9xY2ez4KBGNptIWS4FnPs1mko3UfAbqSlUDPnO6utb
 H2C8HdP5f3X0NA7WmQ7vF/hv4Ce75SPMvTs3tybS5nHzVZsUsQg0e5yyv
 UT3nmthVpgYQ5IQQ7UWnjy+ZB8qmCOVyGFAgvge9jpnCl+aWZe5KVjJJl A==;
IronPort-SDR: 8SPAgU3YWjpaUOym2T/H2rY69Knb4on0rW6QdWhP1OFUe7mz2ZNNoHtqnqDyKsIjjgrX2Nfy6t
 EDWRsWggWMJWPkxIbKPOobSH9O+BmKVZvXx86M4fNAOJtRM5NhjwW6kRYuABndCi+KTUsUE7um
 MW4PevwyCMvoynRyE4Ugf4+/cFHBOXiuuCjBazaKEm0QyVnmw50+fhUgQilC9LZfViCgULVaqx
 dqWsrpR39nzUMHLS8k64FcDfUBmNEdcPkEB2cc2gncy/BibuixtRXK3KMMRqMMhK6a4azYTZFx
 PKU=
X-IronPort-AV: E=Sophos;i="5.81,154,1610434800"; d="scan'208";a="43072524"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Feb 2021 06:31:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 5 Feb 2021 06:31:40 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 5 Feb 2021 06:31:38 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 <p.yadav@ti.com>, <michael@walle.cc>
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: Add Global Block Unlock command
Date: Fri, 5 Feb 2021 15:31:33 +0200
Message-ID: <161253178923.670759.16987268553514371903.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121110546.382633-1-tudor.ambarus@microchip.com>
References: <20210121110546.382633-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_083143_794247_0038F83B 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kavyasree.Kotagiri@microchip.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 21 Jan 2021 13:05:45 +0200, Tudor Ambarus wrote:
> The Global Block Unlock command has different names depending
> on the manufacturer, but always the same command value: 0x98.
> Macronix's MX25U12835F names it Gang Block Unlock, Winbond's
> W25Q128FV names it Global Block Unlock and Microchip's
> SST26VF064B names it Global Block Protection Unlock.
> 
> Used in the Individual Block Protection mode, which is mutually
> exclusive with the Block Protection mode (BP0-3).

Applied to spi-nor/next, thanks!

[1/2] mtd: spi-nor: Add Global Block Unlock command
      https://git.kernel.org/mtd/c/a7a5acba0e06
[2/2] mtd: spi-nor: sst: Add support for Global Unlock on sst26vf
      https://git.kernel.org/mtd/c/75386810d3a6

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
