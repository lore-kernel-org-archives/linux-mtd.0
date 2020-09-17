Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2479C43464
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 20:47:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C2D20838
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 20:47:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uU6ogWIV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94C2D20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZNKslGCHgrrjp3lMzvcKhMxhXbQ5NyF7kOxwXc/9Ihw=; b=uU6ogWIVW4ushwAbn5g2sCC8P
	zveZ7mwdTDGabwJRKraPr6X3Uz35PvlnLwSKSORhBpz3SnkugG5K7nw42p5rMi0BSSWsqk1HOgqQH
	Rlk3VU//CaatImiX4OAqLH1O6MO15bR1lZdn4kuSIEovHaWxstQuxoXMbMTq1mimiP90Bv3PoO3yT
	3BdVgktGbKzfUty2quGoejW01dhjLzBoQN/Hdj/sGtaM+Mx8NIA5pWlyz0kaOGlHPsSkS4ZrBFUxn
	1fjbwTg7zqahhzF7atEh2ZX5X6JLjLGHphrA6+lZ7Kb6WGXolFqGFDK/FXIztdgluLnnNpMG/svmn
	qiDivDFxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ0o1-0005dU-TM; Thu, 17 Sep 2020 20:47:01 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ0nx-0005bk-N5; Thu, 17 Sep 2020 20:46:59 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D044C6074023;
 Thu, 17 Sep 2020 22:46:53 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id b95lGeAHKEV9; Thu, 17 Sep 2020 22:46:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 465F4607403B;
 Thu, 17 Sep 2020 22:46:53 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id hHdZoVyeGGFV; Thu, 17 Sep 2020 22:46:53 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 139CF6074023;
 Thu, 17 Sep 2020 22:46:53 +0200 (CEST)
Date: Thu, 17 Sep 2020 22:46:52 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <482280458.101023.1600375612958.JavaMail.zimbra@nod.at>
In-Reply-To: <20200917151050.5363-12-willy@infradead.org>
References: <20200917151050.5363-1-willy@infradead.org>
 <20200917151050.5363-12-willy@infradead.org>
Subject: Re: [PATCH 11/13] ubifs: Tell the VFS that readpage was synchronous
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Tell the VFS that readpage was synchronous
Thread-Index: p/3vZsFlTtSUPnLB3kKvb/O8V+m25A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_164658_201982_33474C36 
X-CRM114-Status: UNSURE (   7.73  )
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
Cc: linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-um <linux-um@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 v9fs-developer@lists.sourceforge.net, ceph-devel <ceph-devel@vger.kernel.org>,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1hdHRoZXcgV2lsY294IiA8
d2lsbHlAaW5mcmFkZWFkLm9yZz4KPiBBbjogImxpbnV4LWZzZGV2ZWwiIDxsaW51eC1mc2RldmVs
QHZnZXIua2VybmVsLm9yZz4KPiBDQzogIk1hdHRoZXcgV2lsY294IiA8d2lsbHlAaW5mcmFkZWFk
Lm9yZz4sICJsaW51eC1tbSIgPGxpbnV4LW1tQGt2YWNrLm9yZz4sIHY5ZnMtZGV2ZWxvcGVyQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldCwKPiAibGludXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZz4sIGxpbnV4LWFmc0BsaXN0cy5pbmZyYWRlYWQub3JnLCAiY2VwaC1kZXZlbCIK
PiA8Y2VwaC1kZXZlbEB2Z2VyLmtlcm5lbC5vcmc+LCBsaW51eC1jaWZzQHZnZXIua2VybmVsLm9y
ZywgZWNyeXB0ZnNAdmdlci5rZXJuZWwub3JnLCAibGludXgtdW0iCj4gPGxpbnV4LXVtQGxpc3Rz
LmluZnJhZGVhZC5vcmc+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5v
cmc+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Pgo+IEdlc2VuZGV0OiBEb25uZXJzdGFnLCAx
Ny4gU2VwdGVtYmVyIDIwMjAgMTc6MTA6NDgKPiBCZXRyZWZmOiBbUEFUQ0ggMTEvMTNdIHViaWZz
OiBUZWxsIHRoZSBWRlMgdGhhdCByZWFkcGFnZSB3YXMgc3luY2hyb25vdXMKCj4gVGhlIHViaWZz
IHJlYWRwYWdlIGltcGxlbWVudGF0aW9uIHdhcyBhbHJlYWR5IHN5bmNocm9ub3VzLCBzbyB1c2UK
PiBBT1BfVVBEQVRFRF9QQUdFIHRvIGF2b2lkIGN5Y2xpbmcgdGhlIHBhZ2UgbG9jay4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSA8d2lsbHlAaW5mcmFkZWFkLm9y
Zz4KPiAtLS0KPiBmcy91Ymlmcy9maWxlLmMgfCAxNiArKysrKysrKysrLS0tLS0tCj4gMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpGb3IgdWJpZnMsIGpm
ZnMyIGFuZCBob3N0ZnM6CgpBY2tlZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5v
ZC5hdD4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
