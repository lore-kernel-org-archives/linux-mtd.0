Return-Path: <SRS0=I5Ka=MI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FB8C07E95
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 07:17:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DF77613AF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 07:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DF77613AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kVz+uQMaxxv5LL9/BV9WYzKBYAKCSS4sckQSXx2RIhc=; b=4wTkX8jdMfniME0mlaYxKiWKIO
	aJ1Jp7s5PknSthgF4DdjbrRQPkr7MiVht8tX67K3NlgcieBWTxejlMulWg+0UixaaQ+xIqAtwg483
	vvZw6ZnWLjoa1MDv9o2gKF/PoRTASGeYlaiuMOt8IdbuiQ7y4x7S+TiPZDCKHFvB750OlQJRwJONd
	wd3gxcbBokEpqfA5678qiTWpjfusy1y6U0TIiYOzKTNRWZA3NwxPqL48/LDn8cydhHjgRz0rw/LtJ
	zHEmDnKPlQnOCrLK2uagleb8WkqRTpJ+IJtt8hkI+iwsfxT5OeZarFXUX40uF6HLjl6+aZXjJ9+Gz
	l418vAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4I5E-003USq-0S; Fri, 16 Jul 2021 07:16:28 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4I5A-003UPT-6x
 for linux-mtd@lists.infradead.org; Fri, 16 Jul 2021 07:16:25 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8AD12616B568;
 Fri, 16 Jul 2021 09:16:13 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id wXv3S29yopAW; Fri, 16 Jul 2021 09:16:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2C4C56169BB9;
 Fri, 16 Jul 2021 09:16:13 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id tSjbk7sNumXT; Fri, 16 Jul 2021 09:16:13 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id F31C9616B568;
 Fri, 16 Jul 2021 09:16:12 +0200 (CEST)
Date: Fri, 16 Jul 2021 09:16:12 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
 Phillip Lougher <phillip@squashfs.org.uk>, 
 Sean Nyekjaer <sean@geanix.com>, 
 Kernelnewbies <kernelnewbies@kernelnewbies.org>
Message-ID: <456614823.32530.1626419772792.JavaMail.zimbra@nod.at>
In-Reply-To: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
References: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: How to get actual image size from MTD partition
Thread-Index: wRfeFLQcDSd8DiGHIt8B6zS4rgdF6w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_001624_448589_7A5F26A5 
X-CRM114-Status: UNSURE (   9.02  )
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

UGludHUsCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiUGludHUgQWdh
cndhbCIgPHBpbnR1LnBpbmdAZ21haWwuY29tPgo+IE15IHJlcXVpcmVtZW50Ogo+IFRvIGZpbmQg
dGhlIGNoZWNrc3VtIG9mIGEgcmVhbCBpbWFnZSBpbiBydW50aW1lIHdoaWNoIGlzIGZsYXNoZWQg
aW4gYW4KPiBNVEQgcGFydGl0aW9uLgo+IAo+IFByb2JsZW06Cj4gQ3VycmVudGx5LCB0byBmaW5k
IHRoZSBjaGVja3N1bSwgd2UgYXJlIHVzaW5nOgo+ICQgbWQ1c3VtIC9kZXYvbXRkMTQKPiBUaGlz
IHJldHVybnMgdGhlIHByb3BlciBjaGVja3N1bSBvZiB0aGUgZW50aXJlIHBhcnRpdGlvbi4KPiBC
dXQgd2Ugd2FudGVkIHRvIGZpbmQgdGhlIGNoZWNrc3VtIG9ubHkgZm9yIHRoZSBhY3R1YWwgaW1h
Z2UgZGF0YQo+IHdoaWNoIHdpbGwgYmUgdXNlZCBieSBvdXIgQyB1dGlsaXR5IHRvIHZhbGlkYXRl
IHRoZSBpbWFnZS4KPiBIZXJlLCB3ZSBkb24ndCBrbm93IHRoZSBhY3R1YWwgaW1hZ2Ugc2l6ZS4K
PiBXZSBvbmx5IGtub3cgdGhlICJwYXJ0aXRpb24tc2l6ZSIgYW5kICJlcmFzZXNpemUiLgo+IAo+
IFNvLCBpcyB0aGVyZSBhIG1lY2hhbmlzbSB0byBzb21laG93IGZpbmQgdGhlIGltYWdlIHNpemUg
YXQgcnVudGltZT8KCm5vdCByZWFsbHksIFVCSSBtYW5hZ2VzIHRoZSBNVEQgYW5kIGRvZXMgd2Vh
cmxldmVsaW5nLCBhdXRvIGdyb3dpbmcgb2Ygdm9sdW1lcywgZXRjLi4uClNvIGFzIHNvb24geW91
IGF0dGFjaCB0aGUgaW1hZ2Ugb25jZSwgaXQgaXMgY2hhbmdlZCBhbmQgdGhlIGNoZWNrc3VtIHdv
bid0IG1hdGNoLgpJdCBtYXkgd29yayBpZiB5b3UgZG9uJ3QgYXR0YWNoIFVCSSBhbmQgeW91ciBm
bGFzaCBwcm9ncmFtIHRvb2wga2VlcHMgdHJhY2sgb2YKd2hhdCBwYWdlcyBpdCB3cm90ZS4KClRo
YW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
