Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BAFC05027
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jan 2023 14:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIo8/FQiNVJK+n69vraQyGW+gMmPv2nZe1L7r+uttR4=; b=bDxlxODmJlNHnG
	PU+RyLnjTD9acXj4gwfnYOTrI+qP3nthIQieRTK1oM/d7B4pEQl596J7bQdFu1c8mQNLeXW9Fan5q
	gAdNuSiBU3YAhbiM+LbHRoqC9zCGk7uLVmtO2G2dm2EWMj7rSJDrkcXP4Pd2ucX1nyV8oWerAi+xp
	MTtTp8bLad+uNIUu+0zqNP/1HR9ZhwcffOOVvevyKQwlnhPO8MnVeFEPQ8sjdNvyMXiEQ2YPcaif/
	bnFB0LO9N9SkvIWzfm5gotUeHPJKDRpLtfkGuDxjoioZN1JjzQNAaoG3OLD/qGOWa5ZIDb3rVatKn
	oOe77gCF8psHD7MAu09Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxxj-0000cz-Lk; Mon, 23 Jan 2023 14:38:19 +0000
Received: from smtp-fw-9102.amazon.com ([207.171.184.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxxh-0000cN-6Z
	for linux-mtd@lists.infradead.org; Mon, 23 Jan 2023 14:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1674484698; x=1706020698;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version;
  bh=SJX4PVYeLVKUMm0XqCg6voyg5gx9laMAgzbQqQcAGqI=;
  b=DzZRIxU6M2m5sf001WZEXVPmWqB51XOiktxRUHmRerw8sCWTOHqSTWWE
   LTOYc32+gdGJ7TPOh3ZYW/XyB8JDgjLauK9LvDwPsf1MH38N5PW/gh0sn
   ueRJXjbaIcpQUawPGrVQ8ZuI1Af+meGymQwvjKYOPJQPUPH5f1ImDiFn1
   c=;
X-IronPort-AV: E=Sophos;i="5.97,239,1669075200"; 
   d="scan'208";a="303213743"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-pdx-2b-m6i4x-26a610d2.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 14:38:08 +0000
Received: from EX13MTAUWB002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-pdx-2b-m6i4x-26a610d2.us-west-2.amazon.com (Postfix) with ESMTPS id 3BEEA40E7F;
	Mon, 23 Jan 2023 14:38:07 +0000 (UTC)
Received: from EX19D040UWB001.ant.amazon.com (10.13.138.82) by
 EX13MTAUWB002.ant.amazon.com (10.43.161.202) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Mon, 23 Jan 2023 14:38:06 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX19D040UWB001.ant.amazon.com (10.13.138.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.7; Mon, 23 Jan 2023 14:38:06 +0000
Received: from dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (10.15.11.255)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1497.45 via Frontend Transport; Mon, 23 Jan 2023 14:38:05 +0000
Received: by dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id 18BD020D8B; Mon, 23 Jan 2023 15:38:06 +0100 (CET)
From: Pratyush Yadav <ptyadav@amazon.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
CC: <Takahiro.Kuwano@infineon.com>, <tkuw584924@gmail.com>,
	<linux-mtd@lists.infradead.org>, <pratyush@kernel.org>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <Bacem.Daassi@infineon.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: Make CFRx reg fields generic
References: <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
	<20230110164703.83413-1-tudor.ambarus@linaro.org>
	<20230110164703.83413-2-tudor.ambarus@linaro.org>
Date: Mon, 23 Jan 2023 15:38:06 +0100
In-Reply-To: <20230110164703.83413-2-tudor.ambarus@linaro.org> (Tudor
	Ambarus's message of "Tue, 10 Jan 2023 18:47:03 +0200")
Message-ID: <mafs0r0vlb9kh.fsf_-_@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_063817_325355_874DA643 
X-CRM114-Status: UNSURE (   9.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jan 10 2023, Tudor Ambarus wrote:

> Cypress defines two flavors of configuration registers, volatile and
> non volatile, and both use the same bit fields. Rename the bitfields in
> the configuration registers so that they can be used for both flavors.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Pratyush Yadav <ptyadav@amazon.de>

-- 
Regards,
Pratyush Yadav



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
