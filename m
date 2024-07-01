Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0130DC2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 07:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lZSNqbkroboW1YyhskDNKnqm7B6fk1ZvHThf+huiBKs=; b=AdXGeHDq+kBGMQ
	6BT/jgAgE+spEsxDaYipsEjKTSPIfPiHFKjjn8joIVncGJ3CrRsKhTbPEw2kxQKasEDLriLI5pJYK
	nf62sN4Wldc8IDVCErJJXVr3rQQnkf1EPeh3hllj09jsLQnlZCsDh48c9xTusmlN+g+rYaAqLumQN
	xWGzL9qaQhkNR3POUjOgKqDZSmBKELzCITCUM+vihkplxjdMeWOpcfasYoff+t+DxekkNfBrJk830
	sRQyO0Yj28AdTSrw3M7VLoXKLleND7nHEWnHZW9vJztJmmpaPZ6UGX1IrZaNJ2fIxU5BY5GWTfGrM
	6mCvrwjwEj694/10DDuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOBZB-000000023Xx-3bN1;
	Mon, 01 Jul 2024 07:35:13 +0000
Received: from mail.envisioncraftsman.com ([162.19.67.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOBZ9-000000023XQ-1H48
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 07:35:12 +0000
Received: by mail.envisioncraftsman.com (Postfix, from userid 1002)
	id AA92121791; Mon,  1 Jul 2024 09:35:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=envisioncraftsman.com; s=mail; t=1719819309;
	bh=uGTmdNfeKWYppKfROrYtp0X+RK7/pRJQsBUrarqToyk=;
	h=Date:From:To:Subject:From;
	b=dvU/BaeyURcRj0LQS9hGyGpv3AGqE05kOqNBpruaGViQVlUtptWXE1vsdfCj+eVNO
	 qi4ZyREsj0y6hvrVEoywaWdzvjwMHH7jAreh/CYNCfGU7wISQcSh2L0Z1RV7u46f4D
	 THE66vJlHh4bDBxQxoR/z7Ovw7YeMBlpLPlrSMgDtqQdi+lv+NojH7UBeZabsTQ0Dl
	 e6irFa55kcbBj2QXbW6PXy197KCwC6w+YDtDAPdUV1dw1JPboFwcbY02lYgsnBBhXj
	 ZGC0f8IJTosETinmjSNjXwXSScsVhwLAmZxltP2L57mzCmUdDSneMKYB6WYpwdSbbp
	 TluzMVZmG7Upw==
Received: by mail.envisioncraftsman.com for <linux-mtd@lists.infradead.org>; Mon,  1 Jul 2024 07:35:07 GMT
Message-ID: <20240701084500-0.1.3j.n9kz.0.vzedmqjeai@envisioncraftsman.com>
Date: Mon,  1 Jul 2024 07:35:07 GMT
From: =?UTF-8?Q?"Jan_Pol=C3=A1=C5=A1ek"?= <jan.polasek@envisioncraftsman.com>
To: <linux-mtd@lists.infradead.org>
Subject: Quick Question About Collaboration
X-Mailer: mail.envisioncraftsman.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_003511_507056_053A4E89 
X-CRM114-Status: UNSURE (   2.95  )
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

SGVsbG8hCgpJIGFtIHZlcnkgaW1wcmVzc2VkIHdpdGggdGhlIHByb2R1Y3RzIGFuZCBzZXJ2aWNl
cyB5b3Ugb2ZmZXIuCgpJIHRob3VnaHQgd2UgY291bGQgaGVscCB5b3UgcmVhY2ggYSBsYXJnZXIg
YXVkaWVuY2Ugd2l0aCB5b3VyIG9mZmVyaW5ncy4gV291bGQgeW91IGJlIGludGVyZXN0ZWQgaW4g
Y29sbGFib3JhdGluZyB3aXRoIHVzIGluIGFuIGFmZmlsaWF0ZSBtYXJrZXRpbmcgY2FtcGFpZ24/
CgpGb3IgZXhhbXBsZSwgb3VyIHByb2dyYW0gZm9yIGEgY29tcGFueSBpbiB0aGUgZS1jb21tZXJj
ZSBzZWN0b3IgcmVzdWx0ZWQgaW4gYW4gaW5jcmVhc2UgaW4gcmV2ZW51ZSBmcm9tIDglIHRvIGFu
IGltcHJlc3NpdmUgMTklIChvbiBhdmVyYWdlIHBlciBxdWFydGVyKS4KCldlIGFjaGlldmUgdXAg
dG8gMTMlIHR1cm5vdmVyIGluIEdBNCwgd2hpbGUgc3RhbmRhcmQgYWZmaWxpYXRlIG5ldHdvcmtz
IGdlbmVyYXRlIG9ubHkgMy02JS4KCldvdWxkIHlvdSBoYXZlIHRpbWUgZm9yIGEgc2hvcnQgY29u
dmVyc2F0aW9uIGluIHRoZSBuZXh0IGZldyBkYXlzPwoKCkJlc3QgcmVnYXJkcwpKYW4gUG9sw6HF
oWVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
