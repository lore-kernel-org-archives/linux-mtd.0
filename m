Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A709C28CF5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 10:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utPpcVc2Kxie50nIIHzHId9t2Cpv7glePWlSevgM06c=; b=EVm6WA1Hksn9hJ
	um7LGQ5Z8/OigT8WxJdO96SZMbbdhcIGzKpyfuZnsVHVtoWfltgAzGt919KqnDRJn8dIIAlXjFem8
	pnMoGohlbjidnH/knVQCx0RxJ6av42nyMPauXU4apcQIDkS9IzoI0fd9fvJ+ATDD4p5+94QWFNw6Y
	B56h8lRS7gm0jaz9V09RmeUn5qTMVr6y6LiozLxpaVVU/fprrlRcpX8O3E8F5T4YYxNMfCU7O8/ga
	fRr/4/x/x6yhJ4VVmyPbKhz+EJ31j3xFo4yRl7JxLB1z8HDa+3suQWe3Ai+nVrKJtbkXX/AwNhk1f
	Kn+ZKLF3/12pyGBG7/hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCfLn-00BB5H-NH; Wed, 26 Jan 2022 10:16:27 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCfLk-00BB2R-45
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 10:16:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B4238100009;
 Wed, 26 Jan 2022 10:16:15 +0000 (UTC)
Date: Wed, 26 Jan 2022 11:16:13 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 jamipkettunen@somainline.org, Manivannan Sadhasivam <mani@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, mdalam@codeaurora.org,
 sricharan@codeaurora.org
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: Don't clear_bam_transaction
 on READID
Message-ID: <20220126111613.3ab0021e@xps13>
In-Reply-To: <20220114082718.32a2fc83@xps13>
References: <20220113184427.2259509-1-konrad.dybcio@somainline.org>
 <20220114082718.32a2fc83@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_021624_372727_3E3E5F68 
X-CRM114-Status: GOOD (  16.95  )
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

SGVsbG8sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIEZyaSwgMTQgSmFuIDIw
MjIgMDg6Mjc6MTggKzAxMDA6Cgo+IEhpIEtvbnJhZCwKPiAKPiBrb25yYWQuZHliY2lvQHNvbWFp
bmxpbmUub3JnIHdyb3RlIG9uIFRodSwgMTMgSmFuIDIwMjIgMTk6NDQ6MjYgKzAxMDA6Cj4gCj4g
PiBXaGlsZSBJIGhhdmUgYWJzb2x1dGVseSAwIGlkZWEgd2h5IGFuZCBob3csIHJ1bm5pbmcgY2xl
YXJfYmFtX3RyYW5zYWN0aW9uCj4gPiB3aGVuIFJFQURJRCBpcyBpc3N1ZWQgbWFrZXMgdGhlIERN
QSB0b3RhbGx5IGNsb2cgdXAgYW5kIHJlZnVzZSB0byBmdW5jdGlvbgo+ID4gYXQgYWxsIG9uIG1k
bTk2MDcuIEluIGZhY3QsIGl0IGlzIHNvIGJhZCB0aGF0IGFsbCB0aGUgZGF0YSBnZXRzIGdhcmJs
ZWQKPiA+IGFuZCBhZnRlciBhIHNob3J0IHdoaWxlIGluIHRoZSBuYW5kIHByb2JlIGZsb3csIHRo
ZSBDUFUgZGVjaWRlcyB0aGF0Cj4gPiBzZXB1a3UgaXMgdGhlIG9ubHkgb3B0aW9uLgo+ID4gCj4g
PiBSZW1vdmluZyBfUkVBRElEIGZyb20gdGhlIGlmIGNvbmRpdGlvbiBtYWtlcyBpdCB3b3JrIGxp
a2UgYSBjaGFybSwgSSBjYW4KPiA+IHJlYWQgZGF0YSBhbmQgbW91bnQgcGFydGl0aW9ucyB3aXRo
b3V0IGEgcHJvYmxlbS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogS29ucmFkIER5YmNpbyA8a29u
cmFkLmR5YmNpb0Bzb21haW5saW5lLm9yZz4KPiA+IC0tLQo+ID4gVGhpcyBpcyB0b3RhbGx5IGp1
c3QgYW4gb2JzZXJ2YXRpb24gd2hpY2ggdG9vayBtZSBhbiBpbmh1bWFuZSBhbW91bnQgb2YKPiA+
IGRlYnVnIHByaW50cyB0byBmaW5kLi4gcGVyaGFwcyB0aGVyZSdzIGEgYmV0dGVyIHJlYXNvbiBi
ZWhpbmQgdGhpcywgYnV0Cj4gPiBJIGNhbid0IHNlZW0gdG8gZmluZCBhbnkgYW5zd2Vycy4uIFRo
ZXJlZm9yZSwgdGhpcyBpcyBhIEJJRyBSRkMhICAKPiAKPiBJJ20gYWRkaW5nIHR3byBwZW9wbGUg
ZnJvbSBjb2RlYXVyb3JhIHdobyB3b3JrZWQgYSBsb3Qgb24gdGhpcyBkcml2ZXIuCj4gSG9wZWZ1
bGx5IHRoZXkgd2lsbCBoYXZlIGFuIGlkZWEgOikKClNhZHJlLCBJJ3ZlIHNwZW50IGEgc2lnbmlm
aWNhbnQgYW1vdW50IG9mIHRpbWUgcmV2aWV3aW5nIHlvdXIgcGF0Y2hlcywKbm93IGl0J3MgeW91
ciB0dXJuIHRvIG5vdCB0YWtlIGEgbW9udGggdG8gYW5zd2VyIHRvIHlvdXIgcGVlcnMKcHJvcG9z
YWxzLgoKUGxlYXNlIGhlbHAgcmV2aWV3aW5nIHRoaXMgcGF0Y2guCgpCVFcgd2h5IGlzIHRoaXMg
ZHJpdmVyIHN0aWxsIHVzaW5nIGNtZGZ1bmQ/IEl0IHNob3VsZCBoYXZlIGJlZW4KbWlncmF0ZWQg
dG8gLT5leGVjX29wKCkgYSBsb25nIHRpbWUgYWdvLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
