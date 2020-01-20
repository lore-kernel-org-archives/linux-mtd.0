Return-Path: <SRS0=bf65=3J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D389C33CA1
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 09:44:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20A44207E0
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 09:44:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="osncVm94"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20A44207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kkxPWgTnuuSt5Llpv8NAiBzTZNLeb5aXpJCDfpB/Rvw=; b=osncVm94I2bAeF
	Q7OtXLikEof4X1QcnL1dClYO/NDxTe9uLc3KwEyODx9d+xnA3WPO6DNHpsfUFDoA6xW4yZ+rjrPrg
	7xc2mYNgR5xH2Rmck5eyaMOOjNEgOnbTQyIEVVwSrD6K7tTdavzAy1AKR7pEjKhCEMN2BLXYGLCHH
	YXtFuSdRXnRR6MDGSpuyNEBF7Up2YtOUv7Lko/Ek1U3atF1r34TKt1QS62OzZeUbTcne6NcRIGLrX
	ilyJ4k8p7S/N/1aani2WdaYVLf0gxlVtosIzOPWYZRMM5Zh2f2yuLCnThdmuTJKazscpjn6N6C6dJ
	Bsj3p0Dp7oG0tzwViH/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itTbr-0006lw-I4; Mon, 20 Jan 2020 09:44:39 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itTbk-0006lZ-KO
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2020 09:44:38 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6D4AE6088963;
 Mon, 20 Jan 2020 10:44:30 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KPxdARioXyAh; Mon, 20 Jan 2020 10:44:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D37CC609D2C6;
 Mon, 20 Jan 2020 10:44:29 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BqmNdpKNn148; Mon, 20 Jan 2020 10:44:29 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id A8DC66088963;
 Mon, 20 Jan 2020 10:44:29 +0100 (CET)
Date: Mon, 20 Jan 2020 10:44:29 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <397871241.24589.1579513469565.JavaMail.zimbra@nod.at>
In-Reply-To: <20200120065422.GA976@sol.localdomain>
References: <20191209212721.244396-1-ebiggers@kernel.org>
 <20200103170927.GO19521@gmail.com>
 <CAFLxGvwA6y2+Azm1Xc+-cz1N_jjJXY3uZBVDqGGLvc6GMcb5JA@mail.gmail.com>
 <20200120065422.GA976@sol.localdomain>
Subject: Re: [PATCH] ubifs: use IS_ENCRYPTED() instead of
 ubifs_crypt_is_encrypted()
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: use IS_ENCRYPTED() instead of ubifs_crypt_is_encrypted()
Thread-Index: PjfFjglSsxFK8GwPNc8HVEdJvJHlrQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_014432_816495_30EE4E1B 
X-CRM114-Status: GOOD (  13.74  )
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
Cc: linux-fscrypt <linux-fscrypt@vger.kernel.org>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ci0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJFcmljIEJpZ2dlcnMiIDxl
YmlnZ2Vyc0BrZXJuZWwub3JnPgo+IEFuOiAiUmljaGFyZCBXZWluYmVyZ2VyIiA8cmljaGFyZC53
ZWluYmVyZ2VyQGdtYWlsLmNvbT4KPiBDQzogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJs
aW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJsaW51eC1mc2NyeXB0
Igo+IDxsaW51eC1mc2NyeXB0QHZnZXIua2VybmVsLm9yZz4sICJDaGFuZGFuIFJhamVuZHJhIiA8
Y2hhbmRhbkBsaW51eC52bmV0LmlibS5jb20+Cj4gR2VzZW5kZXQ6IE1vbnRhZywgMjAuIEphbnVh
ciAyMDIwIDA3OjU0OjIyCj4gQmV0cmVmZjogUmU6IFtQQVRDSF0gdWJpZnM6IHVzZSBJU19FTkNS
WVBURUQoKSBpbnN0ZWFkIG9mIHViaWZzX2NyeXB0X2lzX2VuY3J5cHRlZCgpCgo+IE9uIFRodSwg
SmFuIDA5LCAyMDIwIGF0IDA5OjAxOjA5QU0gKzAxMDAsIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90
ZToKPj4gT24gRnJpLCBKYW4gMywgMjAyMCBhdCA2OjA5IFBNIEVyaWMgQmlnZ2VycyA8ZWJpZ2dl
cnNAa2VybmVsLm9yZz4gd3JvdGU6Cj4+ID4KPj4gPiBPbiBNb24sIERlYyAwOSwgMjAxOSBhdCAw
MToyNzoyMVBNIC0wODAwLCBFcmljIEJpZ2dlcnMgd3JvdGU6Cj4+ID4gPiBGcm9tOiBFcmljIEJp
Z2dlcnMgPGViaWdnZXJzQGdvb2dsZS5jb20+Cj4+ID4gPgo+PiA+ID4gVGhlcmUncyBubyBuZWVk
IGZvciB0aGUgdWJpZnNfY3J5cHRfaXNfZW5jcnlwdGVkKCkgZnVuY3Rpb24gYW55bW9yZS4KPj4g
PiA+IEp1c3QgdXNlIElTX0VOQ1JZUFRFRCgpIGluc3RlYWQsIGxpa2UgZXh0NCBhbmQgZjJmcyBk
by4gIElTX0VOQ1JZUFRFRCgpCj4+ID4gPiBjaGVja3MgdGhlIFZGUy1sZXZlbCBmbGFnIGluc3Rl
YWQgb2YgdGhlIFVCSUZTLXNwZWNpZmljIGZsYWcsIGJ1dCBpdAo+PiA+ID4gc2hvdWxkbid0IGNo
YW5nZSBhbnkgYmVoYXZpb3Igc2luY2UgdGhlIGZsYWdzIGFyZSBrZXB0IGluIHN5bmMuCj4+ID4g
Pgo+PiA+ID4gU2lnbmVkLW9mZi1ieTogRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0Bnb29nbGUuY29t
Pgo+PiA+ID4gLS0tCj4+ID4gPiAgZnMvdWJpZnMvZGlyLmMgICAgIHwgOCArKysrLS0tLQo+PiA+
ID4gIGZzL3ViaWZzL2ZpbGUuYyAgICB8IDQgKystLQo+PiA+ID4gIGZzL3ViaWZzL2pvdXJuYWwu
YyB8IDYgKysrLS0tCj4+ID4gPiAgZnMvdWJpZnMvdWJpZnMuaCAgIHwgNyAtLS0tLS0tCj4+ID4g
PiAgNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+PiA+
Cj4+ID4gUmljaGFyZCwgY2FuIHlvdSBjb25zaWRlciBhcHBseWluZyB0aGlzIHRvIHRoZSBVQklG
UyB0cmVlIGZvciA1LjY/Cj4+IAo+PiBTdXJlLiBJJ20gYmFjayBmcm9tIHRoZSB4LW1hcyBicmVh
ayBhbmQgc3RhcnQgY29sbGVjdGluZyBwYXRjaGVzLgo+PiAKPiAKPiBQaW5nPyAgSSBzZWUgdGhl
IG90aGVyIFVCSUZTIHBhdGNoZXMgSSBzZW50IGluIGxpbnV4LXViaWZzLmdpdCNsaW51eC1uZXh0
LAo+IGJ1dCBub3QgdGhpcyBvbmUuCgpPaCBkZWFyLCBJIHJldmlld2VkIGJ1dCBmb3Jnb3QgdG8g
YXBwbHkgaXQuIE5vdyBJJ20gYWxyZWFkeSB0cmF2ZWxpbmcgd2l0aG91dCBteQprZXJuZWwub3Jn
IFBHUCBrZXlzLgoKVGhlIHBhdGNoIGlzIHNpbXBsZSBhbmQgc2FuZSwgc28gSSdtIHRvdGFsbHkg
ZmluZSBpZiB5b3UgY2FycnkgaXQgdmlhIGZzY3J5cHQuCkFub3RoZXIgb3B0aW9uIGlzIHRoYXQg
TWlxdWVsIGNhcnJpZXMgaXQgdmlhIE1URCB0aGlzIHRpbWUuCgpJbiBhbnkgY2FzZToKCkFja2Vk
LWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgoKU29ycnkgZm9yIG1lc3Np
bmcgdGhpcyB1cC4gOi0oCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
