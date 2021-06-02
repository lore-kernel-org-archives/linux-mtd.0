Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4E1C47083
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 08:27:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A10610E5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 08:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A10610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uCr6ZqEBFjalVLt9ZAvdyGD+4JFIkS7OlYKyCYC53jM=; b=u0OJxzF/R3aYuB
	j+4DsBNVnCuVO8yeFhNBBJ9qyVoxT4ZKSX5nRCVo4qgcJoAWA3/+/hMdsM5j9+ZA/kRcaVincLHpK
	sLPJLU/JWbr1xY4lNHcDpD9e1VQU3LNP2w93ZlLKHcYtHOl9PjEoZ33Xjooz2gthoZFsvAC2VkvJj
	CynIuNEETUFvD0f+06NlN4cBY7kcpgYmicSJmsLvhv/Sd3qNkEHAnstbs2VB02GmucGQfJjwLnSjj
	OD6vomn++nJqT8fbiYDeuAuWwjD+hpa/6x0Q1DUMfUq+kIIu7r6n2W4AT5UmtijOR6hKWNFH5yGkg
	T9i5Fxz4SCg/lVKhuHDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loMDT-002dPw-RS; Wed, 02 Jun 2021 08:27:08 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loLWG-002Nj6-C0
 for linux-mtd@lists.infradead.org; Wed, 02 Jun 2021 07:42:32 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1527gGHk040486;
 Wed, 2 Jun 2021 02:42:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622619736;
 bh=on221I0/fbDX/gm21Y2yHzs/Jt3SZPApRYBMpZhQw2g=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=lufhlBy4NtrGCtX5ePp062Lnf0ktHPnng6jRt3EU8AkLiTWWk6JoCQstL+kXMXnW0
 z6lLXNfrZb4FVMOCxuBz/m8O8u9LLBIMbJxhbs62s5cU0YumCrXQ7C+QcGHSbxKdCc
 BtcmLSCV1nENUu7u6eXsjNsgW9cS+BPxwnugD7X4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1527gG5S014263
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 2 Jun 2021 02:42:16 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 2 Jun
 2021 02:42:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 2 Jun 2021 02:42:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1527gFSs037775;
 Wed, 2 Jun 2021 02:42:15 -0500
Date: Wed, 2 Jun 2021 13:12:14 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: spansion: write 2 bytes when
 disabling Octal DTR mode
Message-ID: <20210602074212.o4dmwry747wortsq@ti.com>
References: <20210531181757.19458-1-p.yadav@ti.com>
 <20210531181757.19458-3-p.yadav@ti.com>
 <f875025538713a005b1c18f8eb5c24c0@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f875025538713a005b1c18f8eb5c24c0@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_004228_513417_69D01115 
X-CRM114-Status: GOOD (  13.66  )
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

On 01/06/21 02:47PM, Michael Walle wrote:
> Am 2021-05-31 20:17, schrieb Pratyush Yadav:
> > The Octal DTR configuration is stored in the CFR5V register. This
> > register is 1 byte wide. But 1 byte long transactions are not allowed in
> > 8D-8D-8D mode. Since the next byte address does not contain any
> > register, it is safe to write any value to it. Write a 0 to it.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> 
> Can't say much, because there is no public datasheet, is there?

https://www.cypress.com/file/513996/download

> 
> But looks sane. Same for patch 3/6.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
