Return-Path: <SRS0=V/n1=XM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542B5C4CECD
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 18:04:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03EE2206C2
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 18:04:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fe3TCui4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="kkLD0Hzb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03EE2206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XBBUbmqku7nWbi8E1BNrIUu96dsPV2a5Lf6ZVKVDelc=; b=Fe3TCui4MtFbieV4OszhdQMQm
	NU/9wbVmHzcMlpijBvppz9zGh/oaOZvceG1LPwVnE3J7gqZ33IoWCBycv5KEZkLt+LSS9gBxIv6zE
	O+fqh7JgQd8OBdqvlVuhrFejeIW8pLbWNJLebnOwp5+TYXSpvy+liVTHMYw7+Pc2RET6HVxpt4xLW
	mL2gMURB7gsj6JVai9+wjkWNGerEu2MSk93GE5jmB37ZX559s0RvlkFUWXUODQlDB+olZQuJtASnp
	kHIS+TIufc93W9+kAtFr7Hk4l0iz3QZclChR3gohWHqzxrCfZmveQLNEghSuORTnBiBaWDQVcIMAs
	B9IKVjzHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAHq5-0003N0-Ms; Tue, 17 Sep 2019 18:04:33 +0000
Received: from nh603-vm8.bullet.mail.ssk.yahoo.co.jp ([182.22.90.49])
 by bombadil.infradead.org with smtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAHq1-0003Ld-G7
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2019 18:04:31 +0000
Received: from [182.22.66.104] by nh603.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 17 Sep 2019 18:04:17 -0000
Received: from [182.22.91.128] by t602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 17 Sep 2019 18:04:17 -0000
Received: from [127.0.0.1] by omp601.mail.ssk.yahoo.co.jp with NNFMP;
 17 Sep 2019 18:04:17 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 4391.31328.bm@omp601.mail.ssk.yahoo.co.jp
Received: (qmail 26846 invoked by alias); 17 Sep 2019 18:04:16 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1568743456; bh=kq8A8OjhoG1MbsfUcBmup1Rzy+4pm3cd6J/5Oj2PVoI=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:Subject:To:Cc:References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Content-Language;
 b=kkLD0HzbwpVpyikydf/NVTjMwSgBx5201ivxp+tFrXQfOeKyAvZcqXWHU9V/+S4/KsDDlY6/qLZz/tj6e8FWTjlbwUf172l93J6tPDbIUl4JdUWoakKINmB5f6sVAm+lHhXIumHRPeX7XaZ+c+alpAhP4LI6rRQp0e2LqyFzoHw=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:Subject:To:Cc:References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Content-Language;
 b=UnjDRmluTY2tkxZrbkTOdSpa29jr0xFKiomLYoButexNZkK+hLWZV93IqA4YTAzbyKkF6VBJ5TjcdqY7aZ/F2TPE2QXiRXI8mONDRLX7yqay+DppXW8zlDdEpWizkizS2mHREk/3f/GjOrSgnmLQH/wuno6jEdDwjN//GxSMrTE=
 ; 
Received: from unknown (HELO ?192.168.11.4?) (106.72.39.32 with )
 by smtp5001.mail.kks.ynwp.yahoo.co.jp with SMTP; 17 Sep 2019 18:04:16 -0000
X-YMail-JAS: fMjLbjUVM1nr3kCtRiCO2UW03bk6fIvFefLJSNY9uviuqvxvcj5xqHXprBOZTc_5eQqBJAHXM9jLS3ylU_Eiy6.WqSV_k3JJexj4k7gHEvZQ7m5z9HupDcgxBVKmvrS.EBPPR8Uxsg--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: SZxDPlMVM1kgA.UPL_TpeKhv2aaLcVOC2OryZ4slhsosQ.W
 Cwbl7JEWehvou3A6ZdZVSnjnbPF8WUuHEhGQQX1w92H.GYbR_5d4LObuVNbx
 0_Ez2Sk06I_evsP0epXimQoag2Ng165oMTUogxF6MqfJSsxu9I6BPzGu1WOT
 uAWV2jzOKaQspii9BOCdNEmXDJct3TqN7uO2g7a32Q8zzzFAP_QjIHVXBy84
 uh2PDbrqUu3eZvuSg4ql3Mbr42bueIsFeqZcm9Um0wxOExFbU2kvEmy0Wupf
 0tmZYqwvo6LhIJvsGa4WOT0x68bfdrUzceJgclXcAU19a13LAYcYK16FDytk
 LbP6frsC6DbA.A__zIaRTq.LjpsG7QA5SUoSSrQ2y70XpjIQGelXi8NIlAte
 jHuzzYdcjssNfZVb.tpZp5OBSq5JCiyKjh3BZ2KFIO3ZLkA1fScHmm7RZHTY
 25D2Qg2y6YzOzUOvI1fYEfDHGM00m8QUo1sD4IUyR.sKCYK4bQLxhuagIc9U
 oV0EQhNgI7ZJAiaccLdmGFX5_wqh3Tr_.zHoQtJGW8ZwRUr_9m9kTPl5XyEp
 1NWj1lid1YoWrcTbYiFXsBcQBPvcHY47hDMgGFtSh4LFT1vK9KoPOZT6rMaA
 Wtdx0e4rsZZ0zhsdeqFPR6y1OEOBn357Ysfn4Xeku9XaP6wPE5WVAfioV3p1 Q
Subject: Re: [PATCH v8 1/9] mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()
To: Tokunori Ikegami <ikegami.t@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20190805190326.28772-2-ikegami.t@gmail.com>
 <20190806004303.EBEF82147A@mail.kernel.org>
 <9fd8b17b-abb4-114e-d6fb-252430d98432@gmail.com>
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Message-ID: <a74e201d-4f1c-1bd6-babf-8dac0d515d6d@yahoo.co.jp>
Date: Wed, 18 Sep 2019 03:04:15 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9fd8b17b-abb4-114e-d6fb-252430d98432@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190917_110429_850940_A6E78C09 
X-CRM114-Status: GOOD (  14.65  )
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
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpUaGUgcGF0Y2ggaGFzIGJlZW4gbWVyZ2VkIGludG8gCmdpdDovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG10ZC9uZXh0IGZvciAKdjUu
NC1yYzEuClNvIEkgaGF2ZSBqdXN0IHNlbnQgcGF0Y2hlcyBmb3IgdjUuMi55LCB2NC4xOS55LCB2
NC4xNC55LCB2NC45LnkgYW5kIAp2LjQuNC55IHNlcGFyYXRlbHkuCgpSZWdhcmRzLApJa2VnYW1p
CgpPbiAyMDE5LzA4LzA2IDIzOjMwLCBUb2t1bm9yaSBJa2VnYW1pIHdyb3RlOgo+IEhpLAo+Cj4g
VGhhbmtzIGZvciB0aGUgbWFpbC4KPgo+IE9uIDIwMTkvMDgvMDYgOTo0MywgU2FzaGEgTGV2aW4g
d3JvdGU6Cj4+IEhpLAo+Pgo+PiBbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCj4+Cj4+IFRo
aXMgY29tbWl0IGhhcyBiZWVuIHByb2Nlc3NlZCBiZWNhdXNlIGl0IGNvbnRhaW5zIGEgLXN0YWJs
ZSB0YWcuCj4+IFRoZSBzdGFibGUgdGFnIGluZGljYXRlcyB0aGF0IGl0J3MgcmVsZXZhbnQgZm9y
IHRoZSBmb2xsb3dpbmcgdHJlZXM6IGFsbAo+Pgo+PiBUaGUgYm90IGhhcyB0ZXN0ZWQgdGhlIGZv
bGxvd2luZyB0cmVlczogdjUuMi42LCB2NC4xOS42NCwgdjQuMTQuMTM2LCAKPj4gdjQuOS4xODcs
IHY0LjQuMTg3Lgo+Pgo+PiB2NS4yLjY6IEZhaWxlZCB0byBhcHBseSEgUG9zc2libGUgZGVwZW5k
ZW5jaWVzOgo+PiDCoMKgwqDCoCA0ODQ0ZWY4MDMwNWQgKCJtdGQ6IGNmaV9jbWRzZXRfMDAwMjog
QWRkIHN1cHBvcnQgZm9yIHBvbGxpbmcgCj4+IHN0YXR1cyByZWdpc3RlciIpCj4+Cj4+IHY0LjE5
LjY0OiBGYWlsZWQgdG8gYXBwbHkhIFBvc3NpYmxlIGRlcGVuZGVuY2llczoKPj4gwqDCoMKgwqAg
NDg0NGVmODAzMDVkICgibXRkOiBjZmlfY21kc2V0XzAwMDI6IEFkZCBzdXBwb3J0IGZvciBwb2xs
aW5nIAo+PiBzdGF0dXMgcmVnaXN0ZXIiKQo+PiDCoMKgwqDCoCBkOWI4YTY3YjNiOTUgKCJtdGQ6
IGNmaTogZml4IGRlYWRsb29wIGluIGNmaV9jbWRzZXRfMDAwMi5jIAo+PiBkb193cml0ZV9idWZm
ZXIiKQo+Pgo+PiB2NC4xNC4xMzY6IEZhaWxlZCB0byBhcHBseSEgUG9zc2libGUgZGVwZW5kZW5j
aWVzOgo+PiDCoMKgwqDCoCA0ODQ0ZWY4MDMwNWQgKCJtdGQ6IGNmaV9jbWRzZXRfMDAwMjogQWRk
IHN1cHBvcnQgZm9yIHBvbGxpbmcgCj4+IHN0YXR1cyByZWdpc3RlciIpCj4+IMKgwqDCoMKgIGM2
NGQ0NDE5YTE3YyAoIm10ZDogY2ZpX2NtZHNldF8wMDAyOiBDaGFuZ2UgZXJhc2Ugb25lIGJsb2Nr
IHRvIAo+PiBlbmFibGUgWElQIG9uY2UiKQo+PiDCoMKgwqDCoCBkOWI4YTY3YjNiOTUgKCJtdGQ6
IGNmaTogZml4IGRlYWRsb29wIGluIGNmaV9jbWRzZXRfMDAwMi5jIAo+PiBkb193cml0ZV9idWZm
ZXIiKQo+PiDCoMKgwqDCoCBlYTA5MmZiM2NlNjYgKCJtdGQ6IGNmaV9jbWRzZXRfMDAwMjogRml4
IGNvZGluZyBzdHlsZSBpc3N1ZXMiKQo+Pgo+PiB2NC45LjE4NzogRmFpbGVkIHRvIGFwcGx5ISBQ
b3NzaWJsZSBkZXBlbmRlbmNpZXM6Cj4+IMKgwqDCoMKgIDQ4NDRlZjgwMzA1ZCAoIm10ZDogY2Zp
X2NtZHNldF8wMDAyOiBBZGQgc3VwcG9ydCBmb3IgcG9sbGluZyAKPj4gc3RhdHVzIHJlZ2lzdGVy
IikKPj4gwqDCoMKgwqAgYzY0ZDQ0MTlhMTdjICgibXRkOiBjZmlfY21kc2V0XzAwMDI6IENoYW5n
ZSBlcmFzZSBvbmUgYmxvY2sgdG8gCj4+IGVuYWJsZSBYSVAgb25jZSIpCj4+IMKgwqDCoMKgIGQ5
YjhhNjdiM2I5NSAoIm10ZDogY2ZpOiBmaXggZGVhZGxvb3AgaW4gY2ZpX2NtZHNldF8wMDAyLmMg
Cj4+IGRvX3dyaXRlX2J1ZmZlciIpCj4+IMKgwqDCoMKgIGVhMDkyZmIzY2U2NiAoIm10ZDogY2Zp
X2NtZHNldF8wMDAyOiBGaXggY29kaW5nIHN0eWxlIGlzc3VlcyIpCj4+Cj4+IHY0LjQuMTg3OiBG
YWlsZWQgdG8gYXBwbHkhIFBvc3NpYmxlIGRlcGVuZGVuY2llczoKPj4gwqDCoMKgwqAgNDg0NGVm
ODAzMDVkICgibXRkOiBjZmlfY21kc2V0XzAwMDI6IEFkZCBzdXBwb3J0IGZvciBwb2xsaW5nIAo+
PiBzdGF0dXMgcmVnaXN0ZXIiKQo+PiDCoMKgwqDCoCBjNjRkNDQxOWExN2MgKCJtdGQ6IGNmaV9j
bWRzZXRfMDAwMjogQ2hhbmdlIGVyYXNlIG9uZSBibG9jayB0byAKPj4gZW5hYmxlIFhJUCBvbmNl
IikKPj4gwqDCoMKgwqAgZDliOGE2N2IzYjk1ICgibXRkOiBjZmk6IGZpeCBkZWFkbG9vcCBpbiBj
ZmlfY21kc2V0XzAwMDIuYyAKPj4gZG9fd3JpdGVfYnVmZmVyIikKPj4gwqDCoMKgwqAgZWEwOTJm
YjNjZTY2ICgibXRkOiBjZmlfY21kc2V0XzAwMDI6IEZpeCBjb2Rpbmcgc3R5bGUgaXNzdWVzIikK
Pj4KPj4KPj4gTk9URTogVGhlIHBhdGNoIHdpbGwgbm90IGJlIHF1ZXVlZCB0byBzdGFibGUgdHJl
ZXMgdW50aWwgaXQgaXMgdXBzdHJlYW0uCj4+Cj4+IEhvdyBzaG91bGQgd2UgcHJvY2VlZCB3aXRo
IHRoaXMgcGF0Y2g/Cj4KPiBZZXMgSSB3aWxsIGRvIGZpeCB0aGUgcGF0Y2ggZm9yIHRoZSB0cmVl
cyBmYWlsZWQgdG8gYXBwbHkgaWYgaXQgd2FzIAo+IHVwc3RyZWFtLgo+Cj4gUmVnYXJkcywKPiBJ
a2VnYW1pCj4KPj4KPj4gLS0gCj4+IFRoYW5rcywKPj4gU2FzaGEKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
