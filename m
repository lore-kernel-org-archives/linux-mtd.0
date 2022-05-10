Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3B6C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 11:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70dmAI5Vn0NM032NjrdAJtFcOPhl7erLj1Cn52bhnSQ=; b=TQECqLNEVe8UfJ
	gQ2Rs7RZrbb/Ho3dWhkCI2494lvjm+dQm9pTdOT43DSzB+eT84lu18vpGPhVAmh21QOQofOnE8iLg
	1gF4UoiFvT4PEZAIiBjVxg8uMv7us3ZrHWiGoD7EJgE8c75IVL39eKUqgyuEG3crurON4pFrKKxWJ
	I5FG4+M9QOixJzVntNZRuecuEGTwABSXqC63oXiIlNWVNj+B/2Goai/vnyiRZj+qwgu1whbRggHNM
	2vojRdy7q9nbXnN2mr0J4l4gJenTyAKt8rugmOvqORuIPyCaMlS6ttetZlSSfxKfjal0gCdyBBcro
	aiHgBMAL73MikJ2ApKtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noNtj-001Ui6-Gb; Tue, 10 May 2022 11:19:23 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noNta-001Ud2-0s
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 11:19:17 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24ABJ7p6045467;
 Tue, 10 May 2022 06:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1652181547;
 bh=egVFr2Lzju1msu86aPi0W2+t8awHwoi94vZ/ftvnOe0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=cfe/J7N3ealCUTAmQ+kbBWcyJAlrDCZWQI8Xu+y8z34T4K7Brd8fSAT5IQbbP1xNz
 QGpCJ5GkOW7cR88XZ+DclFO1+253F8JN+0R4gOr5+/ra2OSEnxJkfpHwTyQuCZSANv
 0n8+EeY9NUyRdTknuNCLioB21Av3pvVleiGuLiEI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24ABJ7aK067320
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 May 2022 06:19:07 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 10
 May 2022 06:19:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 10 May 2022 06:19:07 -0500
Received: from pratyush-4F-325.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24ABJ3fp127309;
 Tue, 10 May 2022 06:19:05 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: export spi_nor_hwcaps_pp2cmd()
Date: Tue, 10 May 2022 16:49:01 +0530
Message-ID: <165218141900.322959.8359522970509700885.b4-ty@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220429102018.2361038-1-michael@walle.cc>
References: <20220429102018.2361038-1-michael@walle.cc>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_041914_200734_741D4B63 
X-CRM114-Status: UNSURE (   7.42  )
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

On Fri, 29 Apr 2022 12:20:17 +0200, Michael Walle wrote:
> The function will also be used by the debugfs module.
> 
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next, thanks!
[1/2] mtd: spi-nor: export spi_nor_hwcaps_pp2cmd()
      https://git.kernel.org/mtd/c/d92e0dbc6a
[2/2] mtd: spi-nor: expose internal parameters via debugfs
      https://git.kernel.org/mtd/c/0257be79fc

--
Regards,
Pratyush Yadav
Texas Instruments Inc.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
