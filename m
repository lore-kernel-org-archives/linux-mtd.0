Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E2FC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 15:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7gThQi08ftXS4uhy/Izb15Wp7NhBxFw5skZSAncRjUU=; b=yajIt6ah5tyse3
	hgLSgmm22XFC20btsCISg/UYEOtuz5rgBe4Y9YNGpw1nYcc9yXsMZPLLg03YoP5xdCJqUOOx8hmqD
	XT+amKVaiyRAfQ27VanC7kGBEYUDopEnIX3JGRpcIUG2YB2LSbEylbu8FQavJ+3JqDPtlFlzPpHX8
	MSKR1P0I4Fmju5oeqMMES99oRKt6pHOfiVnKT8ojO6si1r2T/HrjyGit0d/nd9Gryr6ePavM+hhpt
	DcPJ1Wqj+jTJFMMV9QiO4/2ALWvnG+VmuEgGVc+73dcko4msKHJpbEWM3Eogc0KltN+G0TNH8k2DB
	ePMmLMMr2p+i3h4r4gaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf1Wg-006Gx7-1t; Thu, 14 Apr 2022 15:36:54 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf1Wc-006Gw3-Nz
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 15:36:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B491B100007;
 Thu, 14 Apr 2022 15:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649950605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ztYFw9ifTWPMIRCBm5gIwDz/r3tBF1L5vZf09P1ty6Q=;
 b=VvfTg0F10Po1ICzpPdgQ9YX+cnSUYpJPHhT/B+HZaTBwxxsi3I6IFKpFcS4le9E89U5yX0
 tsMscD7QVYOmzkaFotYiRsif6VYzKOhYDgLncGfuKfFBm6gdiFnUh1bBD1Uw0AEEeCqKJs
 MkC5WOOnEuZ9nN7UjI6IzyGODB5ZeLZxe187YWw77PtPiCAZBuXSpckhiJ8rQwTK/TO3uP
 +ERWZQvWY2HWV2t3naLWP2+1lcqBrqJUwH7rjTNqXeNsZjjmWhGCFC7IkZLF6zrQOeoqjd
 rZk07PHs5846fc4m3OM9uFsFZt/AZa7HvjUPQngEaWgTrbXB8GaX0pr/1E1noQ==
Date: Thu, 14 Apr 2022 17:36:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: mani@kernel.org, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
 quic_srichara@quicinc.com
Subject: Re: [PATCH V2] mtd: rawnand: qcom: fix memory corruption that
 causes panic
Message-ID: <20220414173642.56baedf5@xps13>
In-Reply-To: <1649950217-32272-1-git-send-email-quic_mdalam@quicinc.com>
References: <1649950217-32272-1-git-send-email-quic_mdalam@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_083651_102588_65823163 
X-CRM114-Status: GOOD (  14.45  )
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

SGkgTWQsCgpxdWljX21kYWxhbUBxdWljaW5jLmNvbSB3cm90ZSBvbiBUaHUsIDE0IEFwciAyMDIy
IDIxOjAwOjE3ICswNTMwOgoKPiBUaGlzIHBhdGNoIGZpeGVzIGEgbWVtb3J5IGNvcnJ1cHRpb24g
dGhhdCBvY2N1cnJlZCBpbiB0aGUKPiBuYW5kX3NjYW4oKSBwYXRoIGZvciBIeW5peCBuYW5kIGRl
dmljZS4KPiAKPiBPbiBib290LCBmb3IgSHluaXggbmFuZCBkZXZpY2Ugd2lsbCBwYW5pYyBhdCBh
IHdlaXJkIHBsYWNlOgo+IHwgVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRl
cmVmZXJlbmNlIGF0IHZpcnR1YWwKPiAgIGFkZHJlc3MgMDAwMDAwNzAKPiB8IFswMDAwMDA3MF0g
KnBnZD0wMDAwMDAwMAo+IHwgSW50ZXJuYWwgZXJyb3I6IE9vcHM6IDUgWyMxXSBQUkVFTVBUIFNN
UCBBUk0KPiB8IE1vZHVsZXMgbGlua2VkIGluOgo+IHwgQ1BVOiAwIFBJRDogMSBDb21tOiBzd2Fw
cGVyLzAgTm90IHRhaW50ZWQgNS4xNy4wLTAxNDczLWcxM2FlMTc2OWNmYjAKPiAgICMzOAo+IHwg
SGFyZHdhcmUgbmFtZTogR2VuZXJpYyBEVCBiYXNlZCBzeXN0ZW0KPiB8IFBDIGlzIGF0IG5hbmRj
X3NldF9yZWcrMHg4LzB4MWMKPiB8IExSIGlzIGF0IHFjb21fbmFuZGNfY29tbWFuZCsweDIwYy8w
eDVkMAo+IHwgcGMgOiBbPGMwODhiNzRjPl0gICAgbHIgOiBbPGMwODhkOWM4Pl0gICAgcHNyOiAw
MDAwMDExMwo+IHwgc3AgOiBjMTRhZGM1MCAgaXAgOiBjMTRlZTIwOCAgZnAgOiBjMGNjOTcwYwo+
IHwgcjEwOiAwMDAwMDBhMyAgcjkgOiAwMDAwMDAwMCAgcjggOiAwMDAwMDA0MAo+IHwgcjcgOiBj
MTZmNmEwMCAgcjYgOiAwMDAwMDA5MCAgcjUgOiAwMDAwMDAwNCAgcjQgOmMxNGVlMDQwCj4gfCBy
MyA6IDAwMDAwMDAwICByMiA6IDAwMDAwMDBiICByMSA6IDAwMDAwMDAwICByMCA6YzE0ZWUwNDAK
PiB8IEZsYWdzOiBuemN2ICBJUlFzIG9uICBGSVFzIG9uICBNb2RlIFNWQ18zMiAgSVNBIEFSTSBT
ZWdtZW50IG5vbmUKPiB8IENvbnRyb2w6IDEwYzUzODdkICBUYWJsZTogODAyMDQwNmEgIERBQzog
MDAwMDAwNTEKPiB8IFJlZ2lzdGVyIHIwIGluZm9ybWF0aW9uOiBzbGFiIGttYWxsb2MtMmsgc3Rh
cnQgYzE0ZWUwMDAgcG9pbnRlciBvZmZzZXQKPiAgIDY0IHNpemUgMjA0OAo+IHwgUHJvY2VzcyBz
d2FwcGVyLzAgKHBpZDogMSwgc3RhY2sgbGltaXQgPSAweChwdHJ2YWwpKQo+IHwgbmFuZGNfc2V0
X3JlZyBmcm9tIHFjb21fbmFuZGNfY29tbWFuZCsweDIwYy8weDVkMAo+IHwgcWNvbV9uYW5kY19j
b21tYW5kIGZyb20gbmFuZF9yZWFkaWRfb3ArMHgxOTgvMHgxZTgKPiB8IG5hbmRfcmVhZGlkX29w
IGZyb20gaHluaXhfbmFuZF9oYXNfdmFsaWRfamVkZWNpZCsweDMwLzB4NzgKPiB8IGh5bml4X25h
bmRfaGFzX3ZhbGlkX2plZGVjaWQgZnJvbSBoeW5peF9uYW5kX2luaXQrMHhiOC8weDQ1NAo+IHwg
aHluaXhfbmFuZF9pbml0IGZyb20gbmFuZF9zY2FuX3dpdGhfaWRzKzB4YTMwLzB4MTRhOAo+IHwg
bmFuZF9zY2FuX3dpdGhfaWRzIGZyb20gcWNvbV9uYW5kY19wcm9iZSsweDY0OC8weDdiMAo+IHwg
cWNvbV9uYW5kY19wcm9iZSBmcm9tIHBsYXRmb3JtX3Byb2JlKzB4NTgvMHhhYwo+IAo+IFRoZSBw
cm9ibGVtIGlzIHRoYXQgdGhlIG5hbmRfc2NhbigpJ3MgcWNvbV9uYW5kX2F0dGFjaF9jaGlwIGNh
bGxiYWNrCj4gaXMgdXBkYXRpbmcgdGhlIG5hbmRjLT5tYXhfY3dwZXJwYWdlIGZyb20gMSB0byA0
LlRoaXMgY2F1c2VzIHRoZQo+IHNnX2luaXRfdGFibGUgb2YgY2xlYXJfYmFtX3RyYW5zYWN0aW9u
KCkgaW4gdGhlIGRyaXZlcidzCj4gcWNvbV9uYW5kY19jb21tYW5kKCkgdG8gbWVtc2V0IG11Y2gg
bW9yZSB0aGFuIHdoYXQgd2FzIGluaXRpYWxseQo+IGFsbG9jYXRlZCBieSBhbGxvY19iYW1fdHJh
bnNhY3Rpb24oKS4KPiAKPiBUaGlzIHBhdGNoIHdpbGwgdXBkYXRlIG5hbmRjLT5tYXhfY3dwZXJw
YWdlIDEgdG8gNCBhZnRlciBuYW5kX3NjYW4oKQo+IHJldHVybnMsIGFuZCByZW1vdmUgdXBkYXRp
bmcgbmFuZGMtPm1heF9jd3BlcnBhZ2UgZnJvbQo+IHFjb21fbmFuZF9hdHRhY2hfY2hpcCBjYWxs
IGJhY2suCgpQbGVhc2UgdXBkYXRlIGFsc28gdGhlIGNvbW1pdCBsb2cuCgpGaXhlczogPwpDYzog
c3RhYmxlID8KCj4gU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8cXVpY19tZGFsYW1AcXVp
Y2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU3JpY2hhcmFuIFIgPHF1aWNfc3JpY2hhcmFAcXVp
Y2luYy5jb20+Cj4gLS0tCj4gW1YyXQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
