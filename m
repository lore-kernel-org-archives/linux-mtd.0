Return-Path: <SRS0=rTMm=ZS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF722C432C0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Nov 2019 20:27:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9598920863
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Nov 2019 20:27:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MCYiU9AX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9598920863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GRDIE/+VkjOwQcSTSYLD8mhfHvZhsC1QD9NtsiaHTfE=; b=MCYiU9AXsMHhvH
	Cnl2s3XnCCCj2ZzOXQLqd4kbm415BBpvSayIl/LO2zwuNSW5Mu3fqz3JEdja4JHSHLpuCQIG8TJhj
	Em9dbnHofoTLUT5gE8ogjneHmt3cjDdMot5wI/hQDC1OYY0yKvKdxx3VZdm3Hhgv71eJHnV3Jg9qA
	g5X1XWlWBCHCEIGHUTtP0IrA3w5GW4qUkOb6mr10EqRB2O/YoAIEHYkmQVcaoamIt0XRDQHzAgfdK
	CieSIPNI4WAKooqam0mxnx2Qo6I7P4Zdd9PJwDlPPFb/tQKY/yXkNVZPAqCfTV8dMnrfEiwVuEshy
	cTiXE7xeQ2l09DzN0E3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZhQD-0008Av-Dy; Tue, 26 Nov 2019 20:26:53 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZhQA-0008AP-LR
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2019 20:26:52 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9A997605AD4C;
 Tue, 26 Nov 2019 21:26:48 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 10K2U4YGEVDs; Tue, 26 Nov 2019 21:26:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2AC6760A073C;
 Tue, 26 Nov 2019 21:26:48 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PCpsYETMQX23; Tue, 26 Nov 2019 21:26:48 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0AB6C605AD4C;
 Tue, 26 Nov 2019 21:26:48 +0100 (CET)
Date: Tue, 26 Nov 2019 21:26:47 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Otto Blom <oblom586@gmail.com>
Message-ID: <698719689.98401.1574800007975.JavaMail.zimbra@nod.at>
In-Reply-To: <CAOfSrV2QTRbg+pD2TfRbCFfjcjR3UT6BGVSV_Nkg4YxJL6r2RA@mail.gmail.com>
References: <CAOfSrV1CNn6EpPkAkP8F2VQUrit_B-t89sSxW=08zyKVOdt9AA@mail.gmail.com>
 <CAFLxGvziLKNA0gcPo+EGwfpuv6Fe6=sNOfhEa1DR7sN0oOxzMg@mail.gmail.com>
 <CAOfSrV0ZuG5qz0aW1bU30iZ2RX2vi4Y5aYF128XjkRUd1h+EhA@mail.gmail.com>
 <1237458020.97684.1574720847193.JavaMail.zimbra@nod.at>
 <CAOfSrV2QTRbg+pD2TfRbCFfjcjR3UT6BGVSV_Nkg4YxJL6r2RA@mail.gmail.com>
Subject: Re: mtd-utils io_paral test fails on NAND
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtd-utils io_paral test fails on NAND
Thread-Index: 1xgNWXFE1xpFKVCuGJJEIRxPyMxlsA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_122650_847675_703D2313 
X-CRM114-Status: UNSURE (   9.76  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T3R0bywKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJPdHRvIEJsb20i
IDxvYmxvbTU4NkBnbWFpbC5jb20+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4g
Q0M6ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPiBHZXNlbmRl
dDogRGllbnN0YWcsIDI2LiBOb3ZlbWJlciAyMDE5IDE4OjExOjA5Cj4gQmV0cmVmZjogUmU6IG10
ZC11dGlscyBpb19wYXJhbCB0ZXN0IGZhaWxzIG9uIE5BTkQKCj4gSGkgUmljaGFyZCAhCj4gCj4g
bmFuZHBhZ2V0ZXN0IHJhbiBmb3IgMTJoKyB3L28gZmFpbGluZywgc28gaXQgbG9va3MgbGlrZSBh
IGRyaXZlcgo+IHByb2JsZW0gbGlrZSB5b3Ugc3VnZ2VzdGVkLgo+IAo+IEFsbCB0aGUgdGltZXMg
SSd2ZSBzZWVuIGlmIGZhaWwgKGFyb3VuZCAxMCkgdGhlIGZhaWxlZCBwYWdlIGNhbWUgYmFjawo+
IHdpdGggYWxsIHplcm9zLi4gV2hpY2ggaXMgYSBiaXQgc3RyYW5nZSBhcyBJIHdvdWxkIHRoaW5r
ICJyYW5kb20iIC8KPiBkdXBsaWNhdGVkIHBhZ2Ugd291bGQgYmUgbW9yZSBsaWtlbHkuIE1heWJl
IHRoZSBwYWdlIHJlYWQgZmFpbHMKPiBzaWxlbnRseSBhbmQgdGhlIGNvbnRyb2xsZXIgcmV0dXJu
cyBhbGwgemVyb3MKCklmIEkgd2FzIGluIHlvdXIgc2l0dWF0aW9uIEknZCB0cnkgdG8gZmlndXJl
IHdoZXJlIHRoZSAweDAwIGJ5dGVzIGNvbWUgZnJvbS4KRG9lcyB0aGUgZHJpdmVyIHdyaXRlIHpl
cm9zPyBNYXliZSB0aGUgcGFnZSBpcyB6ZXJvIGluaXRpYWxpemVkIGFuZCB0aGUgY29udHJvbGxl
cgpjb21wbGV0ZWx5IGZhaWxzIHRvIHRyYW5zZmVyIGRhdGEgYW5kIGRvZXMgbm90IHNpZ25hbCBp
dD8KClNpbmNlIG5hbmRwYWdldGVzdCB3b3JrcywgYnV0IFVCSSBub3QgaXQgcG9pbnRzIGludG8g
dGhlIGRpcmVjdGlvbiBvZiBETUEuCk9uIHRoZSBvdGhlciBoYW5kLCBVQkkgdXNlcyBvZmZzZXRz
LiBNYXliZSB0aGlzIGlzIGJyb2tlbiBpbiB0aGUgZHJpdmVyLi4uCgpJIGhhZCBtb3JlIHRoYW4g
b25jZSB0aGUgY2FzZSB3aGVyZSBhIGRyaXZlciB3b3JrZWQgbGlrZSBjaGFybSBpZiB5b3UgYXNr
ZWQKaXQgZm9yIGEgc2luZ2xlIHBhZ2Ugb3IgYSB3aG9sZSBibG9jayBidXQgZmFpbGVkIGlmIHlv
dSBhc2tlZCBmb3IgTiBwYWdlcwphdCBhIGdpdmVuIG9mZnNldC4KClRoYW5rcywKLy9yaWNoYXJk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
