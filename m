Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2331C87FD2
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 12:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ANjaYdTt3ntLN3SHMG/E7xot79tMUmRn3ZX95Z7KAlE=; b=elFncswpd1dL1osLLF4K9LSz28
	tFCFQkP1nKA3O5vM59q8pvgVQ12K99rbwjl/O4FXHc02ccvGH111b81YFas2RAWGcHxFssyojNms4
	vf9xn5QKDHA91XP9G6CDxKldEro1nE7HAIA+Po0+CwvOvXqAdZZWqxOBiUocRfysJg0qvhSse3Pts
	XL3uGiWjXwdnK37EE3ciZGbW56mYjxeGyuyxdA8JOBSfVV6aABvxANMPNug7msAfv07OwBVSODhJR
	caeV9G5dc/9WHcE9lNExvBFlXCMXFGiXhP781oi7c52269ZfS22kR5qaYN0rdQRpb/w/IPEFGl5Tg
	7R9NTdig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRvS-00000007iDN-0rOZ;
	Mon, 11 Aug 2025 12:46:54 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRv7-00000007i9H-0gTx
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 12:46:34 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6754F2CFCA2;
	Mon, 11 Aug 2025 14:46:30 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id zZlOK5j1gnYO; Mon, 11 Aug 2025 14:46:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 59B212CFCAD;
	Mon, 11 Aug 2025 14:46:29 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YszAZL2IXWFc; Mon, 11 Aug 2025 14:46:29 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3896A2CFCA2;
	Mon, 11 Aug 2025 14:46:29 +0200 (CEST)
Date: Mon, 11 Aug 2025 14:46:29 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miguel =?utf-8?Q?Garc=C3=ADa?= <miguelgarciaroman8@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <1786903963.99788.1754916389068.JavaMail.zimbra@nod.at>
In-Reply-To: <20250811120912.144720-1-miguelgarciaroman8@gmail.com>
References: <20250811120912.144720-1-miguelgarciaroman8@gmail.com>
Subject: Re: [PATCH] mtd: ubi: replace strcpy with strscpy in mtd parameter
 parser
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF141 (Linux)/8.8.12_GA_3809)
Thread-Topic: replace strcpy with strscpy in mtd parameter parser
Thread-Index: coMJNePqoBbE5DTFLz9HlnrmJEa8+A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_054633_341671_1081ECFA 
X-CRM114-Status: UNSURE (   6.40  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pZ3VlbCBHYXJjw61hIiA8
bWlndWVsZ2FyY2lhcm9tYW44QGdtYWlsLmNvbT4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5v
ZC5hdD4sICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sICJWaWdu
ZXNoIFJhZ2hhdmVuZHJhIiA8dmlnbmVzaHJAdGkuY29tPgo+IENDOiAiY2hlbmd6aGloYW8xIiA8
Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmlu
ZnJhZGVhZC5vcmc+LCAibGludXgta2VybmVsIgo+IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnPiwgIlNodWFoIEtoYW4iIDxza2hhbkBsaW51eGZvdW5kYXRpb24ub3JnPiwgIk1pZ3VlbCBH
YXJjw61hIgo+IDxtaWd1ZWxnYXJjaWFyb21hbjhAZ21haWwuY29tPgo+IEdlc2VuZGV0OiBNb250
YWcsIDExLiBBdWd1c3QgMjAyNSAxNDowOToxMgo+IEJldHJlZmY6IFtQQVRDSF0gbXRkOiB1Ymk6
IHJlcGxhY2Ugc3RyY3B5IHdpdGggc3Ryc2NweSBpbiBtdGQgcGFyYW1ldGVyIHBhcnNlcgoKPiBS
ZXBsYWNlIHRoZSBzdHJjcHkoKSBjYWxscyB1c2VkIHRvIGNvcHkgdGhlICdtdGQ9JyBwYXJhbWV0
ZXIgaW50byBsb2NhbAo+IGJ1ZmZlcnMgd2l0aCBzdHJzY3B5KCkgdG8gYXZvaWQgcG90ZW50aWFs
IG92ZXJmbG93IGFuZCBndWFyYW50ZWUgTlVMCj4gdGVybWluYXRpb24uIERlc3RpbmF0aW9ucyBh
cmUgZml4ZWQtc2l6ZSBhcnJheXMgKGJ1ZiBhbmQgcC0+bmFtZSksIHNvCj4gdXNlIHNpemVvZigp
Lgo+IAo+IFdoaWxlIHRoaXMgY29kZSBpcyBjdXJyZW50bHkgc2FmZSBkdWUgdG8gcHJpb3IgbGVu
Z3RoIGNoZWNrcwo+IChzdHJubGVuKHZhbCwgTVREX1BBUkFNX0xFTl9NQVgpIGFuZCBlYXJseSBy
ZXR1cm4gb24gb3ZlcmZsb3cpLAo+IHJlcGxhY2luZyBzdHJjcHkoKSB3aXRoIHN0cnNjcHkoKSBm
b2xsb3dzIGN1cnJlbnQga2VybmVsIGJlc3QgcHJhY3RpY2VzCj4gYW5kIG1ha2VzIHRoZSBjb2Rl
IG1vcmUgcm9idXN0IHRvIGZ1dHVyZSBjaGFuZ2VzLiBUaGUgc2l6ZW9mKCkgY2FsbHMKPiBjb3Jy
ZWN0bHkgY29tcHV0ZSB0aGUgYnVmZmVyIHNpemVzLCBtYXRjaGluZyBNVERfUEFSQU1fTEVOX01B
WC4KClRCSCwgSSdtIG5vdCBjb252aW5jZWQuIFdlJ3JlIHRhbGtpbmcgYWJvdXQga2VybmVsIG1v
ZHVsZSBwYXJhbWV0ZXJzLApub3QgaG9zdGlsZSB1c2VyIGlucHV0LCBldGMuLi4KCkJ5IGFkZGlu
ZyBzaXplb2YoKSB5b3UncmUgcmVwbGFjaW5nIG9uZSBmb29kZ3VuIHdpdGggYW5vdGhlciBvbmUu
CklmIGJ1ZiBpcyBpbiBmdXR1cmUgY2hhbmdlZCB0byBhIHBvaW50ZXIsIHNpemVvZihidWYpIG5l
ZWRzIGEgZml4dXAgdG9vLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
