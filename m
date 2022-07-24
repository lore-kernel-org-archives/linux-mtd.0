Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FBCC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jul 2022 01:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edTw4D5uodXuc2QBPA8Jkh5qlYuCgrBJkqFA4nOOwJc=; b=Ltn4ehtS4HYzMUmPf2mZlJa33D
	1YmK3ob1U9bRMzZlZE1xdGr9Um2mdfCz6TsQgdQ9SP78dKnTn1lSHD0kvprio5SJ36v0tf1JD7p5E
	f/P2WL+06ZOp7jTAs9hX62l4fkLT08IDdue8aS6Uul8dS5BuCteuhDWi6q556GnEM4ImDt7zxK+ku
	k0TvtQ1gnwoJ0Wb+FoYnSkBRrsjNpFrb9WdfYS4HjuqCmABj+16Ymgl/ujfbhWk9VXSCx/62Dz6e+
	Cw8X/JkZbJC1JNw8DYLk/fWLg6xdDn7CcFFcioDH2OXfMbhvIkQK/NQgvqKE++Uv4xw5PGpGldFHU
	dwBQvi5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFQNb-009PJn-OL; Sun, 24 Jul 2022 01:25:59 +0000
Received: from out28-76.mail.aliyun.com ([115.124.28.76])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFQNZ-009PHK-08
	for linux-mtd@lists.infradead.org; Sun, 24 Jul 2022 01:25:58 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.09236334|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.030501-0.019971-0.949528;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047206;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=23;RT=23;SR=0;TI=SMTPD_---.Oc.dXjP_1658625951;
Received: from 192.168.10.152(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Oc.dXjP_1658625951)
          by smtp.aliyun-inc.com;
          Sun, 24 Jul 2022 09:25:52 +0800
Subject: Re: [PATCH 0/3] Add SFC support for Ingenic SoCs.
To: Tomasz Maciej Nowak <tmn505@gmail.com>, tudor.ambarus@microchip.com,
 p.yadav@ti.com, michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aidanmacdonald.0x0@gmail.com,
 paul@crapouillou.net, dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
 rick.tyliu@ingenic.com, jinghui.liu@ingenic.com, sernia.zhou@foxmail.com,
 reimu@sudomaker.com
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
 <e700eecf-e7e0-c2e7-9e20-b5d20df4b65f@gmail.com>
From: Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <36084c97-b675-1400-52da-f74bf4b61930@wanyeetech.com>
Date: Sun, 24 Jul 2022 09:25:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e700eecf-e7e0-c2e7-9e20-b5d20df4b65f@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_182557_234178_1E621608 
X-CRM114-Status: GOOD (  11.38  )
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

SGkgVG9tYXN6LAoKT24gMjAyMi83LzIzIOS4i+WNiDEwOjQ3LCBUb21hc3ogTWFjaWVqIE5vd2Fr
IHdyb3RlOgo+IFcgZG5pdSAyMi4wNy4yMDIyIG/CoDE4OjQ4LCDlkajnkLDmnbAgKFpob3UgWWFu
amllKSBwaXN6ZToKPj4gMS5Vc2UgdGhlIHNwaS1tZW0gcG9sbCBzdGF0dXMgQVBJcyBpbiBTUEkt
Tk9SIHRvIHJlZHVjZSBDUFUgbG9hZC4KPj4gMi5BZGQgU0ZDIHN1cHBvcnQgZm9yIHRoZSBYMTAw
MCBTb0MsIHRoZSBYMTYwMCBTb0MsIGFuZCB0aGUgWDIwMDAgU29DIGZyb20gSW5nZW5pYy4KPj4K
Pj4gTGl1IEppbmdodWkgYW5kIEFpZGFuIE1hY0RvbmFsZCBwcm92aWRlZCBhIGxvdCBvZiBhc3Np
c3RhbmNlIGR1cmluZyB0aGUgZGV2ZWxvcG1lbnQgb2YgdGhpcyBkcml2ZXIuCj4+Cj4+IOWRqOeQ
sOadsCAoWmhvdSBZYW5qaWUpICgzKToKPj4gICAgbXRkOiBzcGktbm9yOiBVc2UgdGhlIHNwaS1t
ZW0gcG9sbCBzdGF0dXMgQVBJcy4KPj4gICAgZHQtYmluZGluZ3M6IFNQSTogQWRkIEluZ2VuaWMg
U0ZDIGJpbmRpbmdzLgo+PiAgICBTUEk6IEluZ2VuaWM6IEFkZCBTRkMgc3VwcG9ydCBmb3IgSW5n
ZW5pYyBTb0NzLgo+Pgo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9pbmdlbmljLHNm
Yy55YW1sICAgICAgIHwgIDY0ICsrCj4+ICAgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNDIgKy0KPj4gICBkcml2ZXJzL3NwaS9LY29uZmlnICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOSArCj4+ICAgZHJpdmVycy9zcGkvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+PiAgIGRyaXZlcnMv
c3BpL3NwaS1pbmdlbmljLXNmYy5jICAgICAgICAgICAgICAgICAgICAgIHwgNjYyICsrKysrKysr
KysrKysrKysrKysrKwo+PiAgIDUgZmlsZXMgY2hhbmdlZCwgNzY4IGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc3BpL2luZ2VuaWMsc2ZjLnlhbWwKPj4gICBjcmVhdGUgbW9kZSAxMDA3
NTUgZHJpdmVycy9zcGkvc3BpLWluZ2VuaWMtc2ZjLmMKPj4KPiBFdmVuIHRvdWdoIGl0J3Mgc3Rp
bGwgZWFybHkgaW4gcmV2aXNpb24gcHJvY2VzcywgSSdsbCBhZGQgbXkKPiBUZXN0ZWQtYnk6IFRv
bWFzeiBNYWNpZWogTm93YWsgPHRtbjUwNUBnbWFpbC5jb20+Cj4KPiBUaGUgdGVzdCB3YXMgcGVy
Zm9ybWVkIHdpdGggRGFtYWkgRE02MjkxQSBTb0Mgd2hpY2ggaXMgYSBJbmdlbmljIFgxMDAwIElQ
Cj4gYnV0IHdpdGggMjU2IE1pQiBSQU0uIE5vIGJ1Z3MgeWV0IG9ic2VydmVkIG9uIG15IHNpZGUu
CgoKVGhhbmtzIGZvciB5b3UgdGVzdCEKCgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
