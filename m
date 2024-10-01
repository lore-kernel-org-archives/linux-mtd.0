Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C62CE7D08
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2024 10:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1S1ux17pluY5iXczbAvHz6Jtyicb9bpjOldqdrXSqk=; b=BfX5FcDb0gSyrr
	eRsEA+dHPu7bSrRdnJpyiCGfyxfaaDe8OW5qfOsppkxEHXAxgpVbBjTN+ecBjVT2iHftY5uix2WV5
	GiM3CY9Q8+4itp5/PQ2NBpoRKiwXEH0MQduzykp2ELKGfo1J3WzbCBWEhcRcsNJKPQVFRAVox7z/Y
	EYCLe8PObbZvkFsrCjBMsbFX+CnkOQWFiRy/ub0Kqry1CwoYlzeYsqJvXr5gcroY7149VzQHslcYa
	E51EQehamGjKKdd5uHi8mxtrVsTD3T8TYqKVNz5tsl/Od8je2oXFX8OIy6RPs3+LafNQVvY6roorA
	OVtuk1G3trMbsUnh9dEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svZzT-00000002KZG-3uOX;
	Tue, 01 Oct 2024 10:20:23 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svZyF-00000002KTN-2b5n;
	Tue, 01 Oct 2024 10:19:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57832FF803;
	Tue,  1 Oct 2024 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727777944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HPwBsKHTzNqKl3xXxwOeQfCYPFQuF1OTpHnTxmYblNw=;
	b=E8/tjlw2LfRzY0mrYfErjL/eKDRXvh2EY8fyERksqfy4dWPFSkzANqStYOVS/k7UIE1wSh
	6qlAkv7pKpwNUw6rRjW21ETi4qWpEmWpWz135W2xs8PCFmN3JLYvvkKLwLrnD5QYjArKy8
	Q4qjHZtQN7otXlM7D6K7sycDL7Tem0TQvCMwgTCpREhnTVR6x06i4OYobozUh83tLHXq1n
	P3/SmA/VjMQYpSU397m24rqNbHD7VLld5o6WVf7k0MvjQg2n14k3cXgEMG4T+UERIoq6+i
	eFgpJDidnqBCc2O4DPvqEhtatq0fR84z0Qc2Nw9pZHxta0KE1uZQS7pehDG+nQ==
Date: Tue, 1 Oct 2024 12:19:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nikita.shubin@maquefel.me, arnd@arndb.de,
 vkoul@kernel.org, esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new
 bindings
Message-ID: <20241001121902.658d3977@xps-13>
In-Reply-To: <20240927020749.46791-2-hpchen0nvt@gmail.com>
References: <20240927020749.46791-1-hpchen0nvt@gmail.com>
	<20240927020749.46791-2-hpchen0nvt@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_031907_963591_2CBE6192 
X-CRM114-Status: GOOD (  13.20  )
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

SGkgSHVpLVBpbmcsCgpocGNoZW4wbnZ0QGdtYWlsLmNvbSB3cm90ZSBvbiBGcmksIDI3IFNlcCAy
MDI0IDAyOjA3OjQ4ICswMDAwOgoKPiBBZGQgZHQtYmluZGluZ3MgZm9yIHRoZSBOdXZvdG9uIE1B
MzUgU29DIE5BTkQgQ29udHJvbGxlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIdWktUGluZyBDaGVu
IDxocGNoZW4wbnZ0QGdtYWlsLmNvbT4KPiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+IC0tLQo+ICAuLi4vYmluZGluZ3Mv
bXRkL251dm90b24sbWEzNWQxLW5hbmQueWFtbCAgICAgfCA5MyArKysrKysrKysrKysrKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL251dm90b24sbWEzNWQxLW5h
bmQueWFtbAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL251dm90b24sbWEzNWQxLW5hbmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvbnV2b3RvbixtYTM1ZDEtbmFuZC55YW1sCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmE4YTU0OTY0NGM5OAo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL251dm90b24sbWEz
NWQxLW5hbmQueWFtbAo+IEBAIC0wLDAgKzEsOTMgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0K
PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvbnV2b3RvbixtYTM1ZDEt
bmFuZC55YW1sIwo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFz
L2NvcmUueWFtbCMKPiArCj4gK3RpdGxlOiBOdXZvdG9uIE1BMzVEMSBOQU5EIEZsYXNoIEludGVy
ZmFjZSAoTkZJKSBDb250cm9sbGVyCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIEh1aS1QaW5n
IENoZW4gPGhwY2hlbjBudnRAZ21haWwuY29tPgo+ICsKPiArYWxsT2Y6Cj4gKyAgLSAkcmVmOiBu
YW5kLWNvbnRyb2xsZXIueWFtbCMKPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0aWJsZToK
PiArICAgIGVudW06Cj4gKyAgICAgIC0gbnV2b3RvbixtYTM1ZDEtbmFuZC1jb250cm9sbGVyCj4g
Kwo+ICsgIHJlZzoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIGludGVycnVwdHM6Cj4gKyAg
ICBtYXhJdGVtczogMQo+ICsKPiArICBjbG9ja3M6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiAr
cGF0dGVyblByb3BlcnRpZXM6Cj4gKyAgIl5uYW5kQFthLWYwLTldJCI6Cj4gKyAgICB0eXBlOiBv
YmplY3QKPiArICAgICRyZWY6IHJhdy1uYW5kLWNoaXAueWFtbAo+ICsgICAgcHJvcGVydGllczoK
PiArICAgICAgbmFuZC1lY2Mtc3RlcC1zaXplOgo+ICsgICAgICAgIGVudW06IFs1MTIsIDEwMjRd
Cj4gKwo+ICsgICAgICBuYW5kLWVjYy1zdHJlbmd0aDoKPiArICAgICAgICBlbnVtOiBbOCwgMTIs
IDI0XQo+ICsKPiArICAgIHJlcXVpcmVkOgo+ICsgICAgICAtIG5hbmQtZWNjLXN0ZXAtc2l6ZQo+
ICsgICAgICAtIG5hbmQtZWNjLXN0cmVuZ3RoCgpObywgdGhleSBzaG91bGQgbm90IGJlIHJlcXVp
cmVkLCB1bmxlc3MgdGhlcmUgaXMgYSBnb29kIHJlYXNvbiB0byBkbwpzby4gT3B0aW1hbCBzdHJl
bmd0aCBpcyBkaXNjb3ZlcmFibGUsIHN0b3AgZm9yY2luZyBpdCBieSBkZWZhdWx0LgoKPiArCj4g
KyAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtyZXF1aXJlZDoKPiArICAt
IGNvbXBhdGlibGUKPiArICAtIHJlZwo+ICsgIC0gaW50ZXJydXB0cwo+ICsgIC0gY2xvY2tzCj4g
Kwo+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAt
IHwKPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0t
Z2ljLmg+Cj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbnV2b3RvbixtYTM1ZDEt
Y2xrLmg+Cj4gKwo+ICsgICAgc29jIHsKPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsK
PiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsKPiArCj4gKyAgICAgICAgbmFuZC1jb250cm9s
bGVyQDQwMUEwMDAwIHsKPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJudXZvdG9uLG1hMzVk
MS1uYW5kLWNvbnRyb2xsZXIiOwo+ICsgICAgICAgICAgICByZWcgPSA8MHgwIDB4NDAxQTAwMDAg
MHgwIDB4MTAwMD47Cj4gKyAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzOCBJUlFf
VFlQRV9MRVZFTF9ISUdIPjsKPiArICAgICAgICAgICAgY2xvY2tzID0gPCZjbGsgTkFORF9HQVRF
PjsKPiArICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gKyAgICAgICAgICAgICNz
aXplLWNlbGxzID0gPDA+Owo+ICsKPiArICAgICAgICAgICAgbmFuZEAwIHsKPiArICAgICAgICAg
ICAgICAgIHJlZyA9IDwwPjsKPiArCj4gKyAgICAgICAgICAgICAgICBuYW5kLW9uLWZsYXNoLWJi
dDsKPiArICAgICAgICAgICAgICAgIG5hbmQtZWNjLXN0ZXAtc2l6ZSA9IDw1MTI+Owo+ICsgICAg
ICAgICAgICAgICAgbmFuZC1lY2Mtc3RyZW5ndGggPSA8OD47Cj4gKwo+ICsgICAgICAgICAgICAg
ICAgcGFydGl0aW9ucyB7Cj4gKyAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhl
ZC1wYXJ0aXRpb25zIjsKPiArICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwx
PjsKPiArICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKPiArCj4gKyAgICAg
ICAgICAgICAgICAgICAgdWJvb3RAMCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVs
ID0gIm5hbmQtdWJvb3QiOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICByZWFkLW9ubHk7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgzMDAwMDA+Owo+ICsgICAgICAg
ICAgICAgICAgICAgIH07Cj4gKyAgICAgICAgICAgICAgICB9Owo+ICsgICAgICAgICAgICB9Owo+
ICsgICAgICAgIH07Cj4gKyAgICB9Owo+ICsKPiArLi4uCgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
