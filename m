Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6D2C43458
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jul 2026 04:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rf+FZYsSnRueEn5Trs+/3OPpzcwaFt4U6DV8koo8Aec=; b=C8s3jW8MQ6sZcE
	jt5kPO7Wj2ZNpnE7Unc/z+DYFVpeQMs+g8/t+3KFZQPIN6zvBN57v+7GP0ONOq8n2RPelk8pojXSN
	aBbZs22TSIuhduggLePYQ0cxmBPKtOztiCXwA/u7hdXP0c/14b8gfzObAuu51rpX1F2g7wcYOonGy
	Hebo1M5O7YAhNLkPdAnrqAcZWjPktiTQHKK58fYpyuRxSVWsy9pk2iYbrXSamPlYROPqKEH/wFajl
	2Eqe98h0+pp4LmiJ4exWBas2uI2LqcgThK46a2Fcy5tg1opl2UNutbEOQ9/JS7KaAryplkP0NuxpU
	9GmoEMoW7Cc0RwYyYhhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVEf-0000000Au4W-4C8F;
	Tue, 14 Jul 2026 04:59:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVEe-0000000Au4O-3TLC
	for linux-mtd@bombadil.infradead.org;
	Tue, 14 Jul 2026 04:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=cv6jNVw2M5JiygxhB0hq6qPCSObGW1wO8SbGB2UBhiE=; b=IpkIQaiBp1Ld92euZ4uP5J73ng
	INSVDuHN8UBKov2bVtG0i1BBjr7NnmunYZuLxDNeyMb4IyyHIAfiiKgrPYnKEm2hOHwCx7yO97Uln
	ptnaMGFRcHfjeRSzWTaXxnAjTWudiWsOmzAYbDsi4yTKrjLGAAQg4uIXURuGVrKrCPzHcWnh/fO+m
	HW33pdTFxNuzHbjMGD7k8ffvoZRG/O7Zl7r8/SAvu0mNfz2MiUatkbwbXlwxUF8UAftL5KFGiLsJ5
	66OxMX15JGzq59AKiMKDyJL8YWGoW7GfmNBeCrFDdvaV66cjGqdglWi5sutZSOxUmQYoGYna3IDYv
	/OhyMQTg==;
Received: from ns1.suksangroup.com ([103.13.31.55])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjVEa-0000000CCdz-26aa
	for linux-mtd@lists.infradead.org;
	Tue, 14 Jul 2026 04:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=suksangroup.co.th; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cv6jNVw2M5JiygxhB0hq6qPCSObGW1wO8SbGB2UBhiE=; b=qs9maHzfN/+EilQahqyM/1h5EN
	rycKAAifCNimsr6dBBwP4AtJiHhduRYXKpq59U2p2dL1p716GzRAKY8d2tmjpQbpSx3wsvi0A7/bY
	GKj6kJdq3ZIBq2/QHBLcxGUXarn2y8i5K7ltfMcFZ75eBwkEmczWwBvt7mJCZP7GgGl9izCsE3FbQ
	QzCoiWaTzLpiXSnGyQSeFfgyV+RoY5+mHrLIBJyJRqYAB9W9HBmoR8Rjg8JD2A/vIR57Lm9B/B6MY
	tJmo6Z6yHPc5TNCSYMqFth5cAbr7JPcBznRl7YhE3PqJ/MWeAgiDmMFyeIo8hyzHz93ZZtlL4bKv2
	1OemlikA==;
Received: from [207.189.26.187] (port=55827)
	by ns1.suksangroup.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <info@inbox.org>)
	id 1wjVEK-0000000FguP-3P0a
	for linux-mtd@lists.infradead.org;
	Tue, 14 Jul 2026 11:58:51 +0700
From: Harry Schofield ESQ <info@inbox.org>
To: linux-mtd@lists.infradead.org
Subject: Dear linux-mtd, project info
Date: 13 Jul 2026 23:58:41 -0500
Message-ID: <20260713235841.97442918161053D2@inbox.org>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ns1.suksangroup.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - inbox.org
X-Get-Message-Sender-Via: ns1.suksangroup.com: authenticated_id: smtp@suksangroup.co.th
X-Authenticated-Sender: ns1.suksangroup.com: smtp@suksangroup.co.th
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_055909_609545_D3FC54B5 
X-CRM114-Status: UNSURE (  -2.08  )
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
Reply-To: hanns.schofield@lexcapitalgrowth.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Re:Good day linux-mtd,

Please let me know if this is best email to send you the project 
info.

Kind regards,

Harry Schofield, ceMBA



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
