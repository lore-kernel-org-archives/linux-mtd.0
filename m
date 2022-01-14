Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27471C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jan 2022 18:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BL6ek1iG4JVV8EAZ83VWT39h9UlhWbmy3JS3ziZhrWc=; b=M6wnSoz2y/5+LG3Uo89v8gYtAL
	9PG9NfWk8HqTPv4XCc/H5id2pXtkZA5p/UgYAMwVZ6qk89XUFqK2FgX4uKauJGezazugANhi3Xf+E
	qhyQcQ6IeWGHKA16mDdsFGTR+eVEx/odhs4+7b0lkk7stkvzKZWIB0TFdjxHcjPgLgfwa/kn/k3t2
	JAlViV3y5hF3UNV9nfvGD3npBXMfzr+lTaAWwqBFVgRNel5is5KQxg00ljBfRykguV4LINWD8HVDS
	y6F1iu6qi9shdfF2U9TjmPYyWMyC3AjcTr3hJaiSLOib3fOfriocyK56a4spF7GHKltXVB0nNjUw1
	CLnaChsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Rdw-00A3pX-4T; Fri, 14 Jan 2022 18:49:44 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Rdt-00A3oK-82
 for linux-mtd@lists.infradead.org; Fri, 14 Jan 2022 18:49:42 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E7C0562DA5EE;
 Fri, 14 Jan 2022 19:49:39 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id gyHmBhNH5SKM; Fri, 14 Jan 2022 19:49:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6092962DA5F5;
 Fri, 14 Jan 2022 19:49:39 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zngB_d2P-Qv4; Fri, 14 Jan 2022 19:49:39 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3C28662DA5EE;
 Fri, 14 Jan 2022 19:49:39 +0100 (CET)
Date: Fri, 14 Jan 2022 19:49:39 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Rickard X Andersson <Rickard.Andersson@axis.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 Artem Bityutskiy <dedekind1@gmail.com>
Message-ID: <568190792.260787.1642186179042.JavaMail.zimbra@nod.at>
In-Reply-To: <d1e8b25b76df4e7aa428a411bceabdb3@axis.com>
References: <e90b59f8c1f842cca8a6db59239a9d67@XBOX02.axis.com>
 <0ce6e992f6f24238bcb599f84aef243d@axis.com>
 <1878699032.252529.1641986463352.JavaMail.zimbra@nod.at>
 <d1e8b25b76df4e7aa428a411bceabdb3@axis.com>
Subject: Re: SV: ubi2 error: scan_pool: unable to read EC header! PEB:569 err:1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF96 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubi2 error: scan_pool: unable to read EC header! PEB:569 err:1
Thread-Index: AQHYB6K16bkKIx7DMEiexDW+j9+B2F41rV6IqW3j1KyAFbYLSA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_104941_464699_22FD8E7A 
X-CRM114-Status: UNSURE (   7.37  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlJpY2thcmQgWCBBbmRlcnNz
b24iIDxSaWNrYXJkLkFuZGVyc3NvbkBheGlzLmNvbT4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJk
QG5vZC5hdD4KPiBDQzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3Jn
PiwgIkFydGVtIEJpdHl1dHNraXkiIDxkZWRla2luZDFAZ21haWwuY29tPgo+IEdlc2VuZGV0OiBN
aXR0d29jaCwgMTIuIEphbnVhciAyMDIyIDE3OjI1OjU3Cj4gQmV0cmVmZjogU1Y6IHViaTIgZXJy
b3I6IHNjYW5fcG9vbDogdW5hYmxlIHRvIHJlYWQgRUMgaGVhZGVyISBQRUI6NTY5IGVycjoxCgo+
IFRoYW5rcyBmb3IgdGhlIHF1aWNrIGFuc3dlciEKPiAKPiBUb28gbWUgaXQgbG9va3MgbGlrZSBm
YXN0bWFwIGlzIGhhcHB5IGFuZCBldmVyeXRoaW5nIGlzIHdvcmtpbmcgd2VsbCwgc2VlIGxvZwo+
IGJlbG93Lgo+IAo+IDwzPlsgICAgOC4wMTc3MjBdWyAgVDMwNl0gdWJpMiBlcnJvcjogc2Nhbl9w
b29sOiB1bmFibGUgdG8gcmVhZCBFQyBoZWFkZXIhCj4gUEVCOjU2OSBlcnI6MQo+IDwzPlsgICAg
OC4wMTc5MDBdWyAgVDMwNl0gdWJpMiBlcnJvcjogdWJpX3NjYW5fZmFzdG1hcDogQXR0YWNoIGJ5
IGZhc3RtYXAKPiBmYWlsZWQsIGRvaW5nIGEgZnVsbCBzY2FuIQo+IDw1PlsgICAxMC40NTY2MDFd
WyAgVDMwNl0gdWJpMjogc2Nhbm5pbmcgaXMgZmluaXNoZWQKPiA8NT5bICAgMTAuNDc3ODE5XVsg
IFQzMDZdIHViaTI6IGF0dGFjaGVkIG10ZDUgKG5hbWUgImRhdGEiLCBzaXplIDUxMiBNaUIpCj4g
PDU+WyAgIDEwLjQ3Nzk4MF1bICBUMzA2XSB1YmkyOiBQRUIgc2l6ZTogMTMxMDcyIGJ5dGVzICgx
MjggS2lCKSwgTEVCIHNpemU6Cj4gMTI2OTc2IGJ5dGVzCj4gPDU+WyAgIDEwLjQ3ODA2NF1bICBU
MzA2XSB1YmkyOiBtaW4uL21heC4gSS9PIHVuaXQgc2l6ZXM6IDIwNDgvMjA0OCwgc3ViLXBhZ2UK
PiBzaXplIDIwNDgKPiA8NT5bICAgMTAuNDc4MTQ3XVsgIFQzMDZdIHViaTI6IFZJRCBoZWFkZXIg
b2Zmc2V0OiAyMDQ4IChhbGlnbmVkIDIwNDgpLCBkYXRhCj4gb2Zmc2V0OiA0MDk2Cj4gPDU+WyAg
IDEwLjQ3ODI5Ml1bICBUMzA2XSB1YmkyOiBnb29kIFBFQnM6IDQwOTIsIGJhZCBQRUJzOiA0LCBj
b3JydXB0ZWQgUEVCczogMAo+IDw1PlsgICAxMC40NzgzNzZdWyAgVDMwNl0gdWJpMjogdXNlciB2
b2x1bWU6IDEsIGludGVybmFsIHZvbHVtZXM6IDEsIG1heC4KPiB2b2x1bWVzIGNvdW50OiAxMjgK
PiA8NT5bICAgMTAuNDc4NTI0XVsgIFQzMDZdIHViaTI6IG1heC9tZWFuIGVyYXNlIGNvdW50ZXI6
IDk2NjYvNzQwLCBXTCB0aHJlc2hvbGQ6Cj4gNDA5NiwgaW1hZ2Ugc2VxdWVuY2UgbnVtYmVyOiA1
ODE5NTc0NDMKPiA8NT5bICAgMTAuNDc4NjY4XVsgIFQzMDZdIHViaTI6IGF2YWlsYWJsZSBQRUJz
OiAwLCB0b3RhbCByZXNlcnZlZCBQRUJzOiA0MDkyLAo+IFBFQnMgcmVzZXJ2ZWQgZm9yIGJhZCBQ
RUIgaGFuZGxpbmc6IDc2Cj4gPDU+WyAgIDEwLjQ3ODgyNV1bICBUMzM3XSB1YmkyOiBiYWNrZ3Jv
dW5kIHRocmVhZCAidWJpX2JndDJkIiBzdGFydGVkLCBQSUQgMzM3Cj4gPDU+WyAgIDEwLjQ4MjIx
Ml1bICAgVDE2XSB1YmkyOiBTdGFydGluZyB1YmlfdXBkYXRlX2Zhc3RtYXAKPiA8NT5bICAgMTAu
NTIyMzAwXVsgICBUMTZdIHViaTI6IEZpbmlzaGVkIHViaV91cGRhdGVfZmFzdG1hcAo+IAo+IEkg
ZG8gbm90IHRoaW5rIHRoZSBpbnRlcnJ1cHRpb24gd2FzIGJ5IGEgcG93ZXItY3V0LCBidXQgSSBh
bSBub3Qgc3VyZS4gRG8geW91Cj4gdGhpbmsgdGhlIGludGVycnVwdGlvbiBjb3VsZCBiZSBjYXVz
ZWQgYnkgYSBsaW51eCByZWJvb3QgdXNpbmcgdGhlCj4gcmVib290L3Jlc3RhcnQgY29tbWFuZD8K
CklmIHlvdSBpbnRlcnJ1cHQgVUJJIGJ5IHNvZnR3YXJlLCB5b3UgY2FuIGZhY2UgdGhlIHNhbWUg
c2l0dWF0aW9uIHRvby4KSSBndWVzcyB5b3UgZG9uJ3QgcnVuIHViaWRldGFjaCB1cG9uIHJlYm9v
dD8KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
