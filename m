Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F684CDB465
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Oct 2023 08:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RP1rIdMJZLjUnEl2Q4AyvB3uC5vxlwfZ9Sa9dY5+iMs=; b=YOiwIqUZP2tpkUvFZ2n7IwFQHQ
	aEJrYTweJq2VU1w8+dhIWmOhHbmqLkAACrXaVfY5mtkGrKKf/OS+uQhcQbDbC9Xhm7AI+MI/ilkXT
	Q4TR+B25VpMHRaOauqlCfE3PIbdfiHTlkwxIaADwa1O0Ogz2h2xBfxqOjZDcMm7TaFQlZDQWX0Vhj
	un/aI1AfHU5fBFfDIKLEVf9TEAEXD/OnBuud7PP2Z9DN3XYpKiSfhcuJc8VCEMoS/OTjZL0nBlj1X
	4DqDw78mooPSWR0nWZcSUsutR9kugAtOIO6p0MSuqyJrcT+VigxGYuA26CmVTPmEQ2xs4dZAg2Y5A
	tcRtcLmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtO8u-00GgOC-1h;
	Thu, 19 Oct 2023 08:12:32 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtO8q-00GgM9-1e
	for linux-mtd@lists.infradead.org;
	Thu, 19 Oct 2023 08:12:30 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9939063DCAB8;
	Thu, 19 Oct 2023 10:12:15 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id I3-K0hwykdNu; Thu, 19 Oct 2023 10:12:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0466E63DCAAB;
	Thu, 19 Oct 2023 10:12:15 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gzzgvJ53A6kM; Thu, 19 Oct 2023 10:12:14 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id CF8A863DCAA7;
	Thu, 19 Oct 2023 10:12:14 +0200 (CEST)
Date: Thu, 19 Oct 2023 10:12:14 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Martin Kurbanov <mmkurbanov@salutedevices.com>
Cc: David Woodhouse <dwmw2@infradead.org>, 
	Christian Brauner <brauner@kernel.org>, 
	Dave Chinner <dchinner@redhat.com>, Yu Zhe <yuzhe@nfschina.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, kernel@sberdevices.ru
Message-ID: <1258129392.18842.1697703134703.JavaMail.zimbra@nod.at>
In-Reply-To: <20231019073838.17586-3-mmkurbanov@salutedevices.com>
References: <20231019073838.17586-1-mmkurbanov@salutedevices.com> <20231019073838.17586-3-mmkurbanov@salutedevices.com>
Subject: Re: [PATCH v1 2/2] jffs2: make cleanmarker support option
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: jffs2: make cleanmarker support option
Thread-Index: aAf02iCoSu5LqB4Vzhuut+cQ9jdF6w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_011228_724227_07FBB471 
X-CRM114-Status: GOOD (  10.57  )
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

TWFydGluLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1hcnRpbiBL
dXJiYW5vdiIgPG1ta3VyYmFub3ZAc2FsdXRlZGV2aWNlcy5jb20+Cj4gVGhpcyBwYXRjaCBzdXBw
b3J0IGZvciBkaXNhYmxlIGNsZWFubWFya2VyIG9wdGlvbi4gVGhpcyBpcyB1c2VmdWwgb24KPiBz
b21lIE5BTkQgZGV2aWNlcyB3aGljaCBlbnRpcmUgT09CIGFyZWEgaXMgcHJvdGVjdGVkIGJ5IEVD
Qy4gUHJvYmxlbQo+IGZpcmVzIHdoZW4gSkZGUzIgZHJpdmVyIHdyaXRlcyBjbGVhbm1hcmtlciB0
byBzb21lIHBhZ2UgYW5kIGxhdGVyIGl0Cj4gdHJpZXMgdG8gd3JpdGUgdG8gdGhpcyBwYWdlIC0g
d3JpdGUgd2lsbCBiZSBkb25lIHN1Y2Nlc3NmdWxseSwgYnV0IGFmdGVyCj4gdGhhdCBzdWNoIHBh
Z2UgYmVjb21lcyB1bnJlYWRhYmxlIGR1ZSB0byBpbnZhbGlkIEVDQyBjb2Rlcy4gVGhpcyBvY2N1
cnMKPiBiZWNhdXNlIHRoZSBzZWNvbmQgd3JpdGUgbmVjZXNzaXRhdGVzIGFuIHVwZGF0ZSB0byBF
Q0MsIGJ1dCBpdCBpcwo+IGltcG9zc2libGUgdG8gZG8gaXQgY29ycmVjdGx5IHdpdGhvdXQgYmxv
Y2sgZXJhc2UuCgpIbW0sIEkgbWlzcyBhbiBleHBsYW5hdGlvbiB3aHkgdGhpcyBjaGFuZ2UgaXMg
Y29ycmVjdCBhbmQgc2FmZS4KWW91IGV4cGxhaW4gd2h5IHRoZSBPT0IgYXJlYSBjYW4ndCBiZSB1
c2VkLCBva2F5LiBCdXQgeW91IG5lZWQgdG8KYWRkIG1vcmUgZGV0YWlscyBvbiB3aHkgeW91IGNo
YW5nZSBpcyBzYWZlIGluIHRlcm1zIG9mIGZpbGVzeXN0ZW0KY29uc2lzdGVuY3kuCgpCZXNpZGUg
b2YgdGhhdCwgSSBkb24ndCB0aGluayB0aGlzIHNob3VsZCBiZSBrZXJuZWwgY29uZmlnIG9wdGlv
bi4KV2h5IG5vdCBhIG1vdW50IG9wdGlvbj8KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
