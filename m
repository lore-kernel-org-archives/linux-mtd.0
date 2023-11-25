Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F15C4167B
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Nov 2023 17:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncbqpFVqc4mCuXCWsJN+VpXNUjjyhBhal6G5iK+K2HM=; b=zacfLZ5txpnRfFB1VqGRKEsFNt
	2YbM5YXdyi0PWEXTK1bTJe7ONoYIoaG4cx/C+lRsEKMcgtCeLAfGOp1JGo4VhXm7ZrFIEBkuRzCVI
	nZw5lezKCZEESqn/2bW7/6SjJq73ob5xE5+CrQjVigoF9g9CBQfdUheKt3nIDt3dcEi4aN/YLzVpi
	04UJ9RoR7kFhgLMX5SYSbzJljnPzygm/tGH8+Cu+da6vTF3svt0qmBx6P1EEZICZYb8fv7ymGo1WD
	E2Yg2WVZuHEOl9Z5/kEuwtrehLgB3V+RhcsCIhQGnnvK+sNxIK0UKIUY4gpCz8zP9jft6Wy1p5kKZ
	ZMsCWJiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6wTC-009YjW-03;
	Sat, 25 Nov 2023 17:29:30 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6wTA-009Yhr-0c
	for linux-mtd@lists.infradead.org;
	Sat, 25 Nov 2023 17:29:29 +0000
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8002787158;
	Sat, 25 Nov 2023 18:29:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1700933360;
	bh=RlwM36/Eve0Vl6Dwjb1bhH2vCr+F58ntQbNm9SP0wRQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T+Z5s3EsjXnkrcqyyXeMRs5SJPqrMV+Yk2O1t5ddOGH5wYVyeGhPksXqBdS+35Fzs
	 EJ8qPthUyrBQKgUkds5B4HZSM1GbbXKsJP3N/J0YD+nC9W3yy6GObARlVv3g4gLqi4
	 yQJFGD89fVdpO/Etr4Z4e0Ny8D5S5vJ5to6juXuYkgwIYoKfquA0ptsTvCZXqix1z5
	 bGBamaAANiQTfEpuHA8+SoERdeqRYp44sZtUfRm1CX1aJEuTAO6LnOjygi+m3D/wRd
	 pXY42uenJnkBx38bpmvArqBGEOOhxRPNgsCZ9n1CUUISGoH5WfeOQ1VRWU1Kn/bgTJ
	 F9zSpcMSXpLHQ==
MIME-Version: 1.0
Date: Sat, 25 Nov 2023 14:29:20 -0300
From: Fabio Estevam <festevam@denx.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, michael@walle.cc, linux-mtd@lists.infradead.org,
 takahiro.kuwano@infineon.com, bacem.daassi@infineon.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] mtd: spi-nor: introduce die erase
In-Reply-To: <d7ce98eb-c920-413f-bbe9-059077a9dda7@linaro.org>
References: <20231125123529.55686-1-tudor.ambarus@linaro.org>
 <d7ce98eb-c920-413f-bbe9-059077a9dda7@linaro.org>
Message-ID: <6156a51f7eadc9594404bb0eacabe1a6@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_092928_408525_4093A33D 
X-CRM114-Status: UNSURE (   4.93  )
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

Hi Tudor,

On 25/11/2023 09:37, Tudor Ambarus wrote:
> I made a typo on Fabio's email address. Now added correctly.

It looks like the Subject of patch 3/5 is not complete:

[PATCH v3 3/5] mtd: spi-nor: micron-st: "

Feel free to add to this series:

Tested-by: Fabio Estevam <festevam@denx.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
