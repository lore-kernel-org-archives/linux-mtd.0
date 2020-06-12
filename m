Return-Path: <SRS0=prrA=7Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDC3C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 06:50:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C219207ED
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 06:50:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qrkdhbPg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C219207ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=puo9S1k880Lmp9dRVBSlO6hXHDhUyI1LDWOAAg/7vaI=; b=qrkdhbPgiN86Vd
	qcvwwRWwikidvF5E5PGJHMHx8B9QPCl1Avb+RTnscx9m52MOQ4ITb5LHmJjhsFmyFnsZGDlyWslr9
	F2pw5SetPy+Lal0Yf9f9PRHzAwFAp693MU3pMISLcavo9uCVg7M8Ll+LBeroV0RYHqjjFlN75P6T/
	NNIVnF0RA6czffIejZLkDbuP7+Z9dGVYZ0G09d/WaqzSUV8bc2kGLkfsVoHMVU/NqdqE1FLW8qXE5
	/zzardn/8famDkUbRjUB1N2CdERyhy5uO29+rsUTBL3gwnjmlNVXHKNrIKUSoPNiaCcVmJ9jBg9SD
	DXJwlxWAy+mscLscjMKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjdWI-0001JF-3v; Fri, 12 Jun 2020 06:50:30 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjdVr-0007Dl-Ic
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2020 06:50:05 +0000
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 11 Jun 2020 23:50:03 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
 by ironmsg04-sd.qualcomm.com with ESMTP; 11 Jun 2020 23:49:59 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
 id 611052187A; Fri, 12 Jun 2020 12:19:55 +0530 (IST)
From: Sivaprakash Murugesan <sivaprak@codeaurora.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 peter.ujfalusi@ti.com, sivaprak@codeaurora.org,
 boris.brezillon@collabora.com, architt@codeaurora.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V3 0/2] Fix issues related to register access in IPQ NAND
Date: Fri, 12 Jun 2020 12:19:47 +0530
Message-Id: <1591944589-14357-1-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_235003_645250_04BD957A 
X-CRM114-Status: UNSURE (   4.29  )
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
Ym9vdGxvYWRlcgoKW1YzXQogKiBBZGRyZXNzZWQgcmV2aWV3IGNvbW1lbnRzIGZyb20gTWlxdWVs
CltWMl0KICogQXMgcGVyIHJldmlldyBjb21tZW50cyBmcm9tIE1pcXXDqGwgc3BsaXQgdGhlIG9y
aWdpbmFsIHBhdGNoIGludG8gdHdvCiAgIGFkZHJlc3NpbmcgaW5kZXBlbmRlbnQgaXNzdWVzLiAg
CgpTaXZhcHJha2FzaCBNdXJ1Z2VzYW4gKDIpOgogIG10ZDogcmF3bmFuZDogcWNvbTogcmVtb3Zl
IHdyaXRlIHRvIHVuYXZhaWxhYmxlIHJlZ2lzdGVyCiAgbXRkOiByYXduYW5kOiBxY29tOiBzZXQg
QkFNIG1vZGUgb25seSBpZiBub3Qgc2V0IGFscmVhZHkKCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9x
Y29tX25hbmRjLmMgfCAxMSArKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
