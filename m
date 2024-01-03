Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE8DC3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jan 2024 13:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pe9fzNrgy3ArX7wGtBIWcWOLvj8DUUZtYdrFf+vHZbw=; b=K2TKcT1smqhUiQWsy1aCelbeCk
	q9/gO18W0GtRoz1FHtCjb15rHOD9nO6lYyL+UWNLZXW5LJD753EcGs+1+kLSYzQydatcR9YuhU391
	3nLdQkkCx9GioOvzfFKHY6/0oyOqtob5d/fKU2Mpt7RVs6lDB4P8YTzClqOsBEtCUtBoBbO+qkTSv
	viYhJC9U9LqN3jCGVAs+CAmfAv8pb6vELDVKSkj7ilSMi5W72zXFFpkg1z2Fz31nxbZ0e7EfsNlQJ
	bH43YG6O1oX+EOr6eGXFDk+EB0zPmCPLwiuz0iQwiQaWUqjoMsl8mYpX5WKek0at1eUU6TmupZkLi
	6ZKUoTPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1Mo-00AyBg-0x;
	Wed, 03 Jan 2024 13:33:06 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1Ml-00AyAJ-1k
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jan 2024 13:33:04 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0BD30626FAF6;
	Wed,  3 Jan 2024 14:33:02 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 6YkfTO33uBbK; Wed,  3 Jan 2024 14:33:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 409A5626FB0F;
	Wed,  3 Jan 2024 14:33:01 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 07_AODx7p-p6; Wed,  3 Jan 2024 14:33:01 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1DDD6626FAF6;
	Wed,  3 Jan 2024 14:33:01 +0100 (CET)
Date: Wed, 3 Jan 2024 14:33:00 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: david oberhollenzer <david.oberhollenzer@sigma-star.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	Tudor Ambarus <Tudor.Ambarus@linaro.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <391060208.195010.1704288780905.JavaMail.zimbra@nod.at>
In-Reply-To: <460eb02e-8937-282c-62c5-6ea606324b0e@huawei.com>
References: <20231228014112.2836317-1-chengzhihao1@huawei.com> <1145531757.175508.1703844362355.JavaMail.zimbra@nod.at> <13b259ca-b32f-a8d6-5e11-8bb38df72f5c@huawei.com> <642239519.177270.1703884138999.JavaMail.zimbra@nod.at> <a145fc68-9b0a-9794-48d2-b7ad79116833@huawei.com> <535616666.192239.1704228332389.JavaMail.zimbra@nod.at> <460eb02e-8937-282c-62c5-6ea606324b0e@huawei.com>
Subject: Re: [PATCH RFC 00/17] ubifs: Add filesystem repair support
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Add filesystem repair support
Thread-Index: DNjwXo0bUvQvI/5CY/TMFyMnZ1D/4Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_053303_729406_3941E386 
X-CRM114-Status: UNSURE (   3.43  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+PiAyLiBKb3VybmFsIHJlcGxheSBpcyBhbHNvIG5lZWRl
ZCBhZnRlciBhIGNsZWFuIHVtb3VudC4gVGhlIHJlYXNvbiBpcyB0aGF0Cj4+IFVCSUZTIGRvZXMg
bm8gY29tbWl0IGF0IHVtb3VudCB0aW1lLgo+IAo+IEkgYWdyZWUsIHRoZXJlIGV4aXN0cyBvbmUg
c2l0dWF0aW9uIHRoYXQgVUJJRlMgcmVwbGF5cyBqb3VybmFsIGV2ZW4KPiBhZnRlciBjbGVhbiB1
bW91bnQuCj4gICAgIFAxICAgICAgdWJpZnNfYmd0ICAgICAgdW1vdW50Cj4gICBta2Rpcgo+ICAg
ICAgICAgIHJ1bl9iZ19jb21taXQKPiAgICAgICAgICAgYy0+Y210X3N0YXRlID0gQ09NTUlUX1JV
Tk5JTkdfQkFDS0dST1VORAo+ICAgICAgICAgICBkb19jb21taXQKPiAgICAgICAgICAgIHViaWZz
X2xvZ19zdGFydF9jb21taXQoYywgJm5ld19sdGFpbF9sbnVtKSAvLyBsb2cgc3RhcnQKPiAgICAg
ICAgICAgIHVwX3dyaXRlKCZjLT5jb21taXRfc2VtKQo+ICAgdG91Y2gKPiAgICB1Ymlmc19qbmxf
dXBkYXRlIC8vIG5ldyBidWRzIGFkZGVkCj4gICAgICAgICAgICAgICAgICAgICAgICAgIGNsZWFu
dXBfbW50Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICBkZWFjdGl2YXRlX3N1cGVyCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZnMtPmtpbGxfc2IKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZ2VuZXJpY19zaHV0ZG93bl9zdXBlcgo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3luY19maWxlc3lzdGVtCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWJp
ZnNfc3luY19mcwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1Ymlmc19ydW5fY29t
bWl0Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB3YWl0X2Zvcl9jb21taXQgLy8g
d2FpdCBiZyBjb21taXQsCj4gJ3RvdWNoJyB3b24ndCBiZSBjb21taXRlZCwgaXQgd2lsbCBiZSBy
ZXBsYXllZCBpbiBuZXh0IG1vdW50CgpCVFc6IEkgd2FzIGltcHJlY2lzZSwgc29ycnkgZm9yIHRo
YXQuClRoZSBpc3N1ZSBpcyB0aGF0IGV2ZW4gYWZ0ZXIgYSBjb21taXQgeW91IG5lZWQgdG8gcmVw
bGF5IHRoZSBqb3VybmFsLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
