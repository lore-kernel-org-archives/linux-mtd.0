Return-Path: <SRS0=HmSd=G7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042A8C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 11:23:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BB8864DD9
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 11:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BB8864DD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IquPtCFEpnCUiGkNWB0WsFP9Vg4/YCSG+1AdBMiB74k=; b=p56JSN8yqLTW3NvR+omln406H
	8Ial3dxlqDIjPwj+DmwtjppV2y3XpsIpobNoaayk4FW0avJ2LYsh8ifU2Tln4FmghMm1KalYyHRjg
	AQTvzpzRHpnZvyjDGcDp5RSywWQN+aLqBjnhe0IeNXgqEsXRD7cR0AoRrTJJ2L2QQi2JF7CGEE5+4
	gmgoCVP1ANlzoAoFDF4TNOr2pU8QzK0qMkZKYUXm59w0T07HyJSIT/lVLB+Qt95clbxweQQgmWK2D
	c4wXy1R/y2ppnovklpyP92GIgV8o8kX5BF8DG1v5nXz7O82s43yPmEDbRPdJGLHl2ud3ZPDFKUv4O
	MTzgKONZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l55Nq-0000Hi-JO; Thu, 28 Jan 2021 11:22:42 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l55Nn-0000GW-Qu
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2021 11:22:40 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id EA0A16083244;
 Thu, 28 Jan 2021 12:22:37 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id mkb795HYT3tx; Thu, 28 Jan 2021 12:22:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5A5FE6083270;
 Thu, 28 Jan 2021 12:22:36 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9rn1BgoA46tL; Thu, 28 Jan 2021 12:22:36 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 363536083244;
 Thu, 28 Jan 2021 12:22:36 +0100 (CET)
Date: Thu, 28 Jan 2021 12:22:36 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Message-ID: <95961161.337242.1611832956034.JavaMail.zimbra@nod.at>
In-Reply-To: <b7d9d9db42d639aa143f6e6b98ca7b9f4dcfd46e.camel@infinera.com>
References: <20210128105535.49479-1-yang.yang29@zte.com.cn>
 <b7d9d9db42d639aa143f6e6b98ca7b9f4dcfd46e.camel@infinera.com>
Subject: Re: [PATCH] jffs2: check the validity of dstlen in
 jffs2_zlib_compress()
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: jffs2: check the validity of dstlen in jffs2_zlib_compress()
Thread-Index: AQHW9WSdcQjTUgG4ZEOlNPQW4whXrao844+AZaZjKmc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_062239_990671_F034B45A 
X-CRM114-Status: UNSURE (   8.09  )
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
 stable <stable@vger.kernel.org>, yang yang29 <yang.yang29@zte.com.cn>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 menglong8 dong <menglong8.dong@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkpvYWtpbSBUamVybmx1bmQi
IDxKb2FraW0uVGplcm5sdW5kQGluZmluZXJhLmNvbT4KPiBBbjogIm1lbmdsb25nOCBkb25nIiA8
bWVuZ2xvbmc4LmRvbmdAZ21haWwuY29tPiwgIkRhdmlkIFdvb2Rob3VzZSIgPGR3bXcyQGluZnJh
ZGVhZC5vcmc+Cj4gQ0M6ICJ5YW5nIHlhbmcyOSIgPHlhbmcueWFuZzI5QHp0ZS5jb20uY24+LCAi
c3RhYmxlIiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4sICJsaW51eC1rZXJuZWwiCj4gPGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0PiwgImxp
bnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPgo+IEdlc2VuZGV0OiBEb25u
ZXJzdGFnLCAyOC4gSmFudWFyIDIwMjEgMTI6MTc6MzQKPiBCZXRyZWZmOiBSZTogW1BBVENIXSBq
ZmZzMjogY2hlY2sgdGhlIHZhbGlkaXR5IG9mIGRzdGxlbiBpbiBqZmZzMl96bGliX2NvbXByZXNz
KCkKCj4gT24gVGh1LCAyMDIxLTAxLTI4IGF0IDAyOjU1IC0wODAwLCBtZW5nbG9uZzguZG9uZ0Bn
bWFpbC5jb20gd3JvdGU6Cj4+IEZyb206IFlhbmcgWWFuZyA8eWFuZy55YW5nMjlAenRlLmNvbS5j
bj4KPj4gCj4+IEtBU0FOIHJlcG9ydHMgYSBCVUcgd2hlbiBkb3dubG9hZCBmaWxlIGluIGpmZnMy
IGZpbGVzeXN0ZW0uSXQgaXMKPj4gYmVjYXVzZSB3aGVuIGRzdGxlbiA9PSAxLCBjcGFnZV9vdXQg
d2lsbCB3cml0ZSBhcnJheSBvdXQgb2YgYm91bmRzLgo+PiBBY3R1YWxseSwgZGF0YSB3aWxsIG5v
dCBiZSBjb21wcmVzc2VkIGluIGpmZnMyX3psaWJfY29tcHJlc3MoKSBpZgo+PiBkYXRhJ3MgbGVu
Z3RoIGxlc3MgdGhhbiA0Lgo+IAo+IE91Y2gsIGRhdGEgY29ycnVwdGlvbiB3aWxsIGVuc3VlLiBH
b29kIGZpbmQhCj4gSSB0aGluayB0aGlzIG5lZWRzIHRvIGdvIHRvIHN0YWJsZSBhcyB3ZWxsLgoK
SW5kZWVkISBEbyB5b3Uga25vdyB3aGV0aGVyIHRoaXMgaXMgYSByZWdyZXNzaW9uPwpTZWVtcyB0
byBiZSBsaWtlIHRoYXQgc2luY2UgZXZlci4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
