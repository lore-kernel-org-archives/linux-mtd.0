Return-Path: <SRS0=prrA=7Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EA4C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 07:59:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 859A7207D8
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 07:59:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jXR7n+2V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 859A7207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qn7sW8YLUh4SrooSUrVuCAp1PLsjU+D3JfTDuKQyMeI=; b=jXR7n+2VnaeDk5
	5dTKNgOSZ0dWBB9zm7tbm82G9GWTuotLg2qMUbN0K1h4qVj29BdplTz3TKJh29hBfMpwNMMOyasUK
	Eh9Vu5OqBsDILWPYpiHJDAafwaDD4fFeR/kOKjLKjWwlFtXtzDP3iJe8ew0H6LqUuJonBjX3zu1Eg
	aA6Y6S8qiWb0V7W5thhJXVpV1b59D0QeeAZLdNbZBIz0pOmx0T6Z9sR6LaPqoTJJAs8MLyI8NRfAG
	KOuASeobMCYeOKyEKzG2buV0rM/OI8J4anqhvoL4Ni/EPSTIKSsif8JQ3lMow9tj0ZUUwF7qZ1sp5
	EXAckkxdbnqNRQ/UDtsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjeaX-0001kv-Cn; Fri, 12 Jun 2020 07:58:57 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjeaE-00019A-Dx
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2020 07:58:39 +0000
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Jun 2020 00:58:26 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
 by ironmsg04-sd.qualcomm.com with ESMTP; 12 Jun 2020 00:58:23 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
 id A34822187F; Fri, 12 Jun 2020 13:28:21 +0530 (IST)
From: Sivaprakash Murugesan <sivaprak@codeaurora.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 peter.ujfalusi@ti.com, sivaprak@codeaurora.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V4 0/2] Fix issues related to register access in IPQ NAND
Date: Fri, 12 Jun 2020 13:28:14 +0530
Message-Id: <1591948696-16015-1-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_005838_510287_9963B5FE 
X-CRM114-Status: UNSURE (   4.51  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

UGF0Y2ggMTogYXZvaWRzIHJlZ2lzdGVyIHdyaXRlIHRvIHVuYXZhaWxhYmxlIFNGTEFTSENfQlVS
U1RfQ0ZHIHJlZ2lzdGVyClBhdGNoIDI6IHNldCBCQU0gbW9kZSBvbmx5IGlmIG5vdCBzZXQgYnkg
Ym9vdGxvYWRlcgpbVjRdCiAqIEFkZHJlc3NlZCBtb3JlIHJldmlldyBjb21tZW50cyBmcm9tIE1p
cXVlbAogKiBSZW1vdmVkIGFyY2hpdHRAY29kZWF1cm9yYS5vcmcgZnJvbSB0aGUgc2VuZGVycyBs
aXN0IGFzIGl0IGlzIGJvdW5jaW5nCltWM10KICogQWRkcmVzc2VkIHJldmlldyBjb21tZW50cyBm
cm9tIE1pcXVlbApbVjJdCiAqIEFzIHBlciByZXZpZXcgY29tbWVudHMgZnJvbSBNaXF1w6hsIHNw
bGl0IHRoZSBvcmlnaW5hbCBwYXRjaCBpbnRvIHR3bwogICBhZGRyZXNzaW5nIGluZGVwZW5kZW50
IGlzc3Vlcy4gIAoKU2l2YXByYWthc2ggTXVydWdlc2FuICgyKToKICBtdGQ6IHJhd25hbmQ6IHFj
b206IHJlbW92ZSB3cml0ZSB0byB1bmF2YWlsYWJsZSByZWdpc3RlcgogIG10ZDogcmF3bmFuZDog
cWNvbTogc2V0IEJBTSBtb2RlIG9ubHkgaWYgbm90IHNldCBhbHJlYWR5CgogZHJpdmVycy9tdGQv
bmFuZC9yYXcvcWNvbV9uYW5kYy5jIHwgMTEgKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
