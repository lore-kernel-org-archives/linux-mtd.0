Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C6DC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 10:25:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDC3D2070A
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 10:25:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="geeL33eX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JhiTb5TR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDC3D2070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lxlZdUNP6OAFIejCjcwkY+ZTk3LjuPnS7/1DPYOpvO0=; b=geeL33eXawgqTvV/oN3fUUYvt
	r8YyVVP87Qm/mtBSNJfnR6XLrR2lIxwSilGhTsz9AutQaNyJrQxTWtI3zEwzuCRrOcy0fY+okqWy8
	EVAc99MO8uqUHycKj8gxn63b9gwLy+5F4KPc59WYmf9iXBlzy9FrsA7EWALrDvfF0dVT2Wfrv0NRl
	i5VnRH/sB6dAUWlTrNYP2wJl9YAK0cocXAvmV0glh0eT7Yvyx3MKUNjgN6TplKiICDs9/FcXaJfdU
	SP19pZhXSBY3DHxfy0uz/qbfgeQobnNZvun+skLedS8kELusJNjAOgu2TvaXa3QA0kXhmpfq/qw1Q
	EulQwZRAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jolWp-0001vf-8y; Fri, 26 Jun 2020 10:24:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolQm-0004OP-7v
 for linux-mtd@merlin.infradead.org; Fri, 26 Jun 2020 10:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=IZaeyS9CJNNYkGhfS0NnmXdMfe2Rh5dxc1Dx8Mz/tmw=; b=JhiTb5TRXK+a4PT2137YoQDxXd
 qBo6WMTFVL3aCjuuYZZ8hj4iPcxy4CgmLRTTIlNumpy129LOinxuRam+MKYt6mTIwE/pr1bqjttcQ
 oM33y2jQ2mBO5mxo2BtbRKPQ+t7n0tZMpS9uV052bj40iOJihV0FURet0Es7hkTSQee5Mffk/qrTu
 8xikxeZjoKdN6nZFEuCToymEl5tVkbsOKREJWDmXfFq1p5Tb8Kxq35ix7M1QZoRoOXJ6AbterfiLR
 BrjiHZfneWPFm0+9/iUNqhHh993x+9v9OeFVXswuZJxKB62Jywil19oEgQEhuaP9yd1W/d0ja2LSr
 wmR2kLkQ==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jojQC-00085N-W4
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 08:09:19 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 594D4626F1D1;
 Fri, 26 Jun 2020 10:09:15 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id YM6rJfac_B3s; Fri, 26 Jun 2020 10:09:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E165C626F1B6;
 Fri, 26 Jun 2020 10:09:14 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id GPMqiObfxCZO; Fri, 26 Jun 2020 10:09:14 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id B8171626F1B4;
 Fri, 26 Jun 2020 10:09:14 +0200 (CEST)
Date: Fri, 26 Jun 2020 10:09:14 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Torben Hohn <torben.hohn@linutronix.de>
Message-ID: <1764637498.61502.1593158954662.JavaMail.zimbra@nod.at>
In-Reply-To: <20200625155927.28430-1-torben.hohn@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
Subject: Re: [PATCH 0/1] ubifs: support authentication without hmac
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: support authentication without hmac
Thread-Index: G3ZYEuhBQPyKvaBqFN5flfnl/qtd9Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_090917_261864_17D4EBC0 
X-CRM114-Status: GOOD (  16.45  )
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
Cc: bigeasy <bigeasy@linutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 tglx <tglx@linutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VG9yYmVuLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlRvcmJlbiBI
b2huIiA8dG9yYmVuLmhvaG5AbGludXRyb25peC5kZT4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJk
QG5vZC5hdD4KPiBDQzogImJpZ2Vhc3kiIDxiaWdlYXN5QGxpbnV0cm9uaXguZGU+LCAidGdseCIg
PHRnbHhAbGludXRyb25peC5kZT4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFk
ZWFkLm9yZz4sICJTYXNjaGEKPiBIYXVlciIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gR2Vz
ZW5kZXQ6IERvbm5lcnN0YWcsIDI1LiBKdW5pIDIwMjAgMTc6NTk6MjYKPiBCZXRyZWZmOiBbUEFU
Q0ggMC8xXSB1Ymlmczogc3VwcG9ydCBhdXRoZW50aWNhdGlvbiB3aXRob3V0IGhtYWMKCj4gVGhp
cyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHViaWZzIGF1dGhlbnRpY2F0aW9uIHdpdGhvdXQgSE1B
QywKPiB3aGljaCBvYnZpb3VzbHkgb25seSB3b3JrcyBmb3IgYSByZWFkLW9ubHkgbW91bnQuCj4g
Cj4gdWJpYmxvY2sgYW5kIGRtLXZlcml0eSBhcmUgbm90IHN1cHBvcnRlZCBieSB1LWJvb3QsIGFu
ZAo+IHRoZSBrZXJuZWwgb24gdGhlIHRhcmdldCBpcyBsb2FkZWQgYnkgdS1ib290IG91dCBvZiB0
aGUgUkZTLgoKQXMgSSBzYWlkIG9uIElSQyB5ZXN0ZXJkYXkuIFRoZXJlIGlzIGEgYnVnIHdpdGgg
VUJJRlMgdmVyc2lvbmluZy4KdS1ib290IGlzIG5vdCBzdXBwb3NlZCB0byByZWFkIGZyb20gYXV0
aGVudGljYXRlZCBVQklGUyBzaW5jZSBpdCBoYXMKbm8gYXV0aGVudGljYXRpb24gc3VwcG9ydCBh
dCBhbGwgYW4gbWlnaHQgdHJpcCBvdmVyIGNoYW5nZWQgZGF0YSBzdHJ1Y3R1cmVzLgoKV2UgZm9y
Z290IHRvIHJhaXNlIHRoZSBVQklGUyB2ZXJzaW9uIHRvIHc1cjEgZm9yIGF1dGhlbnRpY2F0ZWQg
aW1hZ2VzCmFuZCBvbmx5IGludHJvZHVjZWQgYSBuZXcgZmVhdHVyZSBmbGFnLgpUaGlzIGNhdXNl
cyBvbGQgVUJJRlMgaW1wbGVtZW50YXRpb25zIGxpa2UgdS1ib290J3MgdG8gbm90IGVuZm9yY2Ug
dGhlCnN1cGVyIGJsb2NrIGZlYXR1cmUgZmxhZyBmaWVsZC4gCkJlZm9yZSB3NCBmZWF0dXJlIGZs
YWdzIGRpZG4ndCBnZXQgZW5mb2NyZWQuIDotKAoKUGF0Y2hlcyBmb3IgbWtmcy51YmlmcyBhbmQg
a2VybmVsIGFyZSBvbiB0aGVpciB3YXksIEkganVzdCBuZWVkIHRvIGNhcmVmdWxseQp0ZXN0IHRo
ZW0gd2l0aCBtYW55IGRpZmZlcmVudCBvbGQgaW1hZ2VzLCB1LWJvb3QgYW5kIGtlcm5lbCBjb21i
aW5hdGlvbnMuCgpJIHRoaW5rIGl0IGlzIGhpZ2ggbm9vbiB0aGF0IHUtYm9vdCB1cGRhdGVzIHRo
ZWlyIFVCSUZTLCB0aGVuIGEKbm9uLWF1dGhlbnRpY2F0ZWQgc2hvdWxkIGJlIHRyaXZpYWwuCk9m
IGNvdXJzZSB5b3UgbmVlZCB0byB2ZXJpZnkgYWxsIGZpbGVzIHlvdSByZWFkIGZyb20gaXQgbWFu
dWFsbHkgdGhlbi4KCj4gVGhpcyBpcyBhIGZpcnN0IHRyeSB0byBpbXBsZW1lbnQgdGhpcy4KPiBJ
dCBib290cyBmaW5lLCBhbmQgdGhlIFdBUk5fT04gaXMgbm90IHRyaWdnZXJlZC4KPiAKPiBJIHBs
YW4gdG8gdXBkYXRlIHRoZSBkb2NzIGFsc28sIGJ1dCBpIHdvdWxkIGxpa2UgdG8gaGF2ZQo+IHNv
bWUgcG9zaXRpdmUgY29tbWVudHMgb24gdGhpcyBiZWZvcmUuCgpJIHRoaW5rIHRoaXMgaXMgYSB1
c2VmdWwgZmVhdHVyZSwgcGxlYXNlIGdpdmUgbWUgYSBmZXcgZGF5IHRvIHRoaW5rIGFib3V0CmFs
bCBpbXBsaWNhdGlvbnMuCgpUaGF0IHNhaWQsIEknbSBub3QgcmVhbGx5IGEgZmFuIG9mIHJlYWRp
bmcgZmlsZXMgZnJvbSBVQklGUyBpbiB1LWJvb3QuCldlIGhhdmUgVUJJIHN0YXRpYyB2b2x1bWVz
IGZvciB0aGF0Li4uCk1heWJlIHlvdSBjYW4gZ2l2ZSB0aGlzIGEgdHJ5IGFuZCB2b2lkIHNvbWUg
Y29tcGxleGl0eSBpbiB0aGUgYm9vdGxvYWRlci4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
