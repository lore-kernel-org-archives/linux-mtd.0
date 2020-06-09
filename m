Return-Path: <SRS0=GuhJ=7W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFE4C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2020 11:11:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81CF0207ED
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2020 11:11:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tPLGbmN4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81CF0207ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/LlnKkSSjZlfQgZJHhfsAa4A7C7HR3WfB6YePOmWAVc=; b=tPLGbmN4HwRKA4
	so6K675pPPNycwYDx6pyl5XmpO73JwnwUksHRKUNjsE2wcjGHST48Wn2RzSMBSRDgBLvTHc3cQyQk
	4xJsPv+YZ9xrCd2znTcaES2rVEWfLRlXZUwy0c5PBUNux6Z2+e4YAKossxGDLtvU4bqS6+ro3uX9f
	yQjLOs6lQoDgqL22QeiH1mKWH2MMK4AzBww52AUxYSbaTpiFMO15Qy10ZX25Z1wburQ7ciMFhnTa1
	NrcQxnoYq+YTJP5Y4c3Ja0Ll7HBsmkbFpKuLMxCSFiyoomBEI/I1WIIlU7XZoQg9ZcQBvLLej5xk8
	hAacB9RaZw1S1uwzs3qA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jicAH-000398-4w; Tue, 09 Jun 2020 11:11:33 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jic9y-0002oc-V4
 for linux-mtd@lists.infradead.org; Tue, 09 Jun 2020 11:11:16 +0000
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Jun 2020 04:11:04 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
 by ironmsg04-sd.qualcomm.com with ESMTP; 09 Jun 2020 04:11:02 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
 id A9CE021810; Tue,  9 Jun 2020 16:41:00 +0530 (IST)
From: Sivaprakash Murugesan <sivaprak@codeaurora.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 peter.ujfalusi@ti.com, sivaprak@codeaurora.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/2] Fix issues related to register access in IPQ NAND
Date: Tue,  9 Jun 2020 16:40:54 +0530
Message-Id: <1591701056-3944-1-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_041115_032001_7D1B2151 
X-CRM114-Status: UNSURE (   5.25  )
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
Ym9vdGxvYWRlcgoKW1YyXQogKiBBcyBwZXIgcmV2aWV3IGNvbW1lbnRzIGZyb20gTWlxdcOobCBz
cGxpdCB0aGUgb3JpZ2luYWwgcGF0Y2ggaW50byB0d28KICAgYWRkcmVzc2luZyBpbmRlcGVuZGVu
dCBpc3N1ZXMuICAKClNpdmFwcmFrYXNoIE11cnVnZXNhbiAoMik6CiAgbXRkOiByYXduYW5kOiBx
Y29tOiByZW1vdmUgd3JpdGUgdG8gdW5hdmFpbGFibGUgcmVnaXN0ZXIKICBtdGQ6IHJhd25hbmQ6
IHFjb206IHNldCBCQU0gbW9kZSBvbmx5IGlmIG5vdCBzZXQgYWxyZWFkeQoKIGRyaXZlcnMvbXRk
L25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8IDExICsrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKLS0gCjIuNy40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
