Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41ED6C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 15:21:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2EAD61076
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 15:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2EAD61076
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1uu+fabK986aQSa2MlRyaQu4Qs8BieezSgLzwCpWBCg=; b=zJxoeLUcTTuJVVs/lsUHmOIT8C
	EhJZ8DB/IcfBtzLw0Bm2qpp/WZ7XzR9W+06pATGMBq7amWq4VZklwhT9HKeNP9FKLGmL4O4sUfHn3
	KHVkn1WDnJ2xbw/vhwCYGfRaRz0f9Ow/ozsR6ZNcIDT8X5Wx/pMEr5XF2SwYhWZuRDurx/a3rbwz9
	k5myDIDnd/U3lHrlnKzvyfF5Qd8XMC0Qd71YSbdNC2dzsPIHMV5OZ/CnIaS2L+kVtWuEr79e4tCnc
	8eOhqeYO6pDWkTwId+FxnI9xHU8H9noT+gzg3qg8Ja6z8Gg6nPkordKiRQVwrjow2r3e2da+coNd4
	R3XQzLLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYVCY-0009A0-3f; Thu, 07 Oct 2021 15:20:54 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYVCU-00099b-UM
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 15:20:52 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0EA8561B8F44;
 Thu,  7 Oct 2021 17:20:48 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id tpOXBKPqq779; Thu,  7 Oct 2021 17:20:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6CC1760F6B60;
 Thu,  7 Oct 2021 17:20:47 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SiN3Vgp0wa2M; Thu,  7 Oct 2021 17:20:47 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 438E861B8F44;
 Thu,  7 Oct 2021 17:20:47 +0200 (CEST)
Date: Thu, 7 Oct 2021 17:20:47 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Message-ID: <940617141.46853.1633620047008.JavaMail.zimbra@nod.at>
In-Reply-To: <20211007142617.3hgjddbbvcowzgc3@lug-owl.de>
References: <20211001192836.n6eek7rno7ewvmu7@lug-owl.de>
 <20211005144936.xnkzugjr3oygauei@lug-owl.de>
 <837215091.45041.1633589943979.JavaMail.zimbra@nod.at>
 <1970203009.45154.1633591205445.JavaMail.zimbra@nod.at>
 <20211007135401.4z3gcunwr2uq7fpx@lug-owl.de>
 <135911793.46658.1633616346904.JavaMail.zimbra@nod.at>
 <20211007142617.3hgjddbbvcowzgc3@lug-owl.de>
Subject: Re: PING: [PATCH] Don't overflow when writing a key
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF92 (Linux)/8.8.12_GA_3809)
Thread-Topic: PING: [PATCH] Don't overflow when writing a key
Thread-Index: u28rPhqptGCSaqUtHNwoPkkvQVz8Lg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_082051_174520_55F7D93E 
X-CRM114-Status: UNSURE (   5.79  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkphbi1CZW5lZGljdCBHbGF3
IiA8amJnbGF3QGx1Zy1vd2wuZGU+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4g
Cj4gU28gLi4uICBUaGUgY29kZSBkb2VzIF9ub3RfIG92ZXJmbG93LCB0aGF0J3MgZ29vZCBmaXJz
dCBvZiBhbGwuIEl0J3MKPiBqdXN0IGEgYml0IGNvbmZ1c2luZyBob3cgdGhlIGtleSBieXRlcyBh
cmUgd3JpdHRlbiB0byB0aGUgYnVmZmVyLiBBdAo+IGxlYXN0IEkgd2FzIGVhc2lseSBkaXN0cmFj
dGVkIGJ5IHRoZSB0d28gZGlmZmVyZW50IHNpemVzLgoKSWYgeW91IGZpbmQgYSBiZXR0ZXIgd2F5
IHRvIHdyaXRlIHRoZSBmdW5jdGlvbiwgSSdtIGFsbCBvcGVuIGZvciBhIHBhdGNoLgpCdXQgcGxl
YXNlIG1ha2Ugc3VyZSB0aGUgZ2VuZXJhdGVkIGNvZGUgaXMgc2FuZS4KClRoYW5rcywKLy9yaWNo
YXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
