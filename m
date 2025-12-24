Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0655EE74916
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Dec 2025 11:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ig9cD4uOiae+IQf86WnsmtwvUKgIbOn1Wdfes2upuk=; b=GUFcIPrR/gJ49o
	nW1yqpk+NgGxTfljJn8oel58Yof623bQybE5OdChXRhVAu2JJKHrEzic8duRjAxsz9MC/TMCsDlya
	q8mzo21mR6Uo0H9mPnEe7TaY1jch8Fcfsfcckv3BTI8WAbYOgGCLzpTzt0FnZkLQbC3awbeBTFc44
	3WqcmJIfDKT6pcZYDYZK2w/y29giNwhU4aHp+/PkI8qv/gvojT4jMI3mRmdizzS1NaZ3wWihxOc+t
	h06kprKrMN8Opc01u1KVG/UX7EY+CR93OmKiBAkPjpL4xwhIJhO+7G52RyXrDAL5g/mgcZQ6wi9RI
	ptnXE0t7d+7SMEsXy7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYN1e-0000000GkIy-18vT;
	Wed, 24 Dec 2025 11:27:30 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYN1Y-0000000GkHu-0BSg
	for linux-mtd@lists.infradead.org;
	Wed, 24 Dec 2025 11:27:28 +0000
X-QQ-mid: esmtpgz16t1766575566t22c6a4c2
X-QQ-Originating-IP: wwSd5kUax3h4QoW7fyib2bLZD+FaeDlt/c5SLSNA0HU=
Received: from [192.168.0.160] ( [120.40.109.156])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 24 Dec 2025 19:26:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7734528260234887350
EX-QQ-RecipientCnt: 10
Message-ID: <0D39C7685236B803+8bd6b22f-87bc-4fa1-90a7-2f8fac557c7d@radxa.com>
Date: Wed, 24 Dec 2025 19:26:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: devices: Add Qualcomm SCM storage driver
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251218180205.930961-1-bigfoot@radxa.com>
 <A41171D3EA8B583B+20251218180205.930961-3-bigfoot@radxa.com>
 <b14c51a0-7e87-4eb2-ae52-caf90f1bf545@oss.qualcomm.com>
 <4AB2F6CA8EF1ED90+cd685c52-a4c2-492d-9445-b081d4d857f7@radxa.com>
 <1b40552e-b292-4207-b7eb-9f50e37fd7e4@oss.qualcomm.com>
From: Junhao Xie <bigfoot@radxa.com>
In-Reply-To: <1b40552e-b292-4207-b7eb-9f50e37fd7e4@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: Mn6sU2dhbGGPu9MJIEwZT5FtBd6rBQ0q9Gu/SFcIN8iYTVS2j1W6tu7j
	DqCpLanat0LrIV3nnvkFfWlXiwAGsKLLCogcktqowz8e519KHnTC1KYk4y61Nncw8jsdw8q
	xDlR91m3maDDogIzp1jDuysPDwJmqN/D0hpF0eZ9jJTcAYFHYv2bbCesC6fUY97fLuPHTCb
	gOqXHEohZp8TCJiErb2RFCSPZXZcOq8vSs1cs8nZU0ApPitWAl6rsqSgx8qE1Hqgoejc8L0
	2CJayad6SFL4rpHj+hMhI/6a8l9bL+Vq0fdhKvzzsCJoxv3UR2cTo55JSpD5/ilUH0ln/ey
	yzU7GuXrAx2+j2kb5qmumkpEtYZbiRTa+1/mFcYC3wUbvf7uAepEwn33p0FdtOnFLkH0F9k
	+QLEtwpWOKJz76yCONP7dwXAbyHJSK7aKDNiLJaRGSViwTT0E4FlTDuSRzM0fZ+kmCC0+CA
	+7QF0RNBYr61EohBCLRFmIs+mgxaeQL9OAUZVsrncclhmIE7br3fBfbr3wUYhxaaSUvhdM6
	LQKInQ5Q1nLIuqt7HuA2rrYaXQaryxJIdxTupgWc52HIP9ANOGUN3vRIx4s7T4aUIi5CnOj
	0ok2jcXoLZ4hxYlzQBjFB83i14Nn3TZ4XoREfoZizvXQWy105QikjhyYQ0PXi5eFdVBb63z
	1kciLA2CHT52hEzA/Ey7XREnUlsuPMIeHYT//j03tgVGmrruvqhzUjsphq9EG3eCGxF0/4Y
	GFnpIJvMLJu/ts/Wfm5vZqvbDNvV9LxrmUXbzcaUKOfYfqr0OsLZ6VEY0zcehS1vlXJNLPE
	+t6DkKDNwQiKoRLxzYYbtBhn7gWLOIYFtQAeXXjNvhYR1rpswYa5sniKhi+tHFUxsVHQOF1
	vWxaWuSK5WF14gxx9m+Pr9l1UwBR8sF/MmPIKJMWcIOTG7oP8UGQgpCIuwsHe7MJFqoBwhd
	dU3V45rscNtY8admUwHM3zUl69SEsWTmJvBqD6uJUdw5wI4KEhKnVyRV30iD2T3Pq7Yyzkl
	EJw31Fsg==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_032724_443464_F2B5EE63 
X-CRM114-Status: GOOD (  13.47  )
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

T24gMjAyNS8xMi8yMiAxNzo0MywgS29ucmFkIER5YmNpbyB3cm90ZToKPiBPbiAxMi8xOS8yNSA2
OjEyIFBNLCBKdW5oYW8gWGllIHdyb3RlOgo+PiBPbiAyMDI1LzEyLzE5IDIwOjA1LCBLb25yYWQg
RHliY2lvIHdyb3RlOgo+Pj4gT24gMTIvMTgvMjUgNzowMiBQTSwgSnVuaGFvIFhpZSB3cm90ZToK
Pj4+PiBBZGQgTVREIGRyaXZlciBmb3IgYWNjZXNzaW5nIHN0b3JhZ2UgZGV2aWNlcyBtYW5hZ2Vk
IGJ5IFF1YWxjb21tJ3MKPj4+PiBUcnVzdFpvbmUgZmlybXdhcmUuIE9uIHNvbWUgcGxhdGZvcm1z
LCBCSU9TL2Zpcm13YXJlIHN0b3JhZ2UgKHR5cGljYWxseQo+Pj4+IFNQSSBOT1IgZmxhc2gpIGlz
IG5vdCBkaXJlY3RseSBhY2Nlc3NpYmxlIGZyb20gdGhlIG5vbi1zZWN1cmUgd29ybGQgYW5kCj4+
Pj4gYWxsIG9wZXJhdGlvbnMgbXVzdCBnbyB0aHJvdWdoIFNDTSAoU2VjdXJlIENoYW5uZWwgTWFu
YWdlcikgY2FsbHMuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdW5oYW8gWGllIDxiaWdmb290
QHJhZHhhLmNvbT4KPj4+PiBUZXN0ZWQtYnk6IFhpbGluIFd1IDxzb3Bob25AcmFkeGEuY29tPgo+
Pj4+IC0tLQo+IFsuLi5dCj4KPj4+PiArCWhvc3QtPmJ1ZmZlcl9zaXplID0gU1pfMjU2SzsKPj4+
IFNob3VsZCB0aGlzIGp1c3QgYmUgPSBob3N0LT5pbmZvLT5wYWdlX3NpemU/Cj4+IFRoZSB2YWx1
ZSBvZiBwYWdlX3NpemUgaXMgc21hbGxlciB0aGFuIHdoYXQgd2Ugd2FudCBmb3IKPj4gYnVmZmVy
aW5nIFNDTSB0cmFuc2ZlcnMuIFRoZSBidWZmZXIgaXMgaW50ZW5kZWQgZm9yIGJhdGNoaW5nCj4+
IGxhcmdlciBvcGVyYXRpb25zLCBzbyBhIGxhcmdlciBmaXhlZCBzaXplIGlzIHVzZWQgaGVyZS4K
Pj4KPj4gc3RydWN0IHFjb21fc2NtX3N0b3JhZ2VfaW5mbzoKPj4gwqAgdG90YWxfYmxvY2tzID0g
ODE5Mgo+PiDCoCBibG9ja19zaXplID0gNDA5Ngo+PiDCoCBwYWdlX3NpemUgPSAyNTYKPj4gwqAg
bnVtX3BoeXNpY2FsID0gMAo+PiDCoCBtYW51ZmFjdHVyZXJfaWQgPSAwCj4+IMKgIHNlcmlhbF9u
dW0gPSAxNjYzMjE1Cj4+IMKgIGZ3X3ZlcnNpb24gPcKgCj4+IMKgIG1lbW9yeV90eXBlID0gTk9S
Cj4gSSBkb24ndCBzZWUgaG93IHRoZSBiaWcgYnVmZmVyIGlzIGFueSB1c2VmdWwgVEJGIC0geW91
IHJlYWQgaW50byB0aGlzCj4gYnVmZmVyIGJlZm9yZSBvdXRwdXR0aW5nIHRvICpidWYgYW5kIGNv
cHkgZGF0YSBmcm9tICpidWYgaW50byB0aGUKPiBob3N0X2J1ZmZlciBpbnN0ZWFkIG9mIHdyaXRp
bmcgc3RyYWlnaHQgZnJvbSB0aGUgZm9ybWVyLiBJZiBhbnl0aGluZywKPiB0aGF0J3MgYW4gdW5u
ZWNlc3NhcnkgY29weS4KClRoZSBwdXJwb3NlIG9mIHVzaW5nIGEgbGFyZ2VyIGJ1ZmZlciBoZXJl
IGlzIHRvIHJlZHVjZSB0aGUgbnVtYmVyIG9mClNDTSBjYWxscyByYXRoZXIgdGhhbiB0byBhdm9p
ZCBtZW1jcHkuCgpFYWNoIFFDT01fU0NNX1NUT1JBR0VfUkVBRC9XUklURSBpbnZvbHZlcyBhbiBT
TUMgdHJhbnNpdGlvbiB3aXRoIGEKcmVsYXRpdmVseSBoaWdoIGZpeGVkIG92ZXJoZWFkLiBJc3N1
aW5nIGNhbGxzIGF0IGEgNCBLaUIgZ3JhbnVsYXJpdHkKd291bGQgcmVzdWx0IGluIG1hbnkgU0NN
IGNhbGxzIGFuZCBwb29yIHRocm91Z2hwdXQuIFRoZSBsYXJnZXIgYnVmZmVyCmFsbG93cyBiYXRj
aGluZyBtdWx0aXBsZSBjb250aWd1b3VzIGJsb2NrcyBpbnRvIGEgc2luZ2xlIFNDTQp0cmFuc2Fj
dGlvbiwgc2lnbmlmaWNhbnRseSByZWR1Y2luZyB0aGUgbnVtYmVyIG9mIFNNQ3MuIEluIGNvbXBh
cmlzb24sCnRoZSBleHRyYSBtZW1jcHkgY29zdCBpcyBuZWdsaWdpYmxlLgoKSSBhZ3JlZSB0aGF0
IHRoZSBjdXJyZW50IGNvZGUgYWx3YXlzIGJvdW5jaW5nIHRocm91Z2ggdGhlIGJ1ZmZlciBpcyBu
b3QKaWRlYWwuIEluIHYyLCBJIHdpbGwgcGFzcyBhbGlnbmVkIGFjY2Vzc2VzIGRpcmVjdGx5IHRv
CnFjb21fc2NtX3N0b3JhZ2Vfc2VuZF9jbWQoKSB0byBhdm9pZCB0aGUgZXh0cmEgY29weSwgYW5k
IG9ubHkgdXNlIHRoZQpib3VuY2UgYnVmZmVyIGZvciB1bmFsaWduZWQgb3IgcGFydGlhbCBhY2Nl
c3Nlcy4gSSB3aWxsIGFsc28gYWRkIGEKY29tbWVudCBleHBsYWluaW5nIHRoZSByYXRpb25hbGUg
Zm9yIHRoZSBidWZmZXIgc2l6ZS4KCj4gS29ucmFkCj4KClRoYW5rcyBhZ2FpbiBmb3IgdGhlIHJl
dmlldy4KCkJlc3QgcmVnYXJkcywKSnVuaGFvIFhpZQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
