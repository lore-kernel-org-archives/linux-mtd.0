Return-Path: <SRS0=05/s=4W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9294C3F2D1
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2020 02:44:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B76172084E
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2020 02:44:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KuUspO9P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B76172084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kioxia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+TMUKtdbLd5SZrzB+t1r4VtyRJaFg4/Ns9BlK+h4Nb4=; b=KuUspO9PNGKN3Lb098JHPdg5c
	K2bLIzFbHx8CDyVaoxynj4YC0iMHrvZIQcc0gWcjBPOkKttC/I0bCofMzfVquGibqi/U7Jj/Ll6WP
	nMc/dCpu/z6qmGMqlta241Rhtwon9o4El7Qdolmu8mf0aJ7RAjLlyxLytV6K0sdploHXsSZk5CqJO
	k8Z18WlmyD39oUfxh+4PaoecUdgf6a5kwOHCdR8NauMzVCAS0Gm978ygLhQ+2oqH5QBswLZ+Yp9QY
	QgiiCaExcd8AwdhxXZwvs5uLHqhJL010ry9RDCurO5vq61g+lBpgZTVEMXVGRYTIwWss8JcIY0lS6
	qc8ezleNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9gUK-000755-OR; Thu, 05 Mar 2020 02:43:52 +0000
Received: from mo-csw1514.securemx.jp ([210.130.202.153]
 helo=mo-csw.securemx.jp)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9gUF-00074b-Vy
 for linux-mtd@lists.infradead.org; Thu, 05 Mar 2020 02:43:49 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 0252hTjX009961;
 Thu, 5 Mar 2020 11:43:29 +0900
X-Iguazu-Qid: 34tKs0J2puIvSotesa
X-Iguazu-QSIG: v=2; s=0; t=1583376209; q=34tKs0J2puIvSotesa;
 m=WEUehwg0bIG5XzdGHyhc5DZIIbQUf1gIWxeFjC256IM=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
 by relay.securemx.jp (mx-mr1511) id 0252hRod004744;
 Thu, 5 Mar 2020 11:43:28 +0900
Received: from enc01.localdomain ([106.186.93.100])
 by imx2.toshiba.co.jp  with ESMTP id 0252hR6N025706;
 Thu, 5 Mar 2020 11:43:27 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.localdomain  with ESMTP id 0252hQtl020217;
 Thu, 5 Mar 2020 11:43:26 +0900
Subject: Re: [PATCH v2 1/2] mtd: spinand: toshiba: Rename function name to
 change suffix and prefix (8Gbit)
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Schrempf Frieder <frieder.schrempf@kontron.de>
References: <cover.1582603241.git.ytc-mb-yfuruyama7@kioxia.com>
 <41b30e2d308ec7f252d71970a2ed1c29cd25c0d7.1582603241.git.ytc-mb-yfuruyama7@kioxia.com>
 <d2837c89-c9b2-fd18-d090-567f2a90cf75@kontron.de>
 <20200302101254.31ca0c83@xps13>
From: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
X-TSB-HOP: ON
Message-ID: <f6501db6-8dcd-ec13-de6a-b782656de0e7@kioxia.com>
Date: Thu, 5 Mar 2020 11:43:23 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200302101254.31ca0c83@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_184348_238830_25AE49BD 
X-CRM114-Status: GOOD (  13.61  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjAvMDMvMDIgMTg6MTIsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGVsbG8sCj4KPiBT
Y2hyZW1wZiBGcmllZGVyIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+IHdyb3RlIG9uIE1v
biwgMiBNYXIgMjAyMAo+IDA4OjAyOjI1ICswMDAwOgo+Cj4+IE9uIDI4LjAyLjIwIDA0OjExLCBZ
b3NoaW8gRnVydXlhbWEgd3JvdGU6Cj4+PiBUaGUgc3VmZml4IHdhcyBjaGFuZ2VkIHRvIGNsYXNz
aWZ5IGZyb20gImciIHRvICJqIiBiZXR3ZWVuIDFzdCBnZW5lcmF0aW9uCj4+PiBkZXZpY2UgYW5k
IDJuZCBnZW5lcmF0aW9uIGRldmljZSB0aGF0J3MgbmV3IFNlcmlhbCBOQU5EIG9mIEtpb3hpYSBi
cmFuZC4KPj4gSSBoYWQgdG8gcmVhZCB0aGlzIHNlbnRlbmNlIG11bHRpcGxlIHRpbWVzIHRvIHVu
ZGVyc3RhbmQgaXQuIE1heWJlCj4+IHNvbWV0aGluZyBsaWtlIHRoaXMgd291bGQgYmUgYmV0dGVy
Ogo+Pgo+PiAgICAgVGhlIHN1ZmZpeCB3YXMgY2hhbmdlZCBmcm9tICJnIiB0byAiaiIgdG8gY2xh
c3NpZnkgYmV0d2VlbiAxc3QKPj4gICAgIGdlbmVyYXRpb24gYW5kIDJuZCBnZW5lcmF0aW9uIHNl
cmlhbCBOQU5EIGRldmljZXMgKHdoaWNoIG5vdyBiZWxvbmcgdG8KPj4gICAgIHRoZSBLaW94aWEg
YnJhbmQpLgpUaGFua3MgY29tbWVudCzCoMKgwqDCoCBJIHdpbGwgc2VuZCByZXZpc2UgcmV2Lgo+
Pj4gQXMgcmVmZXJlbmNlIHRoYXQncwo+Pj4gMXN0IGdlbmVyYXRpb24gZGV2aWNlIG9mIDFHYml0
IHByb2R1Y3QgaXMgInRjNThjdmcwczNocmFpZyIKPj4+IDJuZCBnZW5lcmF0aW9uIGRldmljZSBv
ZiAxR2JpdCBwcm9kdWN0IGlzICJ0YzU4Y3ZnMHMzaHJhaWoiLgo+Pj4KPj4+IFRoZSA4R2JpdCBw
cm9kdWN0ICJUSDU4Q3hHM1MwSFJBSUoiIGlzIG5ldyBsaW5lIHVwIG9mIEtpb3hpYSdzIHNlcmlh
bCBuYW5kCj4+PiBhbmQgY2hhbmdlZCB0aGUgcHJlZml4IGZyb20gdGM1OCB0byB0aDU4Lgo+Pj4g
VGh1cyBpdCB3YXMgY2hhbmdlZCBhcmd1bWVudCB0byB0aGUgZnVuY3Rpb24gZnJvbSAidGM1OGN4
Z3hzeCIgdG8KPj4+ICJ0eDU4Y3hneHN4cmFpeCIuCj4+IFNhbWUgaGVyZS4gSXQgaXMgdmVyeSBo
YXJkIHRvIHJlYWQuIEkgd291bGQgd3JpdGUgc29tZXRoaW5nIGxpa2UgdGhpczoKPj4KPj4gICAg
IFRoZSA4R2JpdCB0eXBlICJUSDU4Q3hHM1MwSFJBSUoiIGlzIG5ldyB0byBLaW94aWEncyBzZXJp
YWwgTkFORCBsaW5ldXAKPj4gICAgIGFuZCB0aGUgcHJlZml4IHdhcyBjaGFuZ2VkIGZyb20gIlRD
NTgiIHRvICJUSDg1Ii4KPj4KPj4gICAgIFRodXMgdGhlIGZ1bmN0aW9ucyB3ZXJlIHJlbmFtZWQg
ZnJvbSB0YzU4Y3hneHN4XyooKSB0bwo+PiAgICAgdHg1OGN4Z3hzeHJhaXhfKigpLgoKSSB3aWxs
IGNoYW5nZSBwcmVmaXggZnJvbSAiVEg4NSIgdG8gIlRINTgiIC7CoCBTaW5jZSB0aGlzIGlzIHR5
cG8uCgogICAgVGhlIDhHYml0IHR5cGUgIlRINThDeEczUzBIUkFJSiIgaXMgbmV3IHRvIEtpb3hp
YSdzIHNlcmlhbCBOQU5EIGxpbmV1cAogICAgYW5kIHRoZSBwcmVmaXggd2FzIGNoYW5nZWQgZnJv
bSAiVEM1OCIgdG8gIlRINTgiLgoKICAgIFRodXMgdGhlIGZ1bmN0aW9ucyB3ZXJlIHJlbmFtZWQg
ZnJvbSB0YzU4Y3hneHN4XyooKSB0bwogICAgdHg1OGN4Z3hzeHJhaXhfKigpLgoKVGhhbmtzLAoK
Pj4gV2l0aCBhbiBlYXNpZXIgdG8gdW5kZXJzdGFuZCBjb21taXQgbWVzc2FnZToKPj4KPj4gUmV2
aWV3ZWQtYnk6IEZyaWVkZXIgU2NocmVtcGYgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZT4K
PiBBZ3JlZWQsIHRoZSBjb21taXQgbG9nIHByb3Bvc2FsIGZyb20gRnJpZWRlciBsb29rcyBiZXR0
ZXIuCj4KPiBUaGUgcmVzdCBvZiB0aGUgcGF0Y2ggaXMgZmluZSBieSBtZSB0aG91Z2guCj4KPiBU
aGFua3MsCj4gTWlxdcOobAo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
