Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA745C169C4
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 12:08:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8173D20881
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 12:08:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dkVrMZeb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8173D20881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsBQHmj8fglrddob2fDdSJIfRSRXZ/EtecE8NM5Rwto=; b=dkVrMZebxf0NRQ
	VK6iRXwRnboET5rp6QR1d128lUU+MGMXkT8+mSrbZVvMZaSy5P/E7k+UA/PjmJSLlq7IoaVvq7iQ9
	i+MBNJ4D9BwKewwI8zhVSEt2Gc9eyRp/GqgGzwdBVUX0g0sC6Ot0gpQX4Ge+itj21wgVmEdOwpqYg
	M8QtjM7UP13hJFGCANQymLUCuyE+W81rP52czy/ncoA+atDGcur4QTLDel+MI6Xqm+Q8BP0yJhHGt
	ecHS5VtMupssbPkaV7iQB8kBODNbDAiEZ8zqKYx7UUfGm2ati6UWgk12FxYJhartbAhSrD3Hd6Mc9
	uwb7hfFKNfcvQrAp8JXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goSBy-0005u6-Eo; Tue, 29 Jan 2019 12:08:38 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goSBp-0005iG-2a
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 12:08:33 +0000
Received: from sntmail12r.snt-is.com (unknown [10.203.32.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id E9DFF67B8D0;
 Tue, 29 Jan 2019 13:08:26 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail12r.snt-is.com
 (10.203.32.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Tue, 29 Jan
 2019 13:08:26 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%5]) with mapi id
 15.01.1466.003; Tue, 29 Jan 2019 13:08:26 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] spi: spi-mem: spi-fsl-qspi: typo fix in author name
Thread-Topic: [PATCH] spi: spi-mem: spi-fsl-qspi: typo fix in author name
Thread-Index: AQHUt7jCop3Mc0YUEkGW97blapUdPKXGEDYAgAADy4CAAAJ3AA==
Date: Tue, 29 Jan 2019 12:08:26 +0000
Message-ID: <24c8ce00-5a7c-cec0-df5b-fca6e13bccb0@kontron.de>
References: <1548755607-27544-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <4759d7a9-71a2-70a7-2704-0ef7fa37b2ca@kontron.de>
 <20190129115937.GB10524@sirena.org.uk>
In-Reply-To: <20190129115937.GB10524@sirena.org.uk>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.43]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <BDB7042F81914B458C296A633E14A759@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: E9DFF67B8D0.A21A9
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, broonie@kernel.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-next@vger.kernel.org, linux-spi@vger.kernel.org,
 marek.vasut@gmail.com, yogeshnarayan.gaur@nxp.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_040830_368097_6DF2F5ED 
X-CRM114-Status: UNSURE (   6.66  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 29.01.19 12:59, Mark Brown wrote:
> On Tue, Jan 29, 2019 at 11:46:02AM +0000, Schrempf Frieder wrote:
> 
>> Mark, could you please squash this with the original commit
>> (84d043185dbe spi: Add a driver for the Freescale/NXP QuadSPI
>> controller) in spi-next?
> 
> That'd mean a rebase unfortunately.

Ah, ok no problem. Then please just apply it with:

Fixes: 84d043185dbe ("spi: Add a driver for the Freescale/NXP QuadSPI 
controller")
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
