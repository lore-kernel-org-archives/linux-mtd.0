Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20581C433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 09:38:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B07A16192A
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 09:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B07A16192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XztIC96xx0kPTGwa6yih9qjcshGdKYx0qWj3Z6kSuYg=; b=CqVzAvpsRN+JOYVILxz6cQpZW
	YFKUrBYwiwEBKMT5YX1hGEQqePPxurUsdzYaX8fWhlkTmfyd1yJzKSkE3Mzy4L4emZLUfdggaMW62
	zrf0cXTslX4XWxB49UUOxn1qbUdeKE8SlGmyXatzoZA7sT51ivlPJeJJd4hjETd7EeJKH7e6Gq7Qd
	1Hz8MIOft2oVegWQbkBDi3bdLNPmlZ9eywyPdIG4rNVH9xGyX5QVPYaAfPldxmVxq6DwJlrC2SYL8
	+6Z9/tttaXvgsDUykBpV9YttcXkZtSg9YCKdRXfANyc0SZzlvzsClV4XeoAdrpfNFA/gtLw296TpQ
	4r0OHoPdg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOGzq-00BGjg-1i; Mon, 22 Mar 2021 09:37:14 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOGzk-00BGjB-K0
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 09:37:11 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12M9b1Mj028935;
 Mon, 22 Mar 2021 04:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1616405821;
 bh=sjaYOyfuxD3PTaEASCZdKGsP5bYsdhWDskFR5OVYIx4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=oMuurd86ues94bNJfl8xKmWKVaXixiyYwlqVIlSEDAmheaXh6uRogJZ7m2DXSG8rG
 k6TdUPtEBFBDKAcRSGzRCJkiNv0C88tu0k8fsrpgOJ6lv/2+qBgSLSkHM1D6rIK/I2
 W/U1EH5DQFtwsktDHHR/f43f7kxA+1/YIiUFxEec=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12M9b1mv028097
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Mar 2021 04:37:01 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 22
 Mar 2021 04:37:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 22 Mar 2021 04:37:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12M9b0vt079989;
 Mon, 22 Mar 2021 04:37:00 -0500
Date: Mon, 22 Mar 2021 15:06:59 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v4 3/6] mtd: spi-nor: spansion: Add support for
 Read/Write Any Register
Message-ID: <20210322093657.ozmloj2tzvbszims@ti.com>
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
 <af93c67815185940b02e95dfddcedda0dd1a6d36.1616130675.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af93c67815185940b02e95dfddcedda0dd1a6d36.1616130675.git.Takahiro.Kuwano@infineon.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_093709_094662_4F4B1604 
X-CRM114-Status: UNSURE (   9.14  )
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

On 19/03/21 03:56PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Some of Spansion/Cypress chips support Read/Write Any Register commands.
> These commands are mainly used to write volatile registers and access to
> the registers in second and subsequent die for multi-die package parts.
> 
> The Read Any Register instruction (65h) is followed by register address
> and dummy cycles, then the selected register byte is returned.
> 
> The Write Any Register instruction (71h) is followed by register address
> and register byte to write.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
