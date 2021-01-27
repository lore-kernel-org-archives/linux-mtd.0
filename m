Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97CEC433E6
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 21:19:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8271B60C3E
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 21:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8271B60C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OqN5j3ZVMWLnL/HaWhEPsRuX0zNTBZT/YrLsxJtrRi8=; b=F9IvAgxVUXAneAJHRcYFJitp+
	UqCrp7Wdvc90MPoDAF9rJ21EYk3DZoLIAADsYGv6LXPnnYE9jT8mUCsQb3Ov7xQKFpxuEVgKrk6JZ
	b+H97xG70E+52/VCIC8IeB1WRn0riBzQlBmrHhue90wahV/zqTjYBCbGWnKh2Rkh/ynCxmXQgz35e
	3F+TYDeNv3U5M8LODS0wKKobOzV6PkhCL9InXpcr6I15saLJC3SpWOqkjzN0WHEd+5bDAMdQ9btsV
	C5mC3hZGaRhVZLp0x1FUoIrb4fSk0CzAdUqBxxpI3WlqFc+WssLdCc2TgPoWcY2IQD2cUlZB9Kh+j
	UWqRUSi/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4sCJ-0000Uh-0B; Wed, 27 Jan 2021 21:17:55 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4sCG-0000UH-JD
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 21:17:53 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 86D24625DE1E;
 Wed, 27 Jan 2021 22:17:51 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 79ZlmV87B62C; Wed, 27 Jan 2021 22:17:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 244DB625DE1C;
 Wed, 27 Jan 2021 22:17:51 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id pgoXEc18aL20; Wed, 27 Jan 2021 22:17:51 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id F3E4E625DE1E;
 Wed, 27 Jan 2021 22:17:50 +0100 (CET)
Date: Wed, 27 Jan 2021 22:17:50 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Tomas Winkler <tomas.winkler@intel.com>
Message-ID: <1776363776.325713.1611782270873.JavaMail.zimbra@nod.at>
In-Reply-To: <c8d0f22c5fdf443cb8dda1f996b148d9@intel.com>
References: <20210127200319.662842-1-tomas.winkler@intel.com>
 <9732911.325628.1611780400338.JavaMail.zimbra@nod.at>
 <c8d0f22c5fdf443cb8dda1f996b148d9@intel.com>
Subject: Re: [PATCH] mtd: use refcount to prevent corruption
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: use refcount to prevent corruption
Thread-Index: AQHW9OeD00Da249Jw0qJn6+VIZAeUao7z7AAgAAh5BBxoBSOfA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_161752_742979_4B4B768A 
X-CRM114-Status: GOOD (  10.47  )
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
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiA+IFdoZW4gdW5kZXJseWluZyBkZXZp
Y2UgaXMgcmVtb3ZlZCBtdGQgY29yZSB3aWxsIGNyYXNoIGluIGNhc2UgdXNlcgo+PiA+IHNwYWNl
IGlzIHN0aWxsIGhvbGRpbmcgYW4gb3BlbiBoYW5kbGUgdG8gYSBtdGQgZGV2aWNlIG5vZGUuCj4+
ID4gQSBwcm9wZXIgcmVmY291bnRpbmcgaXMgbmVlZGVkIHNvIGRldmljZSBpcyByZWxlYXNlIG9u
bHkgd2hlbiBhCj4+ID4gcGFydGl0aW9uIGhhcyBubyBhY3RpdmUgdXNlcnMuIFRoZSBjdXJyZW50
IHNpbXBsZSBjb3VudGVyIGlzIG5vdAo+PiA+IHN1ZmZpY2llbnQuCj4+IAo+PiBDYW4geW91IHBs
ZWFzZSBleHBsYWluIGEgbGl0dGxlIG1vcmUgd2hhdCBkZXZpY2VzIGFyZSBpbnZvbHZlZD8KPj4g
RG9lcyBpdCBpbXBsZW1lbnQgX2dldF9kZXZpY2UoKSBhbmQgX3B1dF9kZXZpY2UoKT8KPiBObyB0
aGlzIGlzIG5vdCBjb25uZWN0ZWQgdG8gdGhvc2UgaGFuZGxlcnMgb2YgdGhlIHVuZGVybHlpbmcg
ZGV2aWNlIGFuZCB0aG9zZQo+IHdvbid0IGhlbHAuCj4gSSBoYXZlIGEgc3BpIGRldmljZSBwcm92
aWRlZCBieSBNRkQgZnJhbWV3b3JrIHNvIGl0IGNhbiBnbyBhd2F5IGFueXRpbWUuCgpDYW4gaXQg
Z28gYXdheSBwaHlzaWNhbGx5IG9yIGp1c3QgaW4gc29mdHdhcmU/CgpVc3VhbGx5IHRoZSBwYXR0
ZXJuIGlzIHRoYXQgeW91IG1ha2Ugc3VyZSBpbiB0aGUgZGV2aWNlIGRyaXZlciB0aGF0IG5vYm9k
eQpjYW4gb3JwaGFuIHRoZSBNVEQgd2hpbGUgaXQgaXMgaW4gdXNlLgplLmcuIGRyaXZlcnMvbXRk
L3ViaS9nbHVlYmkuYyBkb2VzIHNvLiBJbiBfZ2V0X2RldmljZSgpIGl0IGdyYWJzIGEgcmVmZXJl
bmNlIG9uIHRoZQp1bmRlcmx5aW5nIFVCSSB2b2x1bWUgdG8gbWFrZSBzdXJlIGl0IGNhbm5vdCBn
byBhd2F5IHdoaWxlIHRoZSBNVEQgKG9uIHRvcCBvZiBVQkkpCmlzIGluIHVzZS4KClRoYW5rcywK
Ly9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
