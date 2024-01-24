Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3686EC46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 09:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YNPOZkgGIFyK8eKsGLOrG1V8RWg4+2F0mwQeNz+yHIo=; b=xNv36JoujeaB8z8o1OzcjUUSyx
	yCJP9hT2oWV/DtTkhY4zGDOtMm7MjP/KT6HwcudwRgQ1vbkFHR4ypwKj3MtS5IHQYup6Khg3curc+
	c5CWTQITP81uFa8E9Ng4q4HeJ378Sny5Vk4L4HUpCcfjHvEea3UOGXTHhPYRAnEilg+c4Fp0PdSOe
	a/GLBDKM+l+neZtfKw7I6i0K3pRDjHiTeYVmQHEjzIwH1zHJ9ESRoCPCKQ2f14HQLbUS62hQvZ1tT
	fXloV7bXzPw5u2bbhIq0FEKo8UUHrkHjth0+t+bzU0MSg0heSH4pIjoldXZsTQx8duwizOq8iCULl
	4NwL+QNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZaN-002FK1-33;
	Wed, 24 Jan 2024 09:30:19 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZaK-002FGK-2y
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 09:30:18 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0447C64507DA;
	Wed, 24 Jan 2024 10:30:04 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id i1jKCdxAcF4W; Wed, 24 Jan 2024 10:30:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EC13764507E4;
	Wed, 24 Jan 2024 10:30:03 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RiGPrDHyZYOm; Wed, 24 Jan 2024 10:30:03 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8BDFE64507DA;
	Wed, 24 Jan 2024 10:30:03 +0100 (CET)
Date: Wed, 24 Jan 2024 10:30:03 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Chenyuan Yang <cy54@illinois.edu>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	syzkaller <syzkaller@googlegroups.com>, 
	Zijie Zhao <zijie4@illinois.edu>, 
	Lingming Zhang <lingming@illinois.edu>
Message-ID: <1166579150.272394.1706088603335.JavaMail.zimbra@nod.at>
In-Reply-To: <A65BC97A-20AA-4B9E-B7A1-6151B9E7CDC2@illinois.edu>
References: <PH7PR11MB57682489034B17034C021B04A06B2@PH7PR11MB5768.namprd11.prod.outlook.com> <1433EB7A-FC89-47D6-8F47-23BE41B263B3@illinois.edu> <1461336945.270251.1706026541359.JavaMail.zimbra@nod.at> <FECA0ED0-EBF6-48CC-974C-B936007091E9@illinois.edu> <1365676233.271004.1706041442841.JavaMail.zimbra@nod.at> <A65BC97A-20AA-4B9E-B7A1-6151B9E7CDC2@illinois.edu>
Subject: Re: [Linux Kernel Bug] WARNING: zero-size vmalloc in
 ubi_read_volume_table
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: WARNING: zero-size vmalloc in ubi_read_volume_table
Thread-Index: AQHaQj+4RGN0tgPjZkuYXFZU3Q3pbrDnOT+A/mfrKH2BmCf8gKrQHNMb1TBJBQAPHg3CmA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_013017_131586_A337AC08 
X-CRM114-Status: UNSURE (   2.12  )
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

Q2hlbnl1YW4sCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiQ2hlbnl1
YW4gWWFuZyIgPGN5NTRAaWxsaW5vaXMuZWR1Pgo+IG10ZDAKPiBOYW1lOiAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG10ZHJhbSB0ZXN0IGRldmljZQo+IFR5cGU6ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmFtCj4gRXJhc2VibG9jayBzaXplOiAgICAgICAgICAgICAgICA0MDk2IGJ5dGVz
LCA0LjAgS2lCCgpZb3UncmUgd29ya2luZyB3aXRoIGFuIGV4dHJlbWVseSBzbWFsbCBNVEQgYW5k
IHRoZSBmdXp6ZXIgc2V0IHRoZSBWSUQKb2Zmc2V0IHRvIGEgbGFyZ2UgdmFsdWUuIEFzIGEgY29u
c2VxdWVuY2UsIHRoZSBMRUIgc2l6ZSB3YXMgc21hbGxlciB0aGFuCmEgc2luZ2xlIHZvbHVtZSB0
YWJsZSByZWNvcmQgYW5kIHRoZSBjYWxjdWxhdGlvbiBvZiB0aGUgdm9sdW1lIHRhYmxlIHJldHVy
bmVkCnplcm8uCkZpeCBzZW50LgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
