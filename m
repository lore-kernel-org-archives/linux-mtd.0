Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C87FC43381
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 14:51:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1294620675
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 14:51:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PySg5ZBp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="Ay/j5/1V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1294620675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9unKjy9dT/620NW6+MBW+vJpkXGMrkonc4hFPrATXg=; b=PySg5ZBpnlhNZz
	BRevRE/khljSSst2V2PlVG2Pn1y67sTjr/B+tLx5MV5+r+E2CAER6lcVsUj06MQZdt9Jih1by3OlH
	lA8227lNpfEIcy1B5GGg/p/MQ0saQ/8llq1+nvPKL/rmZ4oH2i/grrifPgBFbEee5G8Is6drsZGJ0
	fdI+AbuhxA8R4a9lh7MLIGWlmn1rt+QFKiUDmb7O9smp6OoM5t5RFMTDqzUt24SPpn9v/lzS0WNU3
	LJQQgIuC0goEBwvNwc2G5QWF8ivN3GPSS4C0NvG1p8u63qjliy8sOBYDVvJKWiAkc3o39hzUVhRAc
	jjFpjW31fNkdq+kWHT/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzjVh-0003Ri-J2; Fri, 01 Mar 2019 14:51:37 +0000
Received: from nh604-vm7.bullet.mail.ssk.yahoo.co.jp ([182.22.90.64])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzjVd-0003R8-0O
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2019 14:51:35 +0000
Received: from [182.22.66.104] by nh604.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 01 Mar 2019 14:51:24 -0000
Received: from [182.22.91.207] by t602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 01 Mar 2019 14:51:24 -0000
Received: from [127.0.0.1] by omp610.mail.ssk.yahoo.co.jp with NNFMP;
 01 Mar 2019 14:51:24 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 9200.28207.bm@omp610.mail.ssk.yahoo.co.jp
Received: (qmail 46907 invoked by alias); 1 Mar 2019 14:51:23 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1551451883; bh=mQkYwDAH5TNaXcYf266UuMsTSLxWwbNZYi4tzQvelwA=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language;
 b=Ay/j5/1VEW2hyQeev3gw/ojv7JIiCry3VKLMrN7iDKOt8Jo4fePY5AcmK5cVMRYOpLsZc0x8XOG++7X3Hx/LiBfiuGv7qPvVkZUrxkbdrdlnQ9CMIWukUkS7PN2OuHvO95IvFh3bDI2MdQhnbM9DHyefoCLbG9VYQYTEtWC+G54=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language;
 b=ewznt9YFlKPmmahH4vxJn79uEkEAmtZx6nY4IwjqVRqgysb5qrajiDmX7PV+ckuAol6NwYgTQviQPxt5nhc5EUyq3jpGAkCi52sjYDT6yn9OYLbdNjPCtgUPr6aj+bzsdbIGOHH4D7vN1ZRJnW7IFmAJdfvXqObuYs1ayOuhs5I=
 ; 
Received: from unknown (HELO ikegamiPC) (106.72.39.32 with login)
 by smtp5001.mail.kks.ynwp.yahoo.co.jp with SMTP; 1 Mar 2019 14:51:23 -0000
X-YMail-JAS: zdfzqRgVM1mdqcdPpt71s6VKBorWnvoGs3e66BkfqHJxzRSWT0e7rvESWCQjAQQPeYgNh29Kl3bYZaKz_RQXoaqIyLx99mKqjrEcuOHtMNreenlQjzDPtGK8m0mCno65nlTv92kOsw--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: 4CkDfLoVM1nMrVFk2rCi8QcvWj5w9UilQIOlYKvlR.WVNBv
 StDVIDVC9d2jqLgXRSJdJx5ZHFTvi3NfXmWi5ZP.Qc92cdjcP6df_IMzFYzO
 SUUdcGJ1vdZVyZJGfMZAFIubBiVIkH.qKlHLuEU5EBLUw16x9tQiyls6vVjr
 qAlswH2LOoEY1RkM3.3R4BabwIA7XyPSCW6tUxjjmhY4Ehys.OxHbG2IzUIg
 7r0f1IQMdDN2KGpqcWclAhmzK6EESGCajnLu57O9EgYxIgtq3FTViUp1Gz_h
 rQAp4UclU9ftmeREQDOEKGInrvRY_1znQDVtnZa7OZfxnvUv0CiYqfHPGqxg
 YG0g_fj5pGXtbgKIKEXJtEQ9FXtOVOHDXtLFuZejeUbv3SIZHRNMmKjMEL01
 VW0Z9WPISgByVYck3PJY3WXplFnACaBU54gwCNtGyzeaHGAjxdjRFB8LRXD1
 DOpYb1C0i_iVMXtQWaLRWegTcTSlNphjHNhap1I.9qWdQnIBgOKbamQXBVYQ
 ZtGiHORyhjiDchzcI.6z05lczzTaJWkPW2wOM1R1BRmmFMUhC9rgHULd4haI
 NCQTfpXR86Mv0srxOZoi5TJ1JGSK0tmTtWuBJC91ysLk_g_QCMsbE1LNqJrl
 byBn41vGl8ayTXoLh5OY6sSPJPG5O3sR3ak9MQj_TIEtLr2XNUzkG5meruJ2
 kCIRex.89P6nBCNyKtNEXVEw1wGU-
From: "Tokunori Ikegami" <ikegami_to@yahoo.co.jp>
To: "'Boris Brezillon'" <boris.brezillon@collabora.com>,
 "'liujian \(CE\)'" <liujian56@huawei.com>
References: <1551189648-58073-1-git-send-email-liujian56@huawei.com>
 <016001d4cf71$865e7b60$931b7220$@gmail.com>
 <4F88C5DDA1E80143B232E89585ACE27D0264F137@DGGEMM528-MBX.china.huawei.com>
 <20190228164228.734ede80@collabora.com>
In-Reply-To: <20190228164228.734ede80@collabora.com>
Subject: RE: [PATCH v3] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
Date: Fri, 1 Mar 2019 23:51:16 +0900
Message-ID: <005a01d4d03e$39b0e0f0$ad12a2d0$@yahoo.co.jp>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQHOptjmAmqem5WpXlLpfOi8uScBsQIgzkq5Atg5CjYCPRAs9qXJc14A
Content-Language: ja
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_065133_418163_39FBEFB6 
X-CRM114-Status: GOOD (  20.98  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: 'Tokunori Ikegami' <ikegami.t@gmail.com>, keescook@chromium.org,
 bbrezillon@kernel.org, ikegami@allied-telesis.co.jp, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogbGludXgtbXRkIFttYWlsdG86
bGludXgtbXRkLWJvdW5jZXNAbGlzdHMuaW5mcmFkZWFkLm9yZ10gT24gQmVoYWxmCj4gT2YgQm9y
aXMgQnJlemlsbG9uCj4gU2VudDogRnJpZGF5LCBNYXJjaCAxLCAyMDE5IDEyOjQyIEFNCj4gVG86
IGxpdWppYW4gKENFKQo+IENjOiBUb2t1bm9yaSBJa2VnYW1pOyBrZWVzY29va0BjaHJvbWl1bS5v
cmc7IGJicmV6aWxsb25Aa2VybmVsLm9yZzsKPiBpa2VnYW1pQGFsbGllZC10ZWxlc2lzLmNvLmpw
OyByaWNoYXJkQG5vZC5hdDsKPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBtYXJlay52
YXN1dEBnbWFpbC5jb207Cj4gbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IGNvbXB1dGVy
c2ZvcnBlYWNlQGdtYWlsLmNvbTsKPiBkd213MkBpbmZyYWRlYWQub3JnOyB2aWduZXNockB0aS5j
b20KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzXSBjZmk6IGZpeCBkZWFkbG9vcCBpbiBjZmlfY21k
c2V0XzAwMDIuYwo+IGRvX3dyaXRlX2J1ZmZlcgo+IAo+IE9uIFRodSwgMjggRmViIDIwMTkgMTU6
MTI6MTUgKzAwMDAKPiAibGl1amlhbiAoQ0UpIiA8bGl1amlhbjU2QGh1YXdlaS5jb20+IHdyb3Rl
Ogo+IAo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiBGcm9tOiBUb2t1bm9y
aSBJa2VnYW1pIFttYWlsdG86aWtlZ2FtaS50QGdtYWlsLmNvbV0KPiA+ID4gU2VudDogVGh1cnNk
YXksIEZlYnJ1YXJ5IDI4LCAyMDE5IDEwOjI2IFBNCj4gPiA+IFRvOiBsaXVqaWFuIChDRSkgPGxp
dWppYW41NkBodWF3ZWkuY29tPjsgZHdtdzJAaW5mcmFkZWFkLm9yZzsKPiA+ID4gY29tcHV0ZXJz
Zm9ycGVhY2VAZ21haWwuY29tOyBiYnJlemlsbG9uQGtlcm5lbC5vcmc7Cj4gPiA+IG1hcmVrLnZh
c3V0QGdtYWlsLmNvbTsgcmljaGFyZEBub2QuYXQ7Cj4gam9ha2ltLnRqZXJubHVuZEBpbmZpbmVy
YS5jb207Cj4gPiA+IGlrZWdhbWlAYWxsaWVkLXRlbGVzaXMuY28uanA7IGtlZXNjb29rQGNocm9t
aXVtLm9yZzsgdmlnbmVzaHJAdGkuY29tCj4gPiA+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+ID4gPiBTdWJqZWN0OiBSRTog
W1BBVENIIHYzXSBjZmk6IGZpeCBkZWFkbG9vcCBpbiBjZmlfY21kc2V0XzAwMDIuYwo+IGRvX3dy
aXRlX2J1ZmZlcgo+ID4gPgo+ID4gPgo+ID4gPgo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tCj4gPiA+ID4gRnJvbTogbGludXgtbXRkIFttYWlsdG86bGludXgtbXRkLWJvdW5jZXNA
bGlzdHMuaW5mcmFkZWFkLm9yZ10gT24KPiA+ID4gPiBCZWhhbGYgT2YgTGl1IEppYW4KPiA+ID4g
PiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAyNiwgMjAxOSAxMTowMSBQTQo+ID4gPiA+IFRvOiBk
d213MkBpbmZyYWRlYWQub3JnOyBjb21wdXRlcnNmb3JwZWFjZUBnbWFpbC5jb207Cj4gPiA+ID4g
YmJyZXppbGxvbkBrZXJuZWwub3JnOyBtYXJlay52YXN1dEBnbWFpbC5jb207IHJpY2hhcmRAbm9k
LmF0Owo+ID4gPiA+IGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tOyBpa2VnYW1pQGFsbGll
ZC10ZWxlc2lzLmNvLmpwOwo+ID4gPiA+IGtlZXNjb29rQGNocm9taXVtLm9yZzsgdmlnbmVzaHJA
dGkuY29tCj4gPiA+ID4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaXVqaWFu
NTZAaHVhd2VpLmNvbTsKPiA+ID4gPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gPiA+
ID4gU3ViamVjdDogW1BBVENIIHYzXSBjZmk6IGZpeCBkZWFkbG9vcCBpbiBjZmlfY21kc2V0XzAw
MDIuYwo+ID4gPiA+IGRvX3dyaXRlX2J1ZmZlcgo+ID4gPiA+Cj4gPiA+ID4gSW4gZnVuY3Rpb24g
ZG9fd3JpdGVfYnVmZmVyKCksIGluIHRoZSBmb3IgbG9vcCwgdGhlcmUgaXMgYSBjYXNlCj4gPiA+
ID4gY2hpcF9yZWFkeSgpIHJldHVybnMgMSB3aGlsZSBjaGlwX2dvb2QoKSByZXR1cm5zIDAsIHNv
IGl0IG5ldmVyIGJyZWFrCj4gPiA+ID4gdGhlIGxvb3AuCj4gPiA+ID4gVG8gZml4IHRoaXMsIGNo
aXBfZ29vZCgpIGlzIGVub3VnaCBhbmQgaXQgc2hvdWxkIHRpbWVvdXQgaWYgaXQgc3RheQo+ID4g
PiA+IGJhZCBmb3IgYSB3aGlsZS4KPiA+ID4gPgo+ID4gPiA+IEZpeGVzOiBkZmVhZTEwNzM1ODMo
Im10ZDogY2ZpX2NtZHNldF8wMDAyOiBDaGFuZ2Ugd3JpdGUgYnVmZmVyIHRvCj4gPiA+ID4gY2hl
Y2sgY29ycmVjdCB2YWx1ZSIpCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWWkgSHVhaWppZSA8eWlo
dWFpamllQGh1YXdlaS5jb20+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGl1IEppYW4gPGxpdWpp
YW41NkBodWF3ZWkuY29tPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBUb2t1bm9yaSBJa2VnYW1pIDxp
a2VnYW1pX3RvQHlhaG9vLmNvLmpwPgo+ID4gPiA+IC0tLQo+ID4gPiA+IHYyLT52MzoKPiA+ID4g
PiBGb2xsb3cgVmlnbmVzaCdzIGFkdmljZToKPiA+ID4gPiBhZGQgb25lIG1vcmUgY2hlY2sgZm9y
IGNoZWNrX2dvb2QoKSBldmVuIHdoZW4gdGltZV9hZnRlcigpIHJldHVybnMKPiB0cnVlLgo+ID4g
PiA+Cj4gPiA+ID4gIGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jIHwgMiArLQo+
ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+
ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAw
MDIuYwo+ID4gPiA+IGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPiA+ID4g
PiBpbmRleCA3MjQyOGI2Li4zZGEyMzc2IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbXRk
L2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9tdGQvY2hpcHMv
Y2ZpX2NtZHNldF8wMDAyLmMKPiA+ID4gPiBAQCAtMTg3Niw3ICsxODc2LDcgQEAgc3RhdGljIGlu
dCBfX3hpcHJhbSBkb193cml0ZV9idWZmZXIoc3RydWN0Cj4gPiA+ID4gbWFwX2luZm8gKm1hcCwg
c3RydWN0IGZsY2hpcCAqY2hpcCwKPiA+ID4gPiAgCQkJY29udGludWU7Cj4gPiA+ID4gIAkJfQo+
ID4gPiA+Cj4gPiA+ID4gLQkJaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywgdGltZW8pICYmICFjaGlw
X3JlYWR5KG1hcCwgYWRyKSkKPiA+ID4gPiArCQlpZiAodGltZV9hZnRlcihqaWZmaWVzLCB0aW1l
bykgJiYgIWNoaXBfZ29vZChtYXAsIGFkciwKPiA+ID4gPiBkYXR1bSkpCj4gPiA+Cj4gPiA+ICAg
SnVzdCBhbm90aGVyIGlkZWEgdG8gdW5kZXJzdGFuZCBlYXNpbHkuCj4gPiA+Cj4gPiA+ICAgICB1
bnNpZ25lZCBsb25nIG5vdyA9IGppZmZpZXM7Cj4gPiA+Cj4gPiA+ICAgICBpZiAoY2hpcF9nb29k
KG1hcCwgYWRyLCBkYXR1bSkpIHsKPiA+ID4gICAgICAgICB4aXBfZW5hYmxlKG1hcCwgY2hpcCwg
YWRyKTsKPiA+ID4gICAgICAgICBnb3RvIG9wX2RvbmU7Cj4gPiA+ICAgICB9Cj4gPiA+Cj4gPiA+
ICAgICBpZiAodGltZV9hZnRlcihub3csIHRpbWVvKSB7Cj4gPiA+ICAgICAgICAgYnJlYWs7Cj4g
PiA+ICAgICB9Cj4gPiA+Cj4gPgo+ID4gVGhhbmsgeW91fi4gSXQgaXMgbW9yZSBlYXNpZXIgdG8g
dW5kZXJzdGFuZO+8gQo+ID4gSWYgdGhlcmUgYXJlIG5vIG90aGVyIGNvbW1lbnRzLCBJIHdpbGwg
c2VuZCBuZXcgcGF0Y2ggYWdhaW4gKToKPiAKPiBFeGNlcHQgdGhpcyB2ZXJzaW9uIG5vIGxvbmdl
ciBkb2VzIHdoYXQgVmlnbmVzaCBzdWdnZXN0ZWQuIFNlZSBob3cgeW91Cj4gbm8gbG9uZ2VyIHRl
c3QgaWYgY2hpcF9nb29kKCkgaXMgdHJ1ZSBpZiB0aW1lX2FmdGVyKCkgcmV0dXJucyB0cnVlLiBT
bywKPiBpbWFnaW5lIHRoZSB0aHJlYWQgZW50ZXJpbmcgdGhpcyBmdW5jdGlvbiBpcyBwcmVlbXB0
ZWQganVzdCBhZnRlciB0aGUKPiBmaXJzdCBjaGlwX2dvb2QoKSB0ZXN0LCBhbmQgcmVzdW1lZCBh
IGZldyBtcyBsYXRlci4gdGltZV9hZnRlcigpIHdpbGwKPiByZXR1cm4gdHJ1ZSwgYnV0IGNoaXBf
Z29vZCgpIG1pZ2h0IGFsc28gcmV0dXJuIHRydWUsIGFuZCB5b3UgaWdub3JlIGl0LgoKSSB0aGlu
ayB0aGF0IHRoZSBmb2xsb3dpbmcgMyB2ZXJzaW9ucyB3aWxsIGJlIHdvcmtlZCBmb3IgdGltZV9h
ZnRlcigpIGFzIGEgc2FtZSByZXN1bHQgYW5kIGZvbGxvdyB0aGUgVmlnbmVzaC1zYW4gc3VnZ2Vz
dGlvbi4KCjEuIE9yaWdpbmFsIFZpZ25lc2gtc2FuIHN1Z2dlc3Rpb24KCglpZiAoY2hpcF9nb29k
KG1hcCwgYWRyLCBkYXR1bSkpIHsKCQl4aXBfZW5hYmxlKG1hcCwgY2hpcCwgYWRyKTsKCQlnb3Rv
IG9wX2RvbmU7Cgl9CgoJaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywgdGltZW8pKSB7CgkJLyogVGVz
dCBjaGlwX2dvb2QoKSBpZiBUUlVFIGluY29ycmVjdGx5IGFnYWluIHNvIHdyaXRlIGZhaWx1cmUg
YnkgdGltZV9hZnRlcigpIGNhbiBiZSBhdm9pZGVkLiAqLwoJCWlmIChjaGlwX2dvb2QobWFwLCBh
ZHIsIGRhdHVtKSkgewoJCQl4aXBfZW5hYmxlKG1hcCwgY2hpcCwgYWRyKTsKCQkJZ290byBvcF9k
b25lOwoJCX0KCQlicmVhazsKCX0KCjIuIExpdWppYW4tc2FuIHYzIHBhdGNoCgoJLyogVGVzdCBj
aGlwX2dvb2QoKSBpZiBGQUxTRSBjb3JyZWN0bHkgc28gd3JpdGUgZmFpbHVyZSBieSB0aW1lX2Fm
dGVyKCkgY2FuIGJlIGF2b2lkZWQuICovCglpZiAodGltZV9hZnRlcihqaWZmaWVzLCB0aW1lbykg
JiYgIWNoaXBfZ29vZChtYXAsIGFkcikpCgkJYnJlYWs7CgoJaWYgKGNoaXBfZ29vZChtYXAsIGFk
ciwgZGF0dW0pKSB7CgkJeGlwX2VuYWJsZShtYXAsIGNoaXAsIGFkcik7CgkJZ290byBvcF9kb25l
OwoJfQoKMy4gTXkgaWRlYQoKCS8qIFNhdmUgY3VycmVudCBqaWZmaWVzIHZhbHVlIGJlZm9yZSBj
aGlwX2dvb2QoKSB0byBhdm9pZCB3cml0ZSBmYWlsdXJlIGJ5IHRpbWVfYWZ0ZXIoKSB3aXRob3V0
IHRlc3RpbmcgY2hpcF9nb29kKCkgYWdhaW4uICovCgl1bnNpZ25lZCBsb25nIG5vdyA9IGppZmZp
ZXM7CgoJaWYgKGNoaXBfZ29vZChtYXAsIGFkciwgZGF0dW0pKSB7CgkJeGlwX2VuYWJsZShtYXAs
IGNoaXAsIGFkcik7CgkJZ290byBvcF9kb25lOwoJfQoKCWlmICh0aW1lX2FmdGVyKG5vdywgdGlt
ZW8pKQoJCWJyZWFrOwoKICAgICAgICAgIE5vdGU6IFNvbWUgYnJhY2tldHMgaGF2ZSBiZWVuIGZp
eGVkIGZyb20gdGhlIHByZXZpb3VzIG1haWwuCgpSZWdhcmRzLApJa2VnYW1pCgo+IAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
