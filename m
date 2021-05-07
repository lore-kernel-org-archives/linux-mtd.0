Return-Path: <SRS0=11H7=KC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A90C433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  7 May 2021 16:53:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B0DB61008
	for <linux-mtd@archiver.kernel.org>; Fri,  7 May 2021 16:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B0DB61008
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nwJUGU8ZaoRhebzEDb5sn+04fRAxSKVTwdtBZF5fwX4=; b=bg0h6vCOx38Mvuv4zm2QxKFlR
	+aOiCtX2A/Pcmhjeo4ik7u6W+HU/PoxnkXL9xa414vPyVvLPCvi4z+OlhedRUiT5urGZTbX1VfmNB
	rfxvUSQgpg50Gd2J8IIralwTHU64XXP0WvBug2eDTmUEHWYNUCARsi2dYeIp5DA8rXujW9PlTQ62F
	M1yewL9tcByecdTcarnK22OIL18OpolBeUOGBLJ04hoBOGmlMH1/dwoVZNdjXN3uUnlsQhjrReBfi
	IAAu8ADQ5a7vO2Err5lvvU3ZvLxfvk6cw+YWcHeC4FB6prX902hXTCPrl+7Cji2LsggwVHhP2rMwb
	kR5hBU4Eg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf3hv-007bwj-J2; Fri, 07 May 2021 16:52:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf3fM-007bPC-LQ
 for linux-mtd@desiato.infradead.org; Fri, 07 May 2021 16:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dYP29pg/OnV05yhd4OtnZKNb/Vkg7K7Xnr53+6Bu5YM=; b=pgpivHeFlj8UBBy4ZKnNsctkdc
 pjSkuRNFnQUv7n3aQ6lXHIBeuVhLJfkIaYsGgylNe+H1j5oouUCxEgFQcRdIZ1AijneFjnTBudz3i
 NNH2GHSCGCJ6BUXaaV0rRgx04G2oKFWx7rU2Z5AmBxSw3pk9oFFkWQm0/srNBDaS77ymOvdUpvF6h
 9EymUf2zty/Q+wMYS0fLTr9+c51sVd8UfnhvCSHa5jr38J1so6aBnwpRrIUwA/gGpX54MCCFEGM3y
 zYlHkMVCnnYD5L6Qr+sDPeWM2jFJnuJPLH4BQOYZMefaHKkiYCVvB8KjDvLDUMeXaq9o2gwS4DL3K
 yPxHDWhQ==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf3fH-00710o-Dr
 for linux-mtd@lists.infradead.org; Fri, 07 May 2021 16:49:27 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 147GnG6B067773;
 Fri, 7 May 2021 11:49:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620406156;
 bh=dYP29pg/OnV05yhd4OtnZKNb/Vkg7K7Xnr53+6Bu5YM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=iNbF/LfZSUntCse7qnXSMLHxJaJc2vKUK2EE510Hzt3hvRNqvG5X44O05xxzpPLlS
 +5F6SB6GlvbQETiu5h5Z9YVtqXzz2cgoslz0bwPJJSniUut5OTWtei07hnTmWXbEL+
 X53WUSWSWGH4SRt75O/3ZKa8ivEFMRsApNpRXyq0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 147GnGuR121556
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 7 May 2021 11:49:16 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 7 May
 2021 11:49:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 7 May 2021 11:49:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 147GnFZQ055469;
 Fri, 7 May 2021 11:49:15 -0500
Date: Fri, 7 May 2021 22:19:14 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH 4/6] spi: spi-mem: reject partial cycle transfers in
 8D-8D-8D mode
Message-ID: <20210507164912.hwzsf6q65pfewtdy@ti.com>
References: <20210506191829.8271-1-p.yadav@ti.com>
 <20210506191829.8271-5-p.yadav@ti.com>
 <20210507154825.GE6383@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210507154825.GE6383@sirena.org.uk>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_094923_689060_67AA3035 
X-CRM114-Status: UNSURE (   7.99  )
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

On 07/05/21 04:48PM, Mark Brown wrote:
> On Fri, May 07, 2021 at 12:48:27AM +0530, Pratyush Yadav wrote:
> > In 8D-8D-8D mode two bytes are transferred per cycle. So an odd number
> > of bytes cannot be transferred because it would leave a residual half
> > cycle at the end. Consider such a transfer invalid and reject it.
> 
> Reviwed-by: Mark Brown <broonie@kernel.org>

Thanks. BTW, s/Reviwed/Reviewed/.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
