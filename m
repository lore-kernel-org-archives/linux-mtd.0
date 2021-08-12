Return-Path: <SRS0=P+6h=ND=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04433C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 12:02:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CA8560F91
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 12:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CA8560F91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=er2hrqab6KMDg68a/I2aQbx+PsVvZRAec4OI4QnAfqI=; b=wm8Aeztb6fY67p8q4p7qM/BZiA
	65GQBOeXdkVAUfAp9tTfUUSQxM7B74wj+KbD8aDlRwSoYUppiHQ0tY9guqw3j7qNWroymWcToe4ED
	KdkeR/Un2Z4X7XbPzW7YIQXjV8qX8ImNZVd+gkiIZT1iGQbagQdyMJPI/QnyiHHfAA8GgvmGMstju
	eoCZ0sg7IGI1vUDZIyCNrDXLQbJ3Fz3udiNoabonRpYewO6hJSeklDiIZdTWsHx5GVMVBX0S2jew9
	mWOsXUOHCHu/p5FEiaRJJoZ4uMRVpEvbqOPryXQ9vpMWdDFifWtQ+ZghP9zb9nZoy6EpVqxeMLK56
	qFd5NWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE9PD-009vm7-1p; Thu, 12 Aug 2021 12:01:51 +0000
Received: from mx1.emlix.com ([136.243.223.33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE9P5-009vgK-NN
 for linux-mtd@lists.infradead.org; Thu, 12 Aug 2021 12:01:48 +0000
Received: from mailer.emlix.com (unknown [81.20.119.6])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id 88CA15FFEF;
 Thu, 12 Aug 2021 14:01:38 +0200 (CEST)
Subject: Re: ubifs: corrupted dirent (ENOENT), problably related to O_TMPFILE
 and linkat
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 chengzhihao1 <chengzhihao1@huawei.com>
References: <YPkj9NUxNLGG5tjL@emlix.com>
 <2125418384.6749.1626942814175.JavaMail.zimbra@nod.at>
 <3b009a01-1f13-e029-0341-9728d4dc16ea@emlix.com>
 <CAFLxGvwPCvtVKf9zCcU5DaTah3jeuiCX7-S-CPNkK0Zdd92nXQ@mail.gmail.com>
From: Sebastian Gross <sebastian.gross@emlix.com>
Organization: emlix
Message-ID: <4178a54d-3574-1650-6fa6-55cf2981a46c@emlix.com>
Date: Thu, 12 Aug 2021 14:01:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwPCvtVKf9zCcU5DaTah3jeuiCX7-S-CPNkK0Zdd92nXQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_050143_956173_C82255D2 
X-CRM114-Status: GOOD (  22.45  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgYWxsLAoKT24gNy8yNy8yMSAxMTowNiBQTSwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+
IE9uIFRodSwgSnVsIDIyLCAyMDIxIGF0IDEyOjU2IFBNIFNlYmFzdGlhbiBHcm9zcwo+IDxzZWJh
c3RpYW4uZ3Jvc3NAZW1saXguY29tPiB3cm90ZToKPj4+IENhbiB5b3UgcmVwcm9kdWNlIHVzaW5n
IGEgcmVjZW50IGtlcm5lbD8KSSBoYXZlIGZpbmFsbHkgYmVlbiBhYmxlIHRvIGxvb2sgaW50byBp
dC4KRm9yIHY1LjEzIHRoZSBlcnJvciBvbiByZXBsYXkgbm8gbG9uZ2VyIG9jY3Vycy4gVGhlIHRt
cCBmaWxlIGluIHF1ZXN0aW9uIGlzIHRoZXJlIGFuZCBoYXBweS4KCkkgd2FzIGFibGUgdG8gY3Jl
YXRlIGEgc2FuZGJveCB3aXRoIHFlbXUsIGdlbmVyaWMgRGViaWFuIDEwIHJvb3RmcyBhbmQgbmFu
ZHNpbS4KQSBzaW1wbGUgcmVwcm9kdWNlciB3YXMgYXMgc3RhdGVkIGJlZm9yZToKLSBvcGVuKE9f
VE1QRklMRSkKLSB3cml0ZSAoc29tZSBNQjsgYXQgbGVhc3QgMzIgc2VlbWVkIHRvIHN1ZmZpY2Up
Ci0gbGlua2F0CkFmdGVyIHRoYXQgdGhlIHdidWYgaGFzIGJlZW4gc3luY2VkIGFjY29yZGluZyB0
byBkbWVzZwp7e3sKVUJJRlMgREJHIGlvIChwaWQgMTY4MSk6IHN5bmNocm9uaXplClVCSUZTIERC
RyBpbyAocGlkIDE2ODEpOiBMRUIgNzc3NToxMDI0LCAzOTIgYnl0ZXMsIGpoZWFkIDEgKGJhc2Up
ClVCSUZTIERCRyBscCAocGlkIDE2ODEpOiBMRUIgNzc3NSwgZnJlZSAxNDQ1NiwgZGlydHkgODY0
LCBmbGFncyAxNgpVQklGUyBEQkcgbHAgKHBpZCAxNjgxKTogTEVCIDc3NzUsIGZyZWUgMTQzMzYs
IGRpcnR5IDk4NCwgZmxhZ3MgMTYKVUJJRlMgREJHIGxwIChwaWQgMTY4MSk6IExFQiA3Nzc1LCBm
cmVlIDE0NDU2LCBkaXJ0eSA4NjQsIGZsYWdzIDE2Cn19fQoKUG93ZXJjdXQgaGFzIGJlZW4gc2lt
dWxhdGVkIGJ5IGR1bXBpbmcgbXRkMCBhdCB0aGlzIHN0YWdlLgoKVGhpcyBsZWZ0IG1lIHdpdGgg
YSByZWFkeSB0byAoUkUtKXVzZSBOQU5EIGltYWdlLgoKPiBCdXQgb2Z0ZW4gaXQgaXMgbW9yZSBj
b21wbGljYXRlZC4gRXNwZWNpYWxseSB3aGVuIHRoZSBidWcgaXMgaW4gdGhlCj4gcmVjb3Zlcnkg
Y29kZSB3aGVuIHRoZSBmaWxlc3lzdGVtCj4gaXMgbW91bnRlZCB0aGUgbmV4dCB0aW1lLgpUaGlz
IHNlZW1zIHRvIGFjdHVhbGx5IGJlIHRoZSBjYXNlLgoKPiBJZiB5b3UgZW5hYmxlIC9zeXMva2Vy
bmVsL2RlYnVnL3ViaWZzL2Noa19mcywgaXQgd2lsbCBkbyBhIGZ1bGwgc2Nhbgo+IHVwb24gbW91
bnQgdGltZS4KID4gVGhpcyBjYW4gZGV0ZWN0IHN1Y2ggcHJvYmxlbXMuIEJ1dCBub3QgZml4IHRo
ZW0uCgpNdWNoIGFwcHJlY2lhdGVkLCB0aGFua3MuIFRoaXMgZGlkIGluIGZhY3QgZGlzY292ZXIg
dGhlIG1pc3NpbmcgaW5vZGUgdGhvdWdoIHRoZSBkaXJlbnQgd2FzIHRoZXJlIChscyBkaWQgd29y
aywgbHMgLWwgbm90KS4KCihPbiBhIHJlbGF0ZWQgbm90ZSB0aGUgbG9jYWwgdWJpZnNfZGVidWdf
aW5mbyBoYXMgYWxzbyBhbiBlbnRyeSBmb3IgY2hrX2ZzIGJ1dCBpdCB3aWxsIG5ldmVyIGJlIHVz
ZWQgOlwpCgoKV2l0aCB0aGUgbWV0aG9kIGFib3ZlIEkgd2FzIGFibGUgdG8gInBvb3ItbWFuJ3Mi
IGJpc2VjdCB0aGUgbWlub3Iga2VybmVsIHZlcnNpb25zLgoKVGhlIHJlcGxheSB3YXMgZml4ZWQg
aW4gdjUuMy4gRnJvbSB0aGVyZSBJIGJpc2VjdGVkIGRvd24gdG8gZWUxNDM4Y2U1ZGM0ZDY3ZGQ4
ZGQxZmY1MTU4MzEyMmE2MWY1YmQ5ZS4KVGhpcyBvbmUgbWlnaHQgYmUgYSBjYW5kaWRhdGUgdG8g
aW50ZWdyYXRlIGludG8gdGhlIExUUyBicmFuY2hlcy4KCkZvciA0LjE5LjIwMiBJIGhhZCB0byBw
dWxsIGluIDk4OGJlYzQxMzE4ZjNmYTg5N2UyZjhhZjI3MWJkNDU2OTM2ZDZjYWYgYWxzby4KCgpU
WVZNIGZvciB5b3VyIHN1cHBvcnQgc28gZmFyCgpLaW5kIHJlZ2FyZHMKCgpTZWJhc3RpYW4KCi0t
IApCLlNjLiBTZWJhc3RpYW4gR3Jvw58sIGVtbGl4IEdtYkgsIGh0dHA6Ly93d3cuZW1saXguY29t
CkZvbiArNDkgNTUxIDMwNjY0LTAsIEZheCArNDkgNTUxIDMwNjY0LTExLApHb3RoYWVyIFBsYXR6
IDMsIDM3MDgzIEfDtnR0aW5nZW4sIEdlcm1hbnkKU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBHw7Z0
dGluZ2VuLCBBbXRzZ2VyaWNodCBHw7Z0dGluZ2VuIEhSIEIgMzE2MApHZXNjaMOkZnRzZsO8aHJ1
bmc6IEhlaWtlIEpvcmRhbiwgRHIuIFV3ZSBLcmFja2UKVXN0LUlkTnIuOiBERSAyMDUgMTk4IDA1
NQoKZW1saXggLSB5b3VyIGVtYmVkZGVkIGxpbnV4IHBhcnRuZXIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
