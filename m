Return-Path: <SRS0=eGw4=FM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EA5C4361B
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 16:10:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D088E23AFD
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 16:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D088E23AFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C5INhZZ/+3I77O0m7FEtHM7S0U/VKiO2EgUvVmKtrnw=; b=BUrqh7/hF1BrEMTQHkh4i07Gy
	ufu5X+lH23oVwv40nuNTrzHoIqlPD58G8BLaxiNGiXUL4fDJz+lbke+bkFP+1NHwPYfoFs5jEb1hF
	c5UilYqYIB54qKkgRkTXjpwB5VseZb4IQllVNZtsj7AbbATyxkt5ESCrudnZfztgKt4NOcPMuywHO
	bELrmzZOMBLtHsEpPBhRSV6x91kNS8NLPRNGJOw6b3miwI+yKg8aSy7yN4WDcwnOSTUb7tRtAyQfa
	iJUTru1HD/hJvtwtMS0CttmKnodJuUL/aMHVzwTgBTfvexzp793CqT9j1kQaVvLWrdfxHjzVX5HxC
	OUdspTSZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfYX-0004Yo-Iu; Tue, 08 Dec 2020 16:09:37 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfYU-0004WX-5I
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2020 16:09:35 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8G9Rij019515;
 Tue, 8 Dec 2020 10:09:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607443767;
 bh=jMCEtiq2Ao4YQ3i7cSDVzFtia9wKjw7cZl1fnWcBEHQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Dngqj84XT6QThr0Ggwg3zm68AkooCN9hL71wjz7A4Wb3Sj19dltDVGJOzR+Pv/gJ4
 /lglzN57j3/TClcwiyuh/YJjmiAH66nLvCc2D7axBw6W+e7iOWN4/j38A0Jo5Gaskk
 +gyBj2VPzsS18gA+AsrO+lZ7zydBznVVPx1NJZDw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8G9P0M085701
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Dec 2020 10:09:25 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 10:09:22 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 10:09:22 -0600
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8G9JcR113149;
 Tue, 8 Dec 2020 10:09:19 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Fix multiple typos
Date: Tue, 8 Dec 2020 21:39:13 +0530
Message-ID: <160744362728.26394.7229666527748628666.b4-ty@ti.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201130152416.1283972-1-j.neuschaefer@gmx.net>
References: <20201130152416.1283972-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_110934_400281_A4621961 
X-CRM114-Status: UNSURE (   8.62  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAzMCBOb3YgMjAyMCAxNjoyNDoxNSArMDEwMCwgSm9uYXRoYW4gTmV1c2Now6RmZXIg
d3JvdGU6Cj4gVGhlcmUgYXJlIGEgZmV3IHR5cG9zIGluIGNvbW1lbnRzIGluIHRoZSBTUEkgTk9S
IGZyYW1ld29yazsgZml4IHRoZW0uCgpBZGRyZXNzZWQgVHVkb3IncyBjb21tZW50cyBsb2NhbGx5
LgoKQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9tdGQvbGludXguZ2l0IHNwaS1ub3IvbmV4dCwgdGhhbmtzIQpbMS8xXSBtdGQ6IHNwaS1u
b3I6IEZpeCBtdWx0aXBsZSB0eXBvcwogICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL210ZC9j
L2M2OTk0MmJkYTUKCi0tClJlZ2FyZHMKVmlnbmVzaAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
