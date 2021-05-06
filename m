Return-Path: <SRS0=TrVe=KB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF884C433ED
	for <linux-mtd@archiver.kernel.org>; Thu,  6 May 2021 16:58:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 692DE6109E
	for <linux-mtd@archiver.kernel.org>; Thu,  6 May 2021 16:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 692DE6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q8n1ecM7Se6lZBAXuOEtEwUFV13fGg8wjjQsBv7epAs=; b=paCiUVFXSVG28l5F/6jDjN9lS
	WTVvK/9diZQNNx6bN7KJr0IDVcJKYtXCt15qcRlGKBsaeEjmX0uvued8vg5puBPEPViSN5VcbLobM
	yg8jyhg8xeVj+d2YyLqqtMqfPyRrCQFFWvx8YsaPBaJoLr4EmK4UpFMkD7hOlO/vTO8MPcuEBDOCQ
	5FHnT3Tcv4qQ2J0Unhf9VNua2Wg0hK4oqe2W+qW4Nu/5A03NRjlHId9RnqKw4jlTbhLp8D4lXkBhk
	7hCcYvJBLkWF7q9GQy+XBOtm6W3Ny7yere3QDQD0lJu8qEHBsLdiuX/3BEEKIH2SP6YeyHLppzVOZ
	8ZE3QRxvA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lehJy-004swb-4p; Thu, 06 May 2021 16:57:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lehJw-004swJ-FL
 for linux-mtd@desiato.infradead.org; Thu, 06 May 2021 16:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=aKIZDf6p7yqHU0/M48XDUklaK10NPx/BO4DIR7oZzrY=; b=ChIJVXXT429TMsSFHuWi7cxUFG
 FJPloZzGNxU9SWiOgnPjyp7zqccVSBPZIm8ixTzQEHR6InKW2HwwwFMRIJuxvzRFuuwFjwAGFuBik
 Sw6l4Kn+/uv11vFuVok3jdbT2PUhea7r20y4hG9L0BVfmt+kMQke+vmzzI/vS+qblHbfyAv3NsS+P
 CAbeqqSfnLPMixufGOZm/2uh3DPEg5p86u8b8W5sqKe+JZzrm+qpe9mpa+itaRNudSHLR37+rgQKs
 2yZKSmiOF/Iuv8XqPPG8kOs6tsSNDRFAPjApWecgkZLJ3mrJ1f+UtB8Xs3212Qn7iEyF3JNWjZaoX
 huv8rZcg==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lehJt-006EgC-5G
 for linux-mtd@lists.infradead.org; Thu, 06 May 2021 16:57:51 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 146Gvh42048889;
 Thu, 6 May 2021 11:57:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620320263;
 bh=aKIZDf6p7yqHU0/M48XDUklaK10NPx/BO4DIR7oZzrY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ijY61wYFuw5qoikuyQDQI0Cct70HrFw5keE/JXRhmrN0uCyhBK/PcQrmQ3z0LBxwh
 Vr6txNOhlwB1PfBM5CxT4OKAxvMywn3EUCisikjbsb5BTGDrdq0o9+k3ZRaH3UlYDo
 7wq8GOxiI4K/NUh1H7BvBsz97V5ad+Yyvpz+W0jE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 146GvguR128888
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 6 May 2021 11:57:43 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 6 May
 2021 11:57:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 6 May 2021 11:57:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 146Gvf2n071542;
 Thu, 6 May 2021 11:57:42 -0500
Date: Thu, 6 May 2021 22:27:41 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: otp: fix kerneldoc typos
Message-ID: <20210506165739.vlreo6bj6erpiyij@ti.com>
References: <20210505200017.17499-1-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210505200017.17499-1-michael@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_095750_127571_09993E91 
X-CRM114-Status: UNSURE (   7.54  )
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

On 05/05/21 10:00PM, Michael Walle wrote:
> Use the correct argument names in the kerneldoc.
> 
> Reported-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
