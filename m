Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7F8CAC583
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Sep 2025 06:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n7thsO9uO6xe34Fu0kwxKpwr0ykJfvH9H+/zAM9f5yE=; b=RwfW06SOWaQAEO
	05GDy35C3l2E4oOucLfKdT/lDhgHq+W0RFHvwcS07kOc6VoFA4X0mEqCnpODsw5bjimqHvuKltJZO
	EdsX8AqU7bn8lKeWXBDLyVDX8NNCN54uWxV6zgDadKGhXARau+QtgfOksR/9VmHWZGowf8Zhx281V
	k0V12uYxjy9c+1XHOLxGsMClKhqX/M/st8MzoB4jUiShXPoPoYLRQKUItwtqwslBRzR5+4kRqORqw
	K2bCvwhE+yCzTjIuVoi2LTOcVm9Wr/NJJCDVF7BIF+mlzSPwdweLbmYzS8Xb/sL5I7bNUG6cscmpp
	eMTsBxw0CAfGLq08WBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwahk-00000001D12-3174;
	Thu, 11 Sep 2025 06:22:48 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwahg-00000001Cyu-2rPg
	for linux-mtd@lists.infradead.org;
	Thu, 11 Sep 2025 06:22:46 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58B6MVLl313999;
	Thu, 11 Sep 2025 01:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757571751;
	bh=VV4j2uohNmTsnTHXLlqzjhM3fCN2LIgoOEGp00OVD7w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MhCjIrjMDrZ7MCBSArxYv1pVgWnd+XuITrtTYVf7xa148UBjy1hmHMOVfUd6+JcZQ
	 zm+76Oj9z2+0xqLUMb4CzKIa6h6roipL+VX6eW1ba0cxwnuIp85n99S8cU2bkCcpTw
	 atcXaidA1C5Qj5lVrJwUqJeroXpXyuaMpu86vY7o=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58B6MVRr857555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 01:22:31 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 01:22:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 01:22:31 -0500
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58B6MRVf1685850;
	Thu, 11 Sep 2025 01:22:28 -0500
Message-ID: <454e092d-5b75-4758-a0e9-dfbb7bf271d7@ti.com>
Date: Thu, 11 Sep 2025 11:52:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: core: always verify OOB offset in
 mtd_check_oob_ops()
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger
	<richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, Gabor Juhos
	<j4g8y7@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, Daniel Golle <daniel@makrotopia.org>,
        <s-k6@ti.com>
References: <20250901-mtd-validate-ooboffs-v2-1-c1df86a16743@gmail.com>
 <175708415877.334139.11409801733118104229.b4-ty@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <175708415877.334139.11409801733118104229.b4-ty@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_232244_808340_A3D10328 
X-CRM114-Status: GOOD (  14.44  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpPbiAwNS8wOS8yNSAyMDoyNSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBPbiBNb24s
IDAxIFNlcCAyMDI1IDE2OjI0OjM1ICswMjAwLCBHYWJvciBKdWhvcyB3cm90ZToKPj4gVXNpbmcg
YW4gT09CIG9mZnNldCBwYXN0IGVuZCBvZiB0aGUgYXZhaWxhYmxlIE9PQiBkYXRhIGlzIGludmFs
aWQsCj4+IGlycmVnYXJkbGVzcyBvZiB3aGV0aGVyIHRoZSAnb29ibGVuJyBpcyBzZXQgaW4gdGhl
IG9wcyBvciBub3QuIE1vdmUKPj4gdGhlIHJlbGV2YW50IGNoZWNrIG91dCBmcm9tIHRoZSBpZiBz
dGF0ZW1lbnQgdG8gYWx3YXlzIHZlcmlmeSB0aGF0Lgo+Pgo+PiBUaGUgJ29vYnRlc3QnIG1vZHVs
ZSBleGVjdXRlcyBmb3VyIHRlc3RzIHRvIHZlcmlmeSBob3cgcmVhZGluZy93cml0aW5nCj4+IE9P
QiBkYXRhIHBhc3QgZW5kIG9mIHRoZSBkZXZpY2VzIGlzIGhhbmRsZWQuIEl0IGV4cGVjdHMgZXJy
b3JzIGluIGNhc2UKPj4gb2YgdGhlc2UgdGVzdHMsIGJ1dCB0aGlzIGV4cGVjdGF0aW9uIGZhaWxz
IGluIHRoZSBsYXN0IHR3byB0ZXN0cyBvbgo+PiBNVEQgZGV2aWNlcywgd2hpY2ggaGF2ZSBubyBP
T0IgYnl0ZXMgYXZhaWxhYmxlLgo+Pgo+PiBbLi4uXQo+IAo+IEFwcGxpZWQgdG8gbXRkL25leHQs
IHRoYW5rcyEKPiAKPiBbMS8xXSBtdGQ6IGNvcmU6IGFsd2F5cyB2ZXJpZnkgT09CIG9mZnNldCBp
biBtdGRfY2hlY2tfb29iX29wcygpCj4gICAgICAgIGNvbW1pdDogYmY3ZDA1NDNiMjYwMmJlNWNi
NDUwZDhlYzVhODcxMDc4NzgwNmY4OAoKSSdtIHNlZWluZyBhIGZhaWx1cmUgaW4gU1BJIE5PUiBm
bGFzaGVzIGR1ZSB0byB0aGlzIHBhdGNoOgooVGVzdGVkIG9uIEFNNjJ4IFNLIHdpdGggUzI4SFM1
MTJUIE9TUEkgTk9SIGZsYXNoKQoKcm9vdEBhbTYyeHgtZXZtOn4jIHVuYW1lIC1hCkxpbnV4IGFt
NjJ4eC1ldm0gNi4xNy4wLXJjMS0wMDAxMS1nYmY3ZDA1NDNiMjYwICMzIFNNUCBQUkVFTVBUIFdl
ZCBTZXAgCjEwIDIwOjQ0OjM0IElTVCAyMDI1IGFhcmNoNjQgR05VL0xpbnV4CnJvb3RAYW02Mnh4
LWV2bTp+IyBkbWVzZyB8IGdyZXAgbXRkClsgICAgOC4wMTgxMDddIEkvTyBlcnJvciwgZGV2IG10
ZGJsb2NrNiwgc2VjdG9yIDAgb3AgMHgwOihSRUFEKSBmbGFncyAKMHg4MDcwMCBwaHlzX3NlZyAx
IHByaW8gY2xhc3MgMgpbICAgIDguMDMyODA2XSBJL08gZXJyb3IsIGRldiBtdGRibG9jazYsIHNl
Y3RvciAwIG9wIDB4MDooUkVBRCkgZmxhZ3MgCjB4MCBwaHlzX3NlZyAxIHByaW8gY2xhc3MgMgpb
ICAgIDguMDQzMjI5XSBCdWZmZXIgSS9PIGVycm9yIG9uIGRldiBtdGRibG9jazYsIGxvZ2ljYWwg
YmxvY2sgMCwgYXN5bmMgCnBhZ2UgcmVhZApbICAgIDguMDU1MDgyXSBJL08gZXJyb3IsIGRldiBt
dGRibG9jazQsIHNlY3RvciAwIG9wIDB4MDooUkVBRCkgZmxhZ3MgCjB4ODA3MDAgcGh5c19zZWcg
MSBwcmlvIGNsYXNzIDIKWyAgICA4LjA2NTg4M10gSS9PIGVycm9yLCBkZXYgbXRkYmxvY2s0LCBz
ZWN0b3IgMCBvcCAweDA6KFJFQUQpIGZsYWdzIAoweDAgcGh5c19zZWcgMSBwcmlvIGNsYXNzIDIK
WyAgICA4LjA3NTAyMl0gQnVmZmVyIEkvTyBlcnJvciBvbiBkZXYgbXRkYmxvY2s0LCBsb2dpY2Fs
IGJsb2NrIDAsIGFzeW5jIApwYWdlIHJlYWQKWyAgICA4LjM4MTIxM10gSS9PIGVycm9yLCBkZXYg
bXRkYmxvY2s2LCBzZWN0b3IgMCBvcCAweDA6KFJFQUQpIGZsYWdzIAoweDgwNzAwIHBoeXNfc2Vn
IDEgcHJpbyBjbGFzcyAyClsgICAgOC4zOTQ2MjFdIEkvTyBlcnJvciwgZGV2IG10ZGJsb2NrMiwg
c2VjdG9yIDAgb3AgMHgwOihSRUFEKSBmbGFncyAKMHg4MDcwMCBwaHlzX3NlZyAxIHByaW8gY2xh
c3MgMgpbICAgIDguMzk0NzA0XSBJL08gZXJyb3IsIGRldiBtdGRibG9jazIsIHNlY3RvciAwIG9w
IDB4MDooUkVBRCkgZmxhZ3MgCjB4MCBwaHlzX3NlZyAxIHByaW8gY2xhc3MgMgpbICAgIDguMzk0
NzE0XSBCdWZmZXIgSS9PIGVycm9yIG9uIGRldiBtdGRibG9jazIsIGxvZ2ljYWwgYmxvY2sgMCwg
YXN5bmMgCnBhZ2UgcmVhZApbICAgIDguNDEwMTUyXSBJL08gZXJyb3IsIGRldiBtdGRibG9jazAs
IHNlY3RvciAwIG9wIDB4MDooUkVBRCkgZmxhZ3MgCjB4ODA3MDAgcGh5c19zZWcgMSBwcmlvIGNs
YXNzIDIKWyAgICA4LjQ1NjA2NF0gSS9PIGVycm9yLCBkZXYgbXRkYmxvY2swLCBzZWN0b3IgMCBv
cCAweDA6KFJFQUQpIGZsYWdzIAoweDAgcGh5c19zZWcgMSBwcmlvIGNsYXNzIDIKWyAgICA4LjQ2
NTc3NF0gQnVmZmVyIEkvTyBlcnJvciBvbiBkZXYgbXRkYmxvY2swLCBsb2dpY2FsIGJsb2NrIDAs
IGFzeW5jIApwYWdlIHJlYWQKWyAgICA4LjQ2OTc3MV0gSS9PIGVycm9yLCBkZXYgbXRkYmxvY2s2
LCBzZWN0b3IgMCBvcCAweDA6KFJFQUQpIGZsYWdzIAoweDAgcGh5c19zZWcgMSBwcmlvIGNsYXNz
IDIKWyAgICA4LjQ2OTgwNF0gQnVmZmVyIEkvTyBlcnJvciBvbiBkZXYgbXRkYmxvY2s2LCBsb2dp
Y2FsIGJsb2NrIDAsIGFzeW5jIApwYWdlIHJlYWQKWyAgICA4LjUwNTg2Nl0gQnVmZmVyIEkvTyBl
cnJvciBvbiBkZXYgbXRkYmxvY2s1LCBsb2dpY2FsIGJsb2NrIDAsIGFzeW5jIApwYWdlIHJlYWQK
WyAgICA4LjUyMjY2NV0gQnVmZmVyIEkvTyBlcnJvciBvbiBkZXYgbXRkYmxvY2s0LCBsb2dpY2Fs
IGJsb2NrIDAsIGFzeW5jIApwYWdlIHJlYWQKWyAgICA4Ljg0NTU3Ml0gQnVmZmVyIEkvTyBlcnJv
ciBvbiBkZXYgbXRkYmxvY2szLCBsb2dpY2FsIGJsb2NrIDAsIGFzeW5jIApwYWdlIHJlYWQKWyAg
ICA4Ljg1NTkzOF0gQnVmZmVyIEkvTyBlcnJvciBvbiBkZXYgbXRkYmxvY2sxLCBsb2dpY2FsIGJs
b2NrIDAsIGFzeW5jIApwYWdlIHJlYWQKWyAgICA4Ljg3ODI5Ml0gQnVmZmVyIEkvTyBlcnJvciBv
biBkZXYgbXRkYmxvY2syLCBsb2dpY2FsIGJsb2NrIDAsIGFzeW5jIApwYWdlIHJlYWQKcm9vdEBh
bTYyeHgtZXZtOn4jIGhleGR1bXAgL2Rldi9tdGQ2CmhleGR1bXA6IC9kZXYvbXRkNjogSW52YWxp
ZCBhcmd1bWVudApyb290QGFtNjJ4eC1ldm06fiMKCgpSZXZlcnRpbmcgdGhpcyB3b3JrcyBmaW5l
OgoKcm9vdEBhbTYyeHgtZXZtOn4jIHVuYW1lIC1hCkxpbnV4IGFtNjJ4eC1ldm0gNi4xNy4wLXJj
NS1uZXh0LTIwMjUwOTEwLTAwMDAxLWc1ZjIxNmNkZjI3NjQgIzUgU01QIApQUkVFTVBUIFRodSBT
ZXAgMTEgMTE6Mzg6MDYgSVNUIDIwMjUgYWFyY2g2NCBHTlUvTGludXgKcm9vdEBhbTYyeHgtZXZt
On4jIGRtZXNnIHwgZ3JlcCBtdGQKcm9vdEBhbTYyeHgtZXZtOn4jIGhleGR1bXAgL2Rldi9tdGQ2
CjAwMDAwMDAgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmCioKMDA0MDAw
MApyb290QGFtNjJ4eC1ldm06fiMKClJlZ2FyZHMsClNhbnRob3NoLgoKPiAKPiBQYXRjaGUocykg
c2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCj4gcGFydCBv
ZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbiku
Cj4gCj4gS2luZCByZWdhcmRzLAo+IE1pcXXDqGwKPiAKPiAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
