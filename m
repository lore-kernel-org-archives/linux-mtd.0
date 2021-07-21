Return-Path: <SRS0=aH78=MN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BF8C6377A
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jul 2021 21:04:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8E7761263
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jul 2021 21:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8E7761263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LT7fWJ+b1oeWqkh4PRyjydy/knsEwKD0fUqV2W/6yBY=; b=mYYBhN6XLhiQpW/iD3Co6NpEoc
	0N4Y/JuZhnhJsa45chWOxWUei7DOTluuOKQ4u0pEidLvG/82eO3B7Uw1zAZGCKNdwPMSIlNXRpwYO
	4II6/K8mMASmBZFDuu3Vsmm6OscIGb1L0y/DSYJZQfvIEs7LUvF22L0eXXuXgMQjEj8KAMI/xuAfm
	faEwNdWFdg7+aadfXW9k+I6/adEyOBc0GHtn1HevuacGgDOEwKLkn7ieg/Nh4XwGQEwKRr4vx97T8
	3CzdVVo3M1HTUJR30R5r6TX2WWnkF+x74XS5IFtiUIrUNyJOC7kuxkNIyT9uUZzPrbfgssYnicsYZ
	QlNOlvxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6JKy-00HEpt-QQ; Wed, 21 Jul 2021 21:01:04 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6JEm-00HBuN-9y
 for linux-mtd@lists.infradead.org; Wed, 21 Jul 2021 20:54:43 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4FA38606BA4F;
 Wed, 21 Jul 2021 22:54:29 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id OeNpA8TbCsvM; Wed, 21 Jul 2021 22:54:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 88A0960A59D3;
 Wed, 21 Jul 2021 22:54:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JgBGLF30wa6X; Wed, 21 Jul 2021 22:54:28 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 55876606BA4F;
 Wed, 21 Jul 2021 22:54:28 +0200 (CEST)
Date: Wed, 21 Jul 2021 22:54:28 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
 Phillip Lougher <phillip@squashfs.org.uk>, 
 Sean Nyekjaer <sean@geanix.com>, 
 Kernelnewbies <kernelnewbies@kernelnewbies.org>
Message-ID: <2132615832.4458.1626900868118.JavaMail.zimbra@nod.at>
In-Reply-To: <CAOuPNLhti3tocN-_D7Q0QaAx5acHpb3AQyWaUKgQPNW3XWu58g@mail.gmail.com>
References: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
 <YPGojf7hX//Wn5su@kroah.com>
 <568938486.33366.1626452816917.JavaMail.zimbra@nod.at>
 <CAOuPNLj1YC7gjuhyvunqnB_4JveGRyHcL9hcqKFSNKmfxVSWRA@mail.gmail.com>
 <1458549943.44607.1626686894648.JavaMail.zimbra@nod.at>
 <CAOuPNLh_KY4NaVWSEV2JPp8fx0iy8E1MU8GHT-w7-hMXrvSaeA@mail.gmail.com>
 <1556211076.48404.1626763215205.JavaMail.zimbra@nod.at>
 <CAOuPNLhti3tocN-_D7Q0QaAx5acHpb3AQyWaUKgQPNW3XWu58g@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF90 (Linux)/8.8.12_GA_3809)
Thread-Topic: How to get actual image size from MTD partition
Thread-Index: BowgerheV9p1zguM4N2pUdD/cVsfMg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_135440_582986_51EDEE01 
X-CRM114-Status: GOOD (  15.73  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBCdXQgbGV0IG1lIGFkdmVydGlzZSB1
YmlibG9jayBhIHNlY29uZCB0aW1lLgo+IFNvcnJ5LCBJIGNvdWxkIG5vdCB1bmRlcnN0YW5kIGFi
b3V0IHRoZSB1YmlibG9jayByZXF1ZXN0LiBJcyBpdAo+IHBvc3NpYmxlIHRvIGVsYWJvcmF0ZSBs
aXR0bGUgbW9yZSA/Cj4gV2UgYXJlIGFscmVhZHkgdXNpbmcgc3F1YXNoZnMgb24gdG9wIG9mIG91
ciBVQkkgdm9sdW1lcyAoaW5jbHVkaW5nCj4gcm9vdGZzIG1vdW50aW5nKS4KPiBUaGlzIGlzIHRo
ZSBrZXJuZWwgY29tbWFuZCBsaW5lIHdlIHBhc3M6Cj4gcm9vdGZzdHlwZT1zcXVhc2hmcyByb290
PS9kZXYvbXRkYmxvY2s0NCB1YmkubXRkPTQwLDAsMzAKPiBBbmQgQ09ORklHX01URF9VQklfQkxP
Q0s9eSBpcyBhbHJlYWR5IGVuYWJsZWQgaW4gb3VyIGtlcm5lbC4KPiBEbyB3ZSBuZWVkIHRvIGRv
IHNvbWV0aGluZyBkaWZmZXJlbnQgZm9yIHViaWJsb2NrID8KCkZyb20gdGhhdCBjb21tYW5kIGxp
bmUgSSB1bmRlcnN0YW5kIHRoYXQgeW91IGFyZSAqbm90KiB1c2luZyBzcXVhc2hmcyBvbiB0b3Ag
b2YgVUJJLgpZb3UgdXNlIG10ZGJsb2NrLiB1YmlibG9jayBpcyBhIG1lY2hhbmlzbSB0byB0dXJu
IGFuIFVCSSB2b2x1bWUgaW50byBhIHJlYWQtb25seQpibG9jayBkZXZpY2UuClNlZTogaHR0cDov
L3d3dy5saW51eC1tdGQuaW5mcmFkZWFkLm9yZy9kb2MvdWJpLmh0bWwjTF91YmlibG9jawoKPj4g
SWYgeW91IHBsYWNlIHlvdXIgc3F1YXNoZnMgb24gYSBVQkkgc3RhdGljIHZvbHVtZSwgVUJJIGtu
b3dzIHRoZSBleGFjdCBsZW5ndGgKPj4gYW5kIHlvdSBjYW4gY2hlY2tzdW0gaXQKPj4gbW9yZSBl
YXNpbHkuCj4gWWVzLCB3ZSB1c2Ugc3F1YXNoZnMgb24gVUJJIHZvbHVtZXMsIGJ1dCBvdXIgdm9s
dW1lIHR5cGUgaXMgc3RpbGwgZHluYW1pYy4KPiBBbHNvLCB5b3Ugc2FpZCwgVUJJIGtub3dzIHRo
ZSBleGFjdCBsZW5ndGgsIHlvdSBtZWFuIHRoZSB3aG9sZSBpbWFnZSBsZW5ndGggPwo+IEhvdyBj
YW4gd2UgZ2V0IHRoaXMgbGVuZ3RoIGF0IHJ1bnRpbWUgPwoKWW91IG5lZWQgYSBzdGF0aWMgdm9s
dW1lIGZvciB0aGF0LiBJZiB5b3UgdXBkYXRlIGEgc3RhdGljIHZvbHVtZSB0aGUgbGVuZ3RoIGlz
Cmtub3duIGJ5IFVCSS4KCj4gQWxzbywgaG93IGNhbiB3ZSBnZXQgdGhlIGNoZWNrc3VtIG9mIHRo
ZSBlbnRpcmUgVUJJIHZvbHVtZSBjb250ZW50Cj4gKGlnbm9yaW5nIHRoZSBlcmFzZWQvZW1wdHkv
YmFkIGJsb2NrIGNvbnRlbnQpID8KCkp1c3QgcmVhZCBmcm9tIHRoZSB2b2x1bWUuIC9kZXYvdWJp
WF9ZLgoKPiBPciwgeW91IG1lYW4gdG8gc2F5LCB0aGUgd2hvbGUgY2hlY2tzdW0gbG9naWMgaXMg
aW4tYnVpbHQgaW5zaWRlIHRoZQo+IFVCSSBsYXllciBhbmQgdXNlcnMgZG9uJ3QgbmVlZCB0byB3
b3JyeSBhYm91dCB0aGUgaW50ZWdyaXR5IGF0IGFsbCA/CgpTdGF0aWMgdm9sdW1lcyBoYXZlIGEg
Y3JjMzIgY2hlY2tzdW0gb3ZlciB0aGUgd2hvbGUgY29udGVudC4KT2YgY291cnNlIHRoaXMgb2Zm
ZXJzIG5vIGNyeXB0b2dyYXBoaWMgaW50ZWdyaXR5LgpTZWU6IGh0dHA6Ly93d3cubGludXgtbXRk
LmluZnJhZGVhZC5vcmcvZG9jL3ViaS5odG1sI0xfb3ZlcnZpZXcKClRoYW5rcywKLy9yaWNoYXJk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
