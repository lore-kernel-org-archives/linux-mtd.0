Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2F4CD3442
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2026 07:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0x8D1tleYbxZM/kPkpVV0Tlt6J3w/J459yQ6lA/EQy4=; b=2KsrKNYIjKk2nwlm11pnfxdDAi
	GS5PcXQzjXyOjU3odWo1Y0gl+t3DR6VHmMh38Cxx+vsXx6Lwag+vmGICbZA2318Q2e2Yi3Ut5K7LO
	vJX4fsN5FsXSjuWH9e/PBhO9osrkzTtmzQa4ERG9NtvZ/z8xBZWcr2BCmzcgefaSXgae+adwkUUPR
	Yf/mIqDwVL3jCN8SrsrrI2QpsADDeI2WtTqloYtBb6zLTSoRRtpaMhjtKPF+TDnnm1QBzFg87NlD8
	1oh2dsjFbbvgjhTU9hmuV6FNwwx2h3YC3CDNoACVCfmRIjts1V75x/Oz3Uu6VxuyZtrI6qeAB5DIx
	Wqe0cLUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtCJ-000000031v0-0rmZ;
	Thu, 07 May 2026 07:31:03 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtCI-000000031uS-0cTp
	for linux-mtd@lists.infradead.org;
	Thu, 07 May 2026 07:31:02 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6364E298580;
	Thu,  7 May 2026 09:30:57 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id mcrtXndMeWBY; Thu,  7 May 2026 09:30:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id AF7F6298599;
	Thu,  7 May 2026 09:30:56 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Bom9-ahJ6Ly9; Thu,  7 May 2026 09:30:56 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 90161298580;
	Thu,  7 May 2026 09:30:56 +0200 (CEST)
Date: Thu, 7 May 2026 09:30:56 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: "haoyu.lu" <hechushiguitu666@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <713519488.1541.1778139056408.JavaMail.zimbra@nod.at>
In-Reply-To: <20260507032308.16485-2-hechushiguitu666@gmail.com>
References: <20260507032308.16485-1-hechushiguitu666@gmail.com> <20260507032308.16485-2-hechushiguitu666@gmail.com>
Subject: Re: [PATCH 2/2] ubi: build: replace simple_strtoul with kstrtoul in
 bytes_str_to_int()
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF150 (Linux)/8.8.12_GA_3809)
Thread-Topic: build: replace simple_strtoul with kstrtoul in bytes_str_to_int()
Thread-Index: 0h1MJWAhwFwxoJ+/pjp6Sz58YMiUxg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_003102_331594_04A3A48F 
X-CRM114-Status: UNSURE (   9.67  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImhhb3l1Lmx1IiA8aGVjaHVz
aGlndWl0dTY2NkBnbWFpbC5jb20+Cj4gQW46ICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiVmlnbmVzaCBSYWdo
YXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4KPiBDQzogImNoZW5nemhpaGFvMSIgPGNoZW5nemhp
aGFvMUBodWF3ZWkuY29tPiwgImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQu
b3JnPiwgImxpbnV4LWtlcm5lbCIKPiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sICJI
YW95dSBMdSIgPGhlY2h1c2hpZ3VpdHU2NjZAZ21haWwuY29tPgo+IEdlc2VuZGV0OiBEb25uZXJz
dGFnLCA3LiBNYWkgMjAyNiAwNToyMzowOAo+IEJldHJlZmY6IFtQQVRDSCAyLzJdIHViaTogYnVp
bGQ6IHJlcGxhY2Ugc2ltcGxlX3N0cnRvdWwgd2l0aCBrc3RydG91bCBpbiBieXRlc19zdHJfdG9f
aW50KCkKCj4gRnJvbTogSGFveXUgTHUgPGhlY2h1c2hpZ3VpdHU2NjZAZ21haWwuY29tPgo+IAo+
IFJlcGxhY2UgdGhlIGRlcHJlY2F0ZWQgc2ltcGxlX3N0cnRvdWwoKSB3aXRoIGtzdHJ0b3VsKCkg
aW4gdGhlCj4KPiBieXRlc19zdHJfdG9faW50KCkgaGVscGVyIGZ1bmN0aW9uLiBTaW5jZSBrc3Ry
dG91bCgpIHJlamVjdHMgdHJhaWxpbmcKPiBub24tbnVtZXJpYyBjaGFyYWN0ZXJzIChzdWNoIGFz
IHRoZSBHL00vSyBzdWZmaXhlcyksIHRoZSBudW1lcmljIHByZWZpeAo+IGlzIGZpcnN0IGV4dHJh
Y3RlZCB3aXRoIHN0cnNwbigpIGFuZCB0aGVuIHBhcnNlZCBzZXBhcmF0ZWx5IGJlZm9yZQo+IGhh
bmRsaW5nIHRoZSBzdWZmaXguCj4gCj4gVGhpcyBwcm92aWRlcyBwcm9wZXIgZXJyb3IgaGFuZGxp
bmcgdGhyb3VnaCB0aGUga3N0cnRvKiBmYW1pbHkgd2hpbGUKPiBwcmVzZXJ2aW5nIHRoZSBleGlz
dGluZyBzdWZmaXggc2VtYW50aWNzIGZvciBieXRlIGNvdW50IHBhcmFtZXRlcnMuCj4gCj4gTm90
ZTogdGhlIG9yaWdpbmFsIHNpbXBsZV9zdHJ0b3VsKCkgd2l0aCBiYXNlPTAgYWNjZXB0ZWQgaGV4
YWRlY2ltYWwKPiAoMHggcHJlZml4KSBhbmQgb2N0YWwgKDAgcHJlZml4KSBmb3JtYXRzLCB3aGls
ZSBrc3RydG91bCgpIHdpdGggYmFzZT0xMAo+IG9ubHkgc3VwcG9ydHMgZGVjaW1hbC4gVGhpcyBp
cyBub3QgYSBwcmFjdGljYWwgY29uY2VybiBzaW5jZSBNVEQgYnl0ZQo+IGNvdW50IHBhcmFtZXRl
cnMgYXJlIGFsd2F5cyBzcGVjaWZpZWQgYXMgZGVjaW1hbCB2YWx1ZXMgaW4gYm9vdAo+IHBhcmFt
ZXRlcnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSGFveXUgTHUgPGhlY2h1c2hpZ3VpdHU2NjZAZ21h
aWwuY29tPgo+IC0tLQo+IGRyaXZlcnMvbXRkL3ViaS9idWlsZC5jIHwgMTkgKysrKysrKysrKysr
KysrLS0tLQo+IDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKCllvdXIgcGF0Y2ggZG9lcyBub3QgZXhwbGFpbiB3aHkgdGhpcyBjaGFuZ2UgaXMgbmVlZGVk
LgpGcm9tIHdoYXQgSSBjYW4gdGVsbCwgaXQganVzdCBtYWtlcyB0aGUgZXhpc3RpbmcgY29kZSBt
b3JlIGNvbXBsZXggYW5kCmZpeGVzIG5vIHJlYWwgaXNzdWVzLgoKSXMgc2ltcGxlX3N0cnRvdWwo
KSByZWFsbHkgZGVwcmVjYXRlZD8gSWYgc28sIHdoZXJlPwpBRkFJQ1QsIHRoZSBkb2N1bWVudGF0
aW9uIGp1c3QgbWVudGlvbnM6CiJUaGlzIGZ1bmN0aW9uIGhhcyBjYXZlYXRzLiBQbGVhc2UgdXNl
IGtzdHJ0b2wgaW5zdGVhZC4iCgpEbyB0aGVzZSB0aGVzZSBjYXZlYXRzIGh1cnQgdGhlIGN1cnJl
bnQgY29kZT8KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
