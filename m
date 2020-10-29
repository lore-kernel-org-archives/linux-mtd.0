Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF50C4363A
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 04:48:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AD2D20739
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 04:48:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K8pQ88AV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="zInayPCx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AD2D20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eQ7diJFsHsC9htHlraaF3OzdPuKgAmn9V+CTqKGhnEE=; b=K8pQ88AVdwBDvTs3s7CoxFHjB
	+NBxLNGTsEoBC4yf0x6MQAjeY1P1u0d7NPChceRVDi8qudjd8PNzQGrTFZCyFOwwK45KVDoGZo+5I
	z63bZrX+Y3q06/OjB1EHkDdA6hKpD2oUwAwfetfrT9EX3W/2LtsKpE80vEW8W+dPom79ryfNOGzX7
	q8jNfYSqxoe9UXB1zDss9CvZmUKyv/AvUCb13xoMi4H4LnPWra6HEUSJTlaxCotVJ8y73ONbTQKIQ
	Fj9AHJjw0KLvhl3VBhjO+jER2BC/pFH6a86haM82XS+ECzCNyMnhmo6k8NkzMbyosWTevQKaO4vMK
	niw6HOU5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXzpa-0004h4-S2; Thu, 29 Oct 2020 04:46:34 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXzpY-0004gc-6T
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 04:46:32 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09T4kP4H108091;
 Wed, 28 Oct 2020 23:46:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1603946785;
 bh=ZHzDgXy5n/TKfBP+owyaj3kVbyqfBFp5+LAX2bZzh6o=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=zInayPCxMbBtlmPL9Xjmm0gP626sZOqh+wwGHW4mu+pp/q/FIV4M4eAycN77CkImM
 CsuzgdqmKNhkk8eXyJ8ZiSK3SEPVVufqjuNdHxp7Mtg9c65x6Lt5dr6QURooHKTQ3e
 Lm+o63YMTM9yWKPNVsi2Hl8aD1QBLw7bV7pywGvg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09T4kPLS107855
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 28 Oct 2020 23:46:25 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 28
 Oct 2020 23:46:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 28 Oct 2020 23:46:25 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09T4kMH0095353;
 Wed, 28 Oct 2020 23:46:23 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <richard@nod.at>, <linux-kernel@vger.kernel.org>,
 <tudor.ambarus@microchip.com>, Bert Vermeulen <bert@biot.com>
Subject: Re: [RESEND PATCH v2] mtd: spi-nor: Fix address width on flash chips
 > 16MB
Date: Thu, 29 Oct 2020 10:16:02 +0530
Message-ID: <160390597173.12290.7971814843989994724.b4-ty@ti.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201006132346.12652-1-bert@biot.com>
References: <20201006132346.12652-1-bert@biot.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_004632_329396_A830E18E 
X-CRM114-Status: UNSURE (   8.81  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 6 Oct 2020 15:23:46 +0200, Bert Vermeulen wrote:
> If a flash chip has more than 16MB capacity but its BFPT reports
> BFPT_DWORD1_ADDRESS_BYTES_3_OR_4, the spi-nor framework defaults to 3.
> 
> The check in spi_nor_set_addr_width() doesn't catch it because addr_width
> did get set. This fixes that check.

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks!
[1/1] mtd: spi-nor: Fix address width on flash chips > 16MB
      https://git.kernel.org/mtd/c/324f78dfb4

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
