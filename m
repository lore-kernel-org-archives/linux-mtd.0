Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F965C4741F
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 08:46:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E4182067D
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 08:46:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wIttIkPr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E4182067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1UkJt/+Ftf+UEzw0AStBGrSSS9yCZ7QFkEX5ugt/P6k=; b=wIttIkPrG8Qd7UoDauhOPIJKq
	rlcCDMdydxDAAURaRyhDZWUmqqE9nklEGjiOK7qgpyDoZsGjQHXt51xmQn98EQGIwoMhuZM9hSPZ9
	Kzx5jDRQieEYBfJ1RH61O8y0gNRqm4oDdNdlRUCjfT693FK/zCK29IphHKqBgXivMmnIRlqB+riQY
	wJAYZJsFt4WbexuNv6QjDrx8nv/1peF3IDjOp/5D7eleQ0+KTMFo10lDyEGeqw/r1EuKdbu3RZoTd
	6aLEvbf2r7y7kNfbTEOIjO7NSBth7JAjAteBptpB3G5okbqH14XLt2VjWXOVvmNmv5KN+nBmpLGRd
	wJ1GDx3tA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNBFY-0000xH-Rz; Tue, 29 Sep 2020 08:44:40 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNBFV-0000up-Dk
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 08:44:39 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C19246125F2D;
 Tue, 29 Sep 2020 10:44:33 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id HHW3Qf_pwNH7; Tue, 29 Sep 2020 10:44:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5F79061BD1BE;
 Tue, 29 Sep 2020 10:44:33 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7b1UWPjEyI4Q; Tue, 29 Sep 2020 10:44:33 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3767B6125F2D;
 Tue, 29 Sep 2020 10:44:33 +0200 (CEST)
Date: Tue, 29 Sep 2020 10:44:33 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Sascha Hauer <s.hauer@pengutronix.de>
Message-ID: <1641873979.143790.1601369073151.JavaMail.zimbra@nod.at>
In-Reply-To: <20200929083232.GA11648@pengutronix.de>
References: <20200928190612.12074-1-richard@nod.at>
 <20200929083232.GA11648@pengutronix.de>
Subject: Re: [PATCH] ubifs: journal: Make sure to not dirty twice for auth
 nodes
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: journal: Make sure to not dirty twice for auth nodes
Thread-Index: jAQnWmKtuwm37EzhDVXBPQ9JkDWXQw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_044437_651513_A6F2A1A4 
X-CRM114-Status: UNSURE (   9.80  )
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
Cc: Kristof Havasi <havasiefr@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlNhc2NoYSBIYXVlciIgPHMu
aGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4g
Q0M6ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJsaW51eC1r
ZXJuZWwiIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiwgInN0YWJsZSIKPiA8c3RhYmxl
QHZnZXIua2VybmVsLm9yZz4sICJLcmlzdG9mIEhhdmFzaSIgPGhhdmFzaWVmckBnbWFpbC5jb20+
Cj4gR2VzZW5kZXQ6IERpZW5zdGFnLCAyOS4gU2VwdGVtYmVyIDIwMjAgMTA6MzI6MzIKPiBCZXRy
ZWZmOiBSZTogW1BBVENIXSB1Ymlmczogam91cm5hbDogTWFrZSBzdXJlIHRvIG5vdCBkaXJ0eSB0
d2ljZSBmb3IgYXV0aCBub2RlcwoKPiBPbiBNb24sIFNlcCAyOCwgMjAyMCBhdCAwOTowNjoxMlBN
ICswMjAwLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4+IFdoZW4gcmVtb3ZpbmcgdGhlIGxh
c3QgcmVmZXJlbmNlIG9mIGFuIGlub2RlIHRoZSBzaXplIG9mIGFuIGF1dGggbm9kZQo+PiBpcyBh
bHJlYWR5IHBhcnQgb2Ygd3JpdGVfbGVuLiBTbyB3ZSBtdXN0IG5vdCBjYWxsIHViaWZzX2FkZF9h
dXRoX2RpcnQoKS4KPj4gQ2FsbCBpdCBvbmx5IHdoZW4gbmVlZGVkLgo+PiAKPj4gQ2M6IDxzdGFi
bGVAdmdlci5rZXJuZWwub3JnPgo+PiBDYzogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJv
bml4LmRlPgo+PiBDYzogS3Jpc3RvZiBIYXZhc2kgPGhhdmFzaWVmckBnbWFpbC5jb20+Cj4+IEZp
eGVzOiA2YTk4YmM0NjE0ZGUgKCJ1YmlmczogQWRkIGF1dGhlbnRpY2F0aW9uIG5vZGVzIHRvIGpv
dXJuYWwiKQo+PiBSZXBvcnRlZC1ieTogS3Jpc3RvZiBIYXZhc2kgPGhhdmFzaWVmckBnbWFpbC5j
b20+Cj4+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+
Cj4gCj4gTG9va2VkIGF0IHRoZSBjb2RlIHVudGlsIEkgdW5kZXJzdG9vZCB3aGF0IHRoZSBwcm9i
bGVtIGlzIGFuZCBob3cgaXQgaXMKPiBmaXhlZCwgc286Cj4gCj4gUmV2aWV3ZWQtYnk6IFNhc2No
YSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4KCkFwcGxpZWQgdG8gZml4ZXMgYnJhbmNo
IQoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
