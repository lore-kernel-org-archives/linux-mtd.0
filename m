Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B580CC433C1
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 17:38:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E37A600EF
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 17:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E37A600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wND/Z3WkTWkFPi3acOMxJI6/73fj07oJn7hA4YLzJuE=; b=QxHc+YGAloSvHQxIE9PQ0U5c/
	efBxcJk+4VAtttFnhsESSTY0A+ZHkVhPHM6nFCbT9CTm1W6SLr/13CxDIabeTb/CIevWKYyIKigPt
	ZnfDpHs5zzBZikSJDmtpdkztvLE4DpzIz38Li47HiJZ6MmybpLhkMh+2qoFz+c8UFWD7Egm9C+vh4
	VhbSPCqN7+H9aswkKinq6CKejjgnwtx5Qsr0Hh5DKoTrSqIZlh/VhsjdLmqTK4XxV7FZopagvHvA6
	5BZT1bf90dpArezwieLaJI4ndnSGnyFhbpZLkhJ6YpNMG+aU3LbXdaep+1Hi79oOSiYQqEuHzTyXw
	8nU1CQrwA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOky8-00FQWR-Nz; Tue, 23 Mar 2021 17:37:28 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOky3-00FQV4-JC
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 17:37:26 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12NHbJx6029342;
 Tue, 23 Mar 2021 12:37:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1616521039;
 bh=NaCGwoEUHH+k+osfCBM3nTshiBBLSAEhoO5SYYzZHMk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ZgGoCIZJ7Htt/InCp/+0tA0RHV2AS2vqSV43sv1qxL7nuCb3nSqs95m6W78oT2Wf3
 sq2wcGNqwX6pPXdfqF6hWc9rJSo0nesaOAx9knZ4POooc8TG/QgqAyzgB9CGGWawqr
 W3XWt/c13mRH+bTrlYuTKIP+URfyDFCSIrNl/M+A=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12NHbJeL066918
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 23 Mar 2021 12:37:19 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 23
 Mar 2021 12:37:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 23 Mar 2021 12:37:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12NHbIQ9011218;
 Tue, 23 Mar 2021 12:37:18 -0500
Date: Tue, 23 Mar 2021 23:07:17 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: sfdp: save a copy of the SFDP data
Message-ID: <20210323173715.gyozhzbjyfv5osuc@ti.com>
References: <20210323143144.12730-1-michael@walle.cc>
 <20210323143144.12730-2-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323143144.12730-2-michael@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_173724_029592_98C4F8B2 
X-CRM114-Status: UNSURE (   9.38  )
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

On 23/03/21 03:31PM, Michael Walle wrote:
> Due to possible mode switching to 8D-8D-8D, it might not be possible to
> read the SFDP after the initial probe. To be able to dump the SFDP via
> sysfs afterwards, make a complete copy of it.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
