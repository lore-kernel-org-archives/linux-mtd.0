Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACE3C44512
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2026 13:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L58csx2AT0LzA/Aixn66qC9NNh/v3vNLKXuxqInOnyg=; b=bW3ObGvG9kZxXWabTbHyUuQ7je
	CnEC0DtTeIha5QDhp2oDCFKCYRz2ljNY/z+Kr+9IJ5BiH2B2J/02QNfWd8yQm3iMLl4BcOlMmZco/
	e0uix18NM5ufKdedWO6tKfOKKamINMOlrIrYhR0mu1v5D8Ra2tW715+C99AgIYBewpomEzE88ID+E
	99bqedV8BTyE0Vo3N7Nd5aDlfko46M+XSKM8mCTQchXuvJ5UEPjrzrWgYuBO/eyWf8dQ2rjXk+8oc
	UVa3VarM4Ige9xAF6nRrTUqilEdCEzh299u6tTrYrDE1xCwOvXOM4aHmYWPqdEMh/JEIoCECtz4P7
	fCIJ4eJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMC6-0000000HOLt-1RaX;
	Thu, 16 Jul 2026 13:32:06 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMC2-0000000HOKJ-421K
	for linux-mtd@lists.infradead.org;
	Thu, 16 Jul 2026 13:32:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cR6v39GwN2FtvxiI4Ocw284F8Ll4ovAOvUUd0k6wOoI=;
	b=M85DbeYodJNQo8awsFXH07LXVkLcspjU1igxnma94gOm5A85O5AIomJGV7iicA1hU+5vfd5pS
	s5i49yf1Q4tYnAnMRdBrhH7LalXINpidBKfMEHrvMW5RTuSdcimADb7PDNIUFCv314WH7+pjCvW
	Mc09DNEyt9tgqU4va3JBMCA=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h1DH10Pg1zKm52;
	Thu, 16 Jul 2026 21:22:21 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 97E43402AB;
	Thu, 16 Jul 2026 21:31:42 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Jul 2026 21:31:41 +0800
Subject: Re: [PATCH] mtd: part: reject MTDPART_OFS_RETAIN in
 mtd_add_partition()
To: zhouminqiang <zhouminqiang2@huawei.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <Artem.Bityutskiy@nokia.com>,
	<lumag@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yangerkun@huawei.com>, <yi.zhang@huawei.com>
References: <20260716131432.2355777-1-zhouminqiang2@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3789ac0c-d9b0-99f8-4e5e-e10820e6518d@huawei.com>
Date: Thu, 16 Jul 2026 21:31:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260716131432.2355777-1-zhouminqiang2@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_063203_328332_30D84106 
X-CRM114-Status: GOOD (  22.01  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNi83LzE2IDIxOjE0LCB6aG91bWlucWlhbmcg0LS1wDoKPiBtdGRfYWRkX3BhcnRpdGlv
bigpIGRvZXMgbm90IHJlamVjdCB0aGUgc3BlY2lhbCBvZmZzZXQgdmFsdWUKPiBNVERQQVJUX09G
U19SRVRBSU4gKC0zKSwgd2hpY2ggbGVhZHMgdG8gYSBXQVJOX09OIGluCj4gYWRkX210ZF9kZXZp
Y2UoKSB3aGVuIGNhbGxlZCB0aHJvdWdoIHRoZSBCTEtQRyBpb2N0bCBvbiBOQU5ECj4gZGV2aWNl
cy4gVGhlIFJFVEFJTiB2YWx1ZSBkZXBlbmRzIG9uIGN1cl9vZmZzZXQgYmVpbmcgdGhlIGVuZCBv
Zgo+IHRoZSBwcmV2aW91cyBwYXJ0aXRpb24sIGJ1dCBpbiB0aGUgZHluYW1pYyBwYXJ0aXRpb24g
cGF0aAo+IGN1cl9vZmZzZXQgZXF1YWxzIHRoZSBvZmZzZXQgYXJndW1lbnQgaXRzZWxmLCBjYXVz
aW5nIHVuZGVmaW5lZAo+IGJlaGF2aW9yLgo+IAo+IENvbW1pdCA1ZGFhN2IyMTQ5NmEgKCJtdGQ6
IHByZXBhcmUgcGFydGl0aW9uIGFkZCBhbmQgZGVsIGZ1bmN0aW9ucwo+IGZvciBpb2N0bCByZXF1
ZXN0cyIpIGludHJvZHVjZWQgbXRkX2FkZF9wYXJ0aXRpb24oKSBhbmQgY29ycmVjdGx5Cj4gcmVq
ZWN0ZWQgTVREUEFSVF9PRlNfQVBQRU5EICgtMSkgYW5kIE1URFBBUlRfT0ZTX05YVEJMSyAoLTIp
LAo+IHNpbmNlIHRob3NlIHNwZWNpYWwgb2Zmc2V0cyByZWx5IG9uIGN1cl9vZmZzZXQgdHJhY2tp
bmcgdGhlCj4gcHJldmlvdXMgcGFydGl0aW9uJ3MgZW5kLiBIb3dldmVyLCBjb21taXQgMWEzMTM2
OGJmOTJlICgibXRkOiBhZGQgYSBmbGFncwo+IGZvciBwYXJ0aXRpb25zIHdoaWNoIHNob3VsZCBq
dXN0IGxlYXZlIHNtdGguIGFmdGVyIHRoZW0iKQo+IGxhdGVyIGFkZGVkIE1URFBBUlRfT0ZTX1JF
VEFJTiAoLTMpIGZvciB0aGUgc3RhdGljCj4gcGFydGl0aW9uIHRhYmxlIHBhdGggd2l0aG91dCB1
cGRhdGluZyBtdGRfYWRkX3BhcnRpdGlvbigpIHRvCj4gYWxzbyByZWplY3QgdGhpcyB2YWx1ZS4K
PiAKPiBXaXRoIG9mZnNldD0tMyBwYXNzZWQgdmlhIEJMS1BHLCB0aGUgUkVUQUlOIHNpemUgY2Fs
Y3VsYXRpb24gaW4KPiBhbGxvY2F0ZV9wYXJ0aXRpb24oKSB1bmRlcmZsb3dzIChwYXJlbnRfc2l6
ZSAtIDB4RkZGRkZGRkZGRkZGRkZGRAo+ID0gcGFyZW50X3NpemUgKyAzKS4gSWYgdGhlIHVuZGVy
ZmxvdyByZXN1bHQgZG9lcyBub3QgYXBwZWFyIHRvCj4gbGVhdmUgZW5vdWdoIHNwYWNlLCBhbGxv
Y2F0ZV9wYXJ0aXRpb24oKSBqdW1wcyB0byBvdXRfcmVnaXN0ZXIgdmlhCj4gZ290bywgc2tpcHBp
bmcgZXJhc2VzaXplIGluaXRpYWxpemF0aW9uLiBUaGlzIHJlc3VsdHMgaW4KPiBlcmFzZXNpemU9
MCwgd2hpY2ggdHJpZ2dlcnM6Cj4gCj4gV0FSTl9PTigoIW10ZC0+ZXJhc2VzaXplIHx8ICFtYXN0
ZXItPl9lcmFzZSkgJiYKPiAJCSEobXRkLT5mbGFncyAmIE1URF9OT19FUkFTRSkpCj4gCj4gaW4g
YWRkX210ZF9kZXZpY2UoKS4gSWYgdGhlIHVuZGVyZmxvdyByZXN1bHQgYXBwZWFycyB0byBsZWF2
ZQo+IGVub3VnaCBzcGFjZSwgYSBib2d1cyBwYXJ0aXRpb24gc2l6ZSBpcyBjYWxjdWxhdGVkLCBi
dXQgdGhlCj4gIm91dCBvZiByZWFjaCIgc2FuaXR5IGNoZWNrIGNhdGNoZXMgdGhlIGludmFsaWQg
b2Zmc2V0IGFuZAo+IGNyZWF0ZXMgYSBkaXNhYmxlZCBlbXB0eSBwYXJ0aXRpb24gKG9mZnNldD0w
LCBzaXplPTApIGluc3RlYWQKPiBvZiByZXR1cm5pbmcgYW4gZXJyb3IuCj4gCj4gRml4IHRoaXMg
YnkgYWRkaW5nIE1URFBBUlRfT0ZTX1JFVEFJTiB0byB0aGUgcmVqZWN0aW9uIGxpc3QgaW4KPiBt
dGRfYWRkX3BhcnRpdGlvbigpLCBjb25zaXN0ZW50IHdpdGggdGhlIGV4aXN0aW5nIGhhbmRsaW5n
IG9mCj4gQVBQRU5EIGFuZCBOWFRCTEsuCj4gCj4gRml4ZXM6IDFhMzEzNjhiZjkyZSAoIm10ZDog
YWRkIGEgZmxhZ3MgZm9yIHBhcnRpdGlvbnMgd2hpY2ggc2hvdWxkIGp1c3QgbGVhdmUgc210aC4g
YWZ0ZXIgdGhlbSIpCj4gCj4gU2lnbmVkLW9mZi1ieTogemhvdW1pbnFpYW5nIDx6aG91bWlucWlh
bmcyQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL210ZC9tdGRwYXJ0LmMgfCAzICsrLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKUmV2aWV3
ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL210ZHBhcnQuYyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+IGlu
ZGV4IDc5NWE5NGU2YjQ4Mi4uMTFjYWI3NzdhMWFjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRk
L210ZHBhcnQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+IEBAIC0yNTUsNyArMjU1
LDggQEAgaW50IG10ZF9hZGRfcGFydGl0aW9uKHN0cnVjdCBtdGRfaW5mbyAqcGFyZW50LCBjb25z
dCBjaGFyICpuYW1lLAo+ICAgCj4gICAJLyogdGhlIGRpcmVjdCBvZmZzZXQgaXMgZXhwZWN0ZWQg
Ki8KPiAgIAlpZiAob2Zmc2V0ID09IE1URFBBUlRfT0ZTX0FQUEVORCB8fAo+IC0JICAgIG9mZnNl
dCA9PSBNVERQQVJUX09GU19OWFRCTEspCj4gKwkgICAgb2Zmc2V0ID09IE1URFBBUlRfT0ZTX05Y
VEJMSyB8fAo+ICsJICAgIG9mZnNldCA9PSBNVERQQVJUX09GU19SRVRBSU4pCj4gICAJCXJldHVy
biAtRUlOVkFMOwo+ICAgCj4gICAJaWYgKGxlbmd0aCA9PSBNVERQQVJUX1NJWl9GVUxMKQo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
