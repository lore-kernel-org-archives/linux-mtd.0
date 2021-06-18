Return-Path: <SRS0=7qTJ=LM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B26C48BDF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 14:41:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A848161260
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 14:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A848161260
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ermKDvcR3hC9nod3OZnvsW/P1Kf6rUhmLqxdqlbIcjk=; b=YkKsd6Y/aAoQw8
	/FTN0hLEW4elqnMiyLjydyjqEi4LhVaNM5kjR47whTJ+VenGCdyLsm27gir9N6BfffbdMUjYCAtaR
	89zQHxmZThBIVwGyOjbVsoJHavDr+uGVM3XoMTRo1RLJBRMoLxDtChKxEkn4r8r0z3g8tjOPErcDY
	tmSoeoOuRTdhot6OU/q7a0XEUVS9UIdP/YYfCDpQaZ+CN74fJV2HonUKobo2HYVa+SiKCcd5LRYkZ
	B06myaXEgiSkTBxUdtz0cqj1tvzCZ2d0HM8vO/QXbQlkWgBFaL0LzBe/8FW1MoANKdRvKe8P3igff
	fUZxEkvcEzMzllCqWFnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luFfk-00EXKo-8H; Fri, 18 Jun 2021 14:40:40 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luFff-00EXJD-T2
 for linux-mtd@lists.infradead.org; Fri, 18 Jun 2021 14:40:38 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15IEeNZY026566;
 Fri, 18 Jun 2021 09:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1624027223;
 bh=XCiiUC6/DdJ/G9x9Zx5amlsB3d7bKlx25c8cMWep5YA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Rsubx4mUTip2MOEffz+AVYRfpKvcO/d4/QlIqlxalG6cE7f7jugfRgBuysUI+hxb9
 fmo8dGq+1XkaLVs8l19fIg6xAEo7xH0BesfPuZqOjBDWM8UaO/9FmwA96uuK3vCcWQ
 Mvxen6dR2nHIrEUfbA8iq1s9HPFH4QHXPEAs5tjY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15IEeN89028527
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Jun 2021 09:40:23 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 18
 Jun 2021 09:40:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 18 Jun 2021 09:40:23 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15IEeIkS129394;
 Fri, 18 Jun 2021 09:40:19 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Heiko Thiery <heiko.thiery@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Alexander Williams <awill@google.com>
Subject: Re: [PATCH v4 0/2] mtd: spi-nor: support dumping sfdp tables
Date: Fri, 18 Jun 2021 20:10:15 +0530
Message-ID: <162402719645.24673.15238447229532389824.b4-ty@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210503155651.30889-1-michael@walle.cc>
References: <20210503155651.30889-1-michael@walle.cc>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_074036_885760_9ED26F11 
X-CRM114-Status: GOOD (  10.41  )
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

On Mon, 3 May 2021 17:56:49 +0200, Michael Walle wrote:
> Add the possibility to dump the SFDP data of a flash device.
> 
> More and more flash devices share the same flash ID and we need per device
> fixups. Usually, these fixups differentiate flashes by looking at
> differences in the SFDP data. Determining the difference is only possible
> if we have the SFDP data for all the flashes which share a flash ID. This
> will lay the foundation to dump the whole SFDP data of a flash device.
> 
> [...]

Applied to spi-nor/next, thanks!
[1/2] mtd: spi-nor: sfdp: save a copy of the SFDP data
      https://git.kernel.org/mtd/c/65b6d89d45
[2/2] mtd: spi-nor: add initial sysfs support
      https://git.kernel.org/mtd/c/36ac022862

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
