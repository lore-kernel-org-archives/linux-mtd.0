Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556CEC43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:21:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E42DF206E6
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:21:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DhEj7Eku";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="I6od8whv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E42DF206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iTsB7dJaPf7+XbAte5nCslPW05OMZQgUrsvZXV3f5No=; b=DhEj7EkuVWS/eUdybYMyPkP77
	46+bHlHQ7U3MWA4LXBhXCLPwglsj/8nzMlIoSGCDjB4ofc5SXLA3OhJJjwxmIrGViJUmTu//9RIXF
	Ssf06Tl5WFLq82I/VgIZXSKjjCzBgxRhYS6dYt4g/ldHVC1NbQjnpjGBfXjuk/hbICHgHFtpqhSQZ
	WcExst+3RBwA+lANKmdIEKq7Bmq1YDVDdVmuQjrVfOmuAAEbpwrOwmkjeUJFJZeyIeH5osplt3NxB
	kPdJG8cVc8vCfwJPGv0TEn5rkKnaIxH5U7Rv9gOE41P8D3sBciG4xKmUpVKqR+n9vGVuG4cyEQDHJ
	S+bBQBr+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIq5o-0000Mm-Ja; Thu, 17 Sep 2020 09:20:40 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIq5l-0000MP-Hw
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 09:20:38 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08H9KQUa003684;
 Thu, 17 Sep 2020 04:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600334427;
 bh=o/G6Ttb5tXkwUsYbFneKd0sNR2KUsPUJpKrh3SEytVA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=I6od8whvo0IX5ybcrAsrgFigrwhWZWttFikB49/4Ed853ZCyoGKLVxBU1/SYfXdNW
 WIOiYXEC6S+NOjElXBTiJw4uu5n7Be67dW5xt90FuJ79IycbFUKPpyf6WpE6sYzUft
 vkaiqPwRIR2G3g9zYxjcahfScnzSK+0Lx8k54UUc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08H9KQYD119669
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Sep 2020 04:20:26 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Sep 2020 04:20:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Sep 2020 04:20:26 -0500
Received: from a0132425.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08H9KNtK062855; 
 Thu, 17 Sep 2020 04:20:24 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <p.yadav@ti.com>, <m.weisser.m@gmail.com>, <tudor.ambarus@microchip.com>, 
 Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: [PATCH 1/2] Revert "mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()"
Date: Thu, 17 Sep 2020 14:50:10 +0530
Message-ID: <160033408067.22629.14676129068447290487.b4-ty@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <1599205640-26690-1-git-send-email-yangyicong@hisilicon.com>
References: <1599205640-26690-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_052037_688566_9CF4C9BB 
X-CRM114-Status: GOOD (  13.02  )
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
Cc: linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 4 Sep 2020 15:47:19 +0800, Yicong Yang wrote:
> Previous patch intends to restore the flash's QE bit when removed/shutdown,
> but may have some problems and break the flash:
> 
> - for those originally in Quad mode, this patch will clear the QE bit
>   when unloaded the flash, which is incorrect.
> - even with above problem solved, it may still break the flash as some
>   flash's QE bit is non-volatile and lots of set/reset will wear out
>   the bit.
> - the restore method cannot be proved to be valid as if a hard
>   reset or accident crash happened, the spi_nor_restore() won't be
>   performed the the QE bit will not be restored as we expected to.
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks!
[1/2] Revert "mtd: spi-nor: Disable the flash quad mode in spi_nor_restore()"
      https://git.kernel.org/mtd/c/7d90a9b269
[2/2] Revert "mtd: spi-nor: Add capability to disable flash quad mode"
      https://git.kernel.org/mtd/c/1afc0c89f6

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
