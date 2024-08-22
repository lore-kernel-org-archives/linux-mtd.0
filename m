Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F01C3DA4A
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Aug 2024 08:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lZSNqbkroboW1YyhskDNKnqm7B6fk1ZvHThf+huiBKs=; b=1xvb7KswERL7Y5
	O3eSARsjgFpJwXnAd3Z5HZL7d8/vukzR/Gqg6+fnUF6eCd8OGQ2prErfQmG29JYPa8jppXviumO8S
	+NKhn+3jlGpTZA/d2bwPDoTgw52l6sZFe90R9EMX9fHDL43BiSWRedCIoMwq1bsSFtw2O4D2/O2Zk
	Lj/DK7zBjZLqKAWtXBAw23tQf8Xj+IQBpTQ9CvsEjKHpXVxPOD2hlLQAgH+t9/20jF5osfjTGaPgr
	fONHcgm73CdQTcaLNEKVu8dsDS6hWYkumC3/8hdSvXj9rlYNntbdMxDR9I7jekSZbgdb38VDA6EY8
	Yzl6omprn4I8uUvIZnLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh2oE-0000000ByGn-1i1D;
	Thu, 22 Aug 2024 08:04:42 +0000
Received: from mail.envisioncraftsman.com ([162.19.67.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh2nq-0000000By9N-05YR
	for linux-mtd@lists.infradead.org;
	Thu, 22 Aug 2024 08:04:19 +0000
Received: by mail.envisioncraftsman.com (Postfix, from userid 1002)
	id 2F8D22477C; Thu, 22 Aug 2024 10:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=envisioncraftsman.com; s=mail; t=1724313657;
	bh=uGTmdNfeKWYppKfROrYtp0X+RK7/pRJQsBUrarqToyk=;
	h=Date:From:To:Subject:From;
	b=b/i8tewDsONKwQwcBSu1RP1GYQynDICTD8q4dJbsJy9VGXQQljO7YKvbkCNilOOQO
	 8ckOrkcj4qdfrzaE7uwhJuya8lOrtndgomNIG8YZjowSugSTlc2z6aoXf0XrHaXhrL
	 a2EKWltul1pxrHK926GYVf43o9eXINZTHddoatkvMuGqI5B/FyUhQ/5/svRGDWjan/
	 vwPjyWfy41hnLX2HK8Rrn/Fv2qIBpYKwECjglqDVCEbuTawHlV8VEfmR+q/u9yS3Xm
	 izrOK7TwC5nUUfN7Nh+aBnQId4N51+k/kFGkxNUa8d44FDG0MLPgmkJ+m5symPKze1
	 bGV/BAhrzXH3g==
Received: by mail.envisioncraftsman.com for <linux-mtd@lists.infradead.org>; Thu, 22 Aug 2024 08:00:39 GMT
Message-ID: <20240822084500-0.1.4k.vsnh.0.0dw199fv3a@envisioncraftsman.com>
Date: Thu, 22 Aug 2024 08:00:39 GMT
From: =?UTF-8?Q?"Jan_Pol=C3=A1=C5=A1ek"?= <jan.polasek@envisioncraftsman.com>
To: <linux-mtd@lists.infradead.org>
Subject: Quick Question About Collaboration
X-Mailer: mail.envisioncraftsman.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_010418_211092_7EB459AD 
X-CRM114-Status: UNSURE (   2.17  )
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
