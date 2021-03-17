Return-Path: <SRS0=VKOh=IP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1996C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 14:52:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2277664F3E
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 14:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2277664F3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CSRJgKJJAakatWteT8z6LPUD1on83gN/zAfsIa0tFro=; b=o3S68qZQGKYP8fztW70bCJd8F
	YIrMQWjY5j5g4808oYN9dk0T1nlOkpNzZiScwCoB+DFKmsRf4xy2nrS/+WWIfXD92Nqx17FDzZ0LN
	SjnKk0Ucn2cz0ZyHVXxJtSx/GJuVQoCFQfu3BRuKyBRmj9eKy4tOglEg/rDYOgG0StcYIciF8Fw8r
	yYi0a6GtyTlu5aI745Y7k7aItASIsrOpvZGhs5OXEQS7wSIR/wGJPUkqShgW3taRw0KTSP0wGMEWd
	f9XYETuvyqXtFUHYwlsE//51qmGKTPK1LOivlCVTv+BAMBUVukZyJeJnQTv8P9A4rl3qN5bd86kir
	xeOLURtXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMXWG-003MrY-KJ; Wed, 17 Mar 2021 14:51:33 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMXW9-003MpE-4d
 for linux-mtd@lists.infradead.org; Wed, 17 Mar 2021 14:51:28 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C6743E0007;
 Wed, 17 Mar 2021 14:51:22 +0000 (UTC)
Date: Wed, 17 Mar 2021 15:51:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org
Subject: Re: [PATCH v5 0/3] Add support for secure regions in NAND
Message-ID: <20210317155121.19cbb50c@xps13>
In-Reply-To: <20210317122513.42369-1-manivannan.sadhasivam@linaro.org>
References: <20210317122513.42369-1-manivannan.sadhasivam@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_145125_513941_42CEFBB2 
X-CRM114-Status: GOOD (  14.19  )
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

SGkgTWFuaXZhbm5hbiwKCk1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNp
dmFtQGxpbmFyby5vcmc+IHdyb3RlIG9uIFdlZCwKMTcgTWFyIDIwMjEgMTc6NTU6MTAgKzA1MzA6
Cgo+IE9uIGEgdHlwaWNhbCBlbmQgcHJvZHVjdCwgYSB2ZW5kb3IgbWF5IGNob29zZSB0byBzZWN1
cmUgc29tZSByZWdpb25zIGluCj4gdGhlIE5BTkQgbWVtb3J5IHdoaWNoIGFyZSBzdXBwb3NlZCB0
byBzdGF5IGludGFjdCBiZXR3ZWVuIEZXIHVwZ3JhZGVzLgo+IFRoZSBhY2Nlc3MgdG8gdGhvc2Ug
cmVnaW9ucyB3aWxsIGJlIGJsb2NrZWQgYnkgYSBzZWN1cmUgZWxlbWVudCBsaWtlCj4gVHJ1c3R6
b25lLiBTbyB0aGUgbm9ybWFsIHdvcmxkIHNvZnR3YXJlIGxpa2UgTGludXgga2VybmVsIHNob3Vs
ZCBub3QKPiB0b3VjaCB0aGVzZSByZWdpb25zIChpbmNsdWRpbmcgcmVhZGluZykuCj4gCj4gU28g
dGhpcyBzZXJpZXMgYWRkcyBhIHByb3BlcnR5IGZvciBkZWNsYXJpbmcgc3VjaCBzZWN1cmUgcmVn
aW9ucyBpbiBEVAo+IHNvIHRoYXQgdGhlIGRyaXZlciBjYW4gc2tpcCB0b3VjaGluZyB0aGVtLiBX
aGlsZSBhdCBpdCwgdGhlIFFjb20gTkFORGMKPiBEVCBiaW5kaW5nIGlzIGFsc28gY29udmVydGVk
IHRvIFlBTUwgZm9ybWF0Lgo+IAo+IFRoYW5rcywKPiBNYW5pCj4gCj4gQ2hhbmdlcyBpbiB2NToK
PiAKPiAqIFN3aXRjaGVkIHRvICJ1aW50NjQtbWF0cml4IiBhcyBzdWdnZXN0ZWQgYnkgUm9iCj4g
KiBNb3ZlZCB0aGUgd2hvbGUgbG9naWMgZnJvbSBxY29tIGRyaXZlciB0byBuYW5kIGNvcmUgYXMg
c3VnZ2VzdGVkIGJ5IEJvcmlzCgpJJ20gcmVhbGx5IHRoaW5raW5nIGFib3V0IGEgbmFuZC13aWRl
IHByb3BlcnR5IG5vdy4gRG8geW91IHRoaW5rIGl0Cm1ha2VzIHNlbnNlIHRvIG1vdmUgdGhlIGhl
bHBlciB0byB0aGUgTkFORCBjb3JlIChpbnN0ZWFkIG9mIHRoZSByYXcKTkFORCBjb3JlKT8gSSdt
IGZpbmUgb25seSB1c2luZyBpdCBpbiB0aGUgcmF3IE5BTkQgY29yZSB0aG91Z2guCgpBbHNvLCBj
YW4gSSByZXF1ZXN0IGEgZ2xvYmFsIHMvc2VjL3NlY3VyZS8gdXBkYXRlPyBJIGZpbmQgdGhlICJz
ZWMiCmFiYnJldmlhdGlvbiB1bmNsZWFyIGFuZCBJIHRoaW5rIHdlIGhhdmUgbW9yZSB0aGFuIGVu
b3VnaCBjcnlwdGljCm5hbWVzIDotKQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
