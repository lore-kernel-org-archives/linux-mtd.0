Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B78CCD1AB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 20:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3koOFzfugntE2yy27osbmGZT0vWuSuP8lvuMGpDzz+s=; b=q9+VUJM/brm608
	7TUmcui1AJjXbx6/y8jGPUYHYCcGhvVRANl8G2rdV3Yn0YZBbydAYdLY8IfNR3Kgy58w9neYonzO5
	7M7ZUKEh21YGGN/JN6KGqlM7cEYZRM6HEVyVVZCugBDejal/8dxQ36EQD4PXcR0UY+fhLZawzlLoy
	S+ii9UCtyGmPmYrAW9XldTZwLm2Kpdca19dgM4hUs1rk8ThrCd0TeApMwd2CH3egmAWXiG8GzTyBu
	d32iFI22numMFkg0Epv00XNEnNIBdKKt8u1MKLRW4wIM2nwINzcqZDxMVcEIwqsWyfXl9BMfJMRrh
	akz+WdTO+As0Zc9203Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBfI9-00000004EEO-2ezA;
	Wed, 22 Oct 2025 20:18:41 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBfI7-00000004ECZ-269V
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 20:18:41 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4D2B52C0982;
	Thu, 23 Oct 2025 09:18:26 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1761164306;
	bh=556VxUVeANKsso1HIStZpAFSR2trHjxyBLYbYMInw5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=liXuMCzTuoOfskuyid8fD0lFErhE59qmJUVKTocIgHMV7AhdQGA4bUGQbMInQyrD2
	 XL4GR259YLNxEr7qkGNmjZ3xY/6Mkp/MR2a/W2gsR8+klT6dhz+6V8blFjGcvNIKl7
	 8erncBOjveZtw2ikAzD28/411KqQuiC2haZ2YqTQESTcATQ0eQJHAF3yCL1ppVXLoh
	 YHAUV1T0OArRz6rZUZv1qom1ujj/ywsN7UvXZL9NJ0HosUsctJiTl0Iyop94kEvkzL
	 179LhMKOoEBsGodamIk+fIP/ajE370FMLpdYwRJ3oJslyQMP3e+pH+Omjdo25m76Bc
	 2Xm3dzCfxuU9g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B68f93c120000>; Thu, 23 Oct 2025 09:18:26 +1300
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.12.16])
	by pat.atlnz.lc (Postfix) with ESMTP id 2B88313ED76;
	Thu, 23 Oct 2025 09:18:26 +1300 (NZDT)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id 2677A2A0433; Thu, 23 Oct 2025 09:18:26 +1300 (NZDT)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com
Cc: aryan.srivastava@alliedtelesis.co.nz,
	enachman@marvell.com,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	richard@nod.at,
	vigneshr@ti.com
Subject: Re: [PATCH v0] mtd: rawnand: marvell: fix 8bit ECC layouts
Date: Thu, 23 Oct 2025 09:18:25 +1300
Message-ID: <20251022201826.3164850-1-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <87qzuvrr74.fsf@bootlin.com>
References: <87qzuvrr74.fsf@bootlin.com>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=NbFF1HD4 c=1 sm=1 tr=0 ts=68f93c12 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=x6icFKpwvdMA:10 a=J03ggO0UBPt6F8wS28EA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_131840_017429_8EE313C0 
X-CRM114-Status: UNSURE (   4.71  )
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

Okay, I will upload a new patch series.

Thank you,
Aryan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
