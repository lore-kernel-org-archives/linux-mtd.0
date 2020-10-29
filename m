Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39D4C4363A
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 04:46:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDC7F20739
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 04:46:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C/MSwTYq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WHkCEeDc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDC7F20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X6ZfED9n7fWRwaSiJFToDCeZ3sv+TeZqfBfzDgVvi9g=; b=C/MSwTYqXick6skN6PEKSbcXB
	9JVMnx7HtJhz9xa+R04MUy+PvTiCSEAoofk67dHMKysCHZhOOh3M9Qs1aPpsDuMPIY5fHL8rRKCgt
	CB1MrH1M3iTU8P5C2PO0/yjHUBRc6A1ovv0n/nJ99VBLjmDO7R7Nm3XP50xNuxZaGL22smQXJM/LN
	cfXfp+SB+uwZOiYJfXc0Xi8Tr3sOK1A6Efcz0CFAOSm7AZo6VZTIN3MQz+YVz8W6DsGCzk3eovST2
	m8o5XmL8FOZn82osLRkh6q5ewOSUP7yVUFK50Ghz2VhUInX8ZJEfzPxDyP6oPrnli+INEDVAc6EnP
	Pk2NI0ffA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXzok-0004bV-2k; Thu, 29 Oct 2020 04:45:42 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXzog-0004YY-Bh
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 04:45:39 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09T4jWMt107694;
 Wed, 28 Oct 2020 23:45:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1603946732;
 bh=k90ElPyffvW0MrNwFrUL11wCz1vV2AcGkf9Sc5wDWRk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=WHkCEeDcWpcXtiUh0hAInZvMhfWPBC3pAkkXYIpjbGri9QWWjbWgKcR022t4ILO1C
 c94/bGBwwWbx4FzMLz4OEwKxiqiYc8gunYD/QNSvW9WPbu9QJgvguYRtYIcketyCIU
 PHoFLrAm/+D8LDlfW9Nqx6S8YDWWdvcaC6w8Fzko=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09T4jWxX093357
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 28 Oct 2020 23:45:32 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 28
 Oct 2020 23:45:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 28 Oct 2020 23:45:32 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09T4jTX0006901;
 Wed, 28 Oct 2020 23:45:29 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Alexander A Sverdlin
 <alexander.sverdlin@nokia.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Don't copy self-pointing struct around
Date: Thu, 29 Oct 2020 10:15:08 +0530
Message-ID: <160390597173.12290.18229990126806445717.b4-ty@ti.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201005084803.23460-1-alexander.sverdlin@nokia.com>
References: <20201005084803.23460-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_004538_500839_5D40D156 
X-CRM114-Status: UNSURE (   9.73  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 5 Oct 2020 10:48:03 +0200, Alexander A Sverdlin wrote:
> spi_nor_parse_sfdp() modifies the passed structure so that it points to
> itself (params.erase_map.regions to params.erase_map.uniform_region). This
> makes it impossible to copy the local struct anywhere else.
> 
> Therefore only use memcpy() in backup-restore scenario. The bug may show up
> like below:
> 
> [...]

Updated Fixes tag as suggested by Tudor.
Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks!
[1/1] mtd: spi-nor: Don't copy self-pointing struct around
      https://git.kernel.org/mtd/c/69a8eed58c

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
