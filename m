Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D85C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 12:47:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59ED6610E5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 12:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59ED6610E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcUJk92AlSc6rBKqq0VoK5sBwBCMBkXyT5sp0pG8A1s=; b=CGSqo/jUrc02//
	opE7WCdVjK/XzTWfziGHZzbDhKAAGVOqvIdJuQMyH6mIBM/qwFhBFU/tWR9XbLu/rMINTKsbOfryb
	uxVTFdWwCS02/0byy/NvEhRyfIeyzaLHtMLBVvvL7O2SvL17q2Shto+00rhJRQAcRPpoo7maseRJm
	6v6JlDkiiu0NZ0889rFMPsgNxwgatFqc+GDo4oAj7lFrlimQyw0CI8e9Me/QbEiQC05EHHmVf90jD
	e6Lj7QA+5TlXc79VenK9A/FRbqt/asxlWLypexjlIOPD1xocDhMlucyZS8QR7/BNfounPSvWOGtqk
	Zf/NN3P3BoaMF+9Nk7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVCVa-007Cy6-Ai; Tue, 28 Sep 2021 12:46:54 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVCVW-007Cwb-2x
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 12:46:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6F135FF806;
 Tue, 28 Sep 2021 12:46:46 +0000 (UTC)
Date: Tue, 28 Sep 2021 14:46:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: mdalam@codeaurora.org
Cc: mani@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org
Subject: Re: [PATCH 1/3] mtd: rawnand: qcom: Add support for status pipe
Message-ID: <20210928144645.40209af0@xps13>
In-Reply-To: <97df48e5505c4e6ae3bc6b7e953c156c@codeaurora.org>
References: <1631699851-12172-1-git-send-email-mdalam@codeaurora.org>
 <1631699851-12172-2-git-send-email-mdalam@codeaurora.org>
 <97df48e5505c4e6ae3bc6b7e953c156c@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_054650_310333_AEBBB94D 
X-CRM114-Status: GOOD (  22.22  )
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

SGVsbG8sCgptZGFsYW1AY29kZWF1cm9yYS5vcmcgd3JvdGUgb24gVHVlLCAyOCBTZXAgMjAyMSAx
Nzo0NzoyNyArMDUzMDoKCj4gT24gMjAyMS0wOS0xNSAxNToyNywgTWQgU2FkcmUgQWxhbSB3cm90
ZToKPiA+IEZyb20gUVBJQyBWMi4wIG9ud2FyZHMgdGhlcmUgaXMgYSBzZXBhcmF0ZSBwaXBlCj4g
PiB0byByZWFkIHN0YXR1cyBvZiBlYWNoIGNvZGUgd29yZCwgY2FsbGVkICJzdGF0dXMiIHBpcGUu
Cj4gPiAKPiA+ICJzdGF0dXMiIHBpcGUgd2lsbCB1c2UgdG8gcmVhZCBDVyBzdGF0dXMgaW4gY2Fz
ZSBvZgoKV2hhdCBpcyBhIENXIHN0YXR1cz8KCj4gPiBlbmhhbmNlZCByZWFkIG1vZGUgbGlrZSBw
YWdlIHNjb3BlIHJlYWQsIG11bHRpIHBhZ2UgcmVhZC4KCldoYXQgaXMgYSBwYWdlIHNjb3BlIHJl
YWQ/Cgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1
cm9yYS5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMg
fCAxNCArKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCsp
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMK
PiA+IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gPiBpbmRleCAwNGU2Zjdi
Li40MmM2MjkxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5k
Yy5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiA+IEBAIC0z
ODksNiArMzg5LDcgQEAgc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyIHsKPiA+ICAJCQlzdHJ1
Y3QgZG1hX2NoYW4gKnR4X2NoYW47Cj4gPiAgCQkJc3RydWN0IGRtYV9jaGFuICpyeF9jaGFuOwo+
ID4gIAkJCXN0cnVjdCBkbWFfY2hhbiAqY21kX2NoYW47Cj4gPiArCQkJc3RydWN0IGRtYV9jaGFu
ICpzdHNfY2hhbjsKPiA+ICAJCX07Cj4gPiAKPiA+ICAJCS8qIHdpbGwgYmUgdXNlZCBvbmx5IGJ5
IEVCSTIgZm9yIEFETSBETUEgKi8KPiA+IEBAIC0yNzM3LDYgKzI3MzgsMTEgQEAgc3RhdGljIHZv
aWQgcWNvbV9uYW5kY191bmFsbG9jKHN0cnVjdAo+ID4gcWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5h
bmRjKQo+ID4gCj4gPiAgCQlpZiAobmFuZGMtPmNtZF9jaGFuKQo+ID4gIAkJCWRtYV9yZWxlYXNl
X2NoYW5uZWwobmFuZGMtPmNtZF9jaGFuKTsKPiA+ICsKPiA+ICsJCWlmIChuYW5kYy0+cHJvcHMt
PnFwaWNfdjIpIHsKPiA+ICsJCQlpZiAobmFuZGMtPnN0c19jaGFuKQo+ID4gKwkJCQlkbWFfcmVs
ZWFzZV9jaGFubmVsKG5hbmRjLT5zdHNfY2hhbik7Cj4gPiArCQl9Cj4gPiAgCX0gZWxzZSB7Cj4g
PiAgCQlpZiAobmFuZGMtPmNoYW4pCj4gPiAgCQkJZG1hX3JlbGVhc2VfY2hhbm5lbChuYW5kYy0+
Y2hhbik7Cj4gPiBAQCAtMjgxNSw2ICsyODIxLDE0IEBAIHN0YXRpYyBpbnQgcWNvbV9uYW5kY19h
bGxvYyhzdHJ1Y3QKPiA+IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5kYykKPiA+ICAJCQlnb3Rv
IHVuYWxsb2M7Cj4gPiAgCQl9Cj4gPiAKPiA+ICsJCWlmIChuYW5kYy0+cHJvcHMtPnFwaWNfdjIp
IHsKPiA+ICsJCQluYW5kYy0+c3RzX2NoYW4gPSBkbWFfcmVxdWVzdF9zbGF2ZV9jaGFubmVsKG5h
bmRjLT5kZXYsICJzdHMiKTsKPiA+ICsJCQlpZiAoIW5hbmRjLT5zdHNfY2hhbikgewo+ID4gKwkJ
CQlkZXZfZXJyKG5hbmRjLT5kZXYsICJmYWlsZWQgdG8gcmVxdWVzdCBzdHMgY2hhbm5lbFxuIik7
Cj4gPiArCQkJCXJldHVybiAtRU5PREVWOwo+ID4gKwkJCX0KPiA+ICsJCX0KPiA+ICsKPiA+ICAJ
CS8qCj4gPiAgCQkgKiBJbml0aWFsbHkgYWxsb2NhdGUgQkFNIHRyYW5zYWN0aW9uIHRvIHJlYWQg
T05GSSBwYXJhbSBwYWdlLgo+ID4gIAkJICogQWZ0ZXIgZGV0ZWN0aW5nIGFsbCB0aGUgZGV2aWNl
cywgdGhpcyBCQU0gdHJhbnNhY3Rpb24gd2lsbCAgCj4gCj4gUGluZyEgUGxlYXNlIHByb3ZpZGUg
bWUgc29tZSB1cGRhdGVzIG9uIHRoaXMgcGF0Y2guCgpJIGRvbid0IHRoaW5rIHlvdSBuZWVkIHRv
IHBpbmcgbWUgb24gYWxsIHlvdXIgcGF0Y2hlcy4gVGhpcyBpcwppcnJpdGF0aW5nIGdpdmVuIHRo
ZSB0aW1lIHRoYXQgSSBhbGxvY2F0ZWQgdG8gYWxsIHlvdXIgY29udHJpYnV0aW9ucyBzbwpmYXIu
CgpUaGlzIGJlaW5nIHNhaWQsIEkgaGFkIG5vIHBhcnRpY3VsYXIgY29tbWVudCByZWdhcmRpbmcg
dGhlCmltcGxlbWVudGF0aW9uIG9mIHRoZSBzZXJpZXMgYnV0IGdpdmluZyBpdCBhIHNlY29uZCBs
b29rIEkgc3RpbGwgZG9uJ3QKZnVsbHkgdW5kZXJzdGFuZCB0aGUgZ29hbCBvZiB0aGlzICJhZGRp
dGlvbmFsIHBpcGUiIHNvLCBhcyBteSBjb21tZW50cwphYm92ZSBzYXksIHBsZWFzZSBlbGFib3Jh
dGUgYSBsaXR0bGUgYml0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
