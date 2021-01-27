Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787C2C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 20:47:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E475C64D9F
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 20:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E475C64D9F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZeGkvk68jz4vnnrhBdf6FM1aUFPi7Ruf+nxiTdzc3PM=; b=jAkQKAR3gdOUQsUQDeqO1RgEe
	4+duMwb+iodVt1ADlhyi0lfDFWtxt+fu2UpAsb018PAcswkVj2cDzKA3tpb8wSCQ0rOdbGm5F+Ja0
	TnxGRaRGHiRbPVu2uL5yDiQ4yWAjc3hKMBBzp0gBe7E1m+spcib4l9c4cT8ae9LW2vvbJ0jwD/NZ0
	O6p3EubrjaD7Ykdk8kylXeZuQrIUPSYGGT2NNmxIVfVrAgtoiQeXhdgo+16gKnn4juAmhTB1kXors
	euMYQqCwJ5T5s0u21Ug26p6dYUsyArm5G0vbpVf9/b1JZ+HFt/jlb1HzLGfju8tU3kMMEWJrp5NbI
	rU/RPUIhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4riM-0005vB-2g; Wed, 27 Jan 2021 20:46:58 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4riJ-0005tS-JV
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 20:46:56 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 78CDF61D8A8E;
 Wed, 27 Jan 2021 21:46:42 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vdBZFFYqQkLv; Wed, 27 Jan 2021 21:46:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A4ED961D8A97;
 Wed, 27 Jan 2021 21:46:40 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id p5INWvL6CD1R; Wed, 27 Jan 2021 21:46:40 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 79A2E61D8A8E;
 Wed, 27 Jan 2021 21:46:40 +0100 (CET)
Date: Wed, 27 Jan 2021 21:46:40 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Tomas Winkler <tomas.winkler@intel.com>
Message-ID: <9732911.325628.1611780400338.JavaMail.zimbra@nod.at>
In-Reply-To: <20210127200319.662842-1-tomas.winkler@intel.com>
References: <20210127200319.662842-1-tomas.winkler@intel.com>
Subject: Re: [PATCH] mtd: use refcount to prevent corruption
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: use refcount to prevent corruption
Thread-Index: r0YCwcJ7fDRcCCdg7evH/Zy4+yWw0g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_154655_757604_9EA587B2 
X-CRM114-Status: UNSURE (   6.71  )
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VG9tYXMsCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiVG9tYXMgV2lu
a2xlciIgPHRvbWFzLndpbmtsZXJAaW50ZWwuY29tPgo+IEFuOiAiTWlxdWVsIFJheW5hbCIgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0PiwgIlZp
Z25lc2ggUmFnaGF2ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LAo+ICJsaW51eC1tdGQiIDxsaW51
eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJsaW51eC1rZXJuZWwiIDxsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnPgo+IENDOiAiVG9tYXMgV2lua2xlciIgPHRvbWFzLndpbmtsZXJAaW50
ZWwuY29tPgo+IEdlc2VuZGV0OiBNaXR0d29jaCwgMjcuIEphbnVhciAyMDIxIDIxOjAzOjE5Cj4g
QmV0cmVmZjogW1BBVENIXSBtdGQ6IHVzZSByZWZjb3VudCB0byBwcmV2ZW50IGNvcnJ1cHRpb24K
Cj4gV2hlbiB1bmRlcmx5aW5nIGRldmljZSBpcyByZW1vdmVkIG10ZCBjb3JlIHdpbGwgY3Jhc2gK
PiBpbiBjYXNlIHVzZXIgc3BhY2UgaXMgc3RpbGwgaG9sZGluZyBhbiBvcGVuIGhhbmRsZSB0byBh
IG10ZCBkZXZpY2Ugbm9kZS4KPiBBIHByb3BlciByZWZjb3VudGluZyBpcyBuZWVkZWQgc28gZGV2
aWNlIGlzIHJlbGVhc2Ugb25seSB3aGVuIGEKPiBwYXJ0aXRpb24gaGFzIG5vIGFjdGl2ZSB1c2Vy
cy4gVGhlIGN1cnJlbnQgc2ltcGxlIGNvdW50ZXIgaXMgbm90Cj4gc3VmZmljaWVudC4KCkNhbiB5
b3UgcGxlYXNlIGV4cGxhaW4gYSBsaXR0bGUgbW9yZSB3aGF0IGRldmljZXMgYXJlIGludm9sdmVk
PwpEb2VzIGl0IGltcGxlbWVudCBfZ2V0X2RldmljZSgpIGFuZCBfcHV0X2RldmljZSgpPwoKVGhh
bmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
