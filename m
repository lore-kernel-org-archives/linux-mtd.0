Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC644C43334
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Jul 2022 06:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=14+/B7wXykwFsltT7Crt3KsVIFVeoXj8TFgEwSIvZnU=; b=Kl54WUBji9j7Br
	xyCmR4juT4+wVp51+zG3pWPHOnweAUD96bdoulxftV12dLofAPtNMUOIbBNQgEWT69RhXkhPivli4
	yJZFhbommewL6DcmNpQtd3wvJO/N/59ZMn7TUkbpMfZJRfESCPkr1GXHOmZEYuNyuyTT1YII8llSl
	AFgWbdnqN+IU/srlyWa54v6IuEx8s1fXFoHtb1PsOoetKknJOKD7JkGptsbhgNK6/P/4C6/tgPMeA
	o+WjCesJ8jDrstJShN+4Aq7IyKMP3XKsW/UlbkkNrjl58PuM4cU6Vgbs5bx0OMJ3TqOodVPZ3LVOL
	f0+qGjufqhrSQmBRM+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAmrP-00GPTi-M5; Mon, 11 Jul 2022 06:25:36 +0000
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAmrI-00GPGJ-T7
	for linux-mtd@lists.infradead.org; Mon, 11 Jul 2022 06:25:31 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.105])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 785E126B9D;
	Mon, 11 Jul 2022 06:25:13 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 11 Jul
 2022 08:25:12 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-104R005ebdefd4d-3105-4c10-b49d-0193a9ed4928,
                    B4A626E929F7F6A388BA3F96B07B1F4CEE71A9BF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <6d019ed1-6408-aa58-4bb1-4d8a54be4878@kaod.org>
Date: Mon, 11 Jul 2022 08:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for W25Q512NW-IQ/IN
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Tudor Ambarus
	<tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>
CC: Jamie Iles <quic_jiles@quicinc.com>, Graeme Gregory
	<quic_ggregory@quicinc.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: ee4a0401-b15c-4abf-aa5d-5a08f516980e
X-Ovh-Tracer-Id: 13999439444030819177
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudejvddguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeffueekkeetueekhffhfeefudffleevhfegffduvdduieejjeduheehudfflefgnecuffhomhgrihhnpeifihhnsghonhgurdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehhedv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_232529_273248_167DA9FE 
X-CRM114-Status: GOOD (  12.75  )
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

T24gNy8xMC8yMiAxNjo1NywgSmFlIEh5dW4gWW9vIHdyb3RlOgo+IEFkZCBzdXBwb3J0IGZvciBX
aW5ib25kIFcyNVE1MTJOVy1JUS9JTgo+IAo+IGRhdGFzaGVldDoKPiBodHRwczovL3d3dy53aW5i
b25kLmNvbS9yZXNvdXJjZS1maWxlcy9XMjVRNTEyTlclMjBSZXZCJTIwMDcxOTIwMjEucGRmCj4g
Cj4gVGVzdCByZXN1bHQgb24gQVNUMjYwMCBTb0MncyBTUEkgY29udHJvbGxlcjoKPiAkIGNhdCAv
c3lzL2J1cy9wbGF0Zm9ybS9kZXZpY2VzLzFlNjIwMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTAvc3Bp
MC4xL3NwaS1ub3IvamVkZWNfaWQKPiBlZjYwMjAKPiAKPiAkIGNhdCAvc3lzL2J1cy9wbGF0Zm9y
bS9kZXZpY2VzLzFlNjIwMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTAvc3BpMC4xL3NwaS1ub3IvbWFu
dWZhY3R1cmVyCj4gd2luYm9uZAo+IAo+ICQgY2F0IC9zeXMvYnVzL3BsYXRmb3JtL2RldmljZXMv
MWU2MjAwMDAuc3BpL3NwaV9tYXN0ZXIvc3BpMC9zcGkwLjEvc3BpLW5vci9wYXJ0bmFtZQo+IHcy
NXE1MTJud3EKPiAKPiAkIGhleGR1bXAgL3N5cy9idXMvcGxhdGZvcm0vZGV2aWNlcy8xZTYyMDAw
MC5zcGkvc3BpX21hc3Rlci9zcGkwL3NwaTAuMS9zcGktbm9yL3NmZHAKPiAwMDAwMDAwIDQ2NTMg
NTA0NCAwMTA2IGZmMDEgMDYwMCAxMDAxIDAwODAgZmYwMAo+IDAwMDAwMTAgMDA4NCAwMjAxIDAw
ZDAgZmYwMCBmZmZmIGZmZmYgZmZmZiBmZmZmCj4gMDAwMDAyMCBmZmZmIGZmZmYgZmZmZiBmZmZm
IGZmZmYgZmZmZiBmZmZmIGZmZmYKPiAqCj4gMDAwMDA4MCAyMGU1IGZmZmIgZmZmZiAxZmZmIGVi
NDQgNmIwOCAzYjA4IGJiNDIKPiAwMDAwMDkwIGZmZmUgZmZmZiBmZmZmIDAwMDAgZmZmZiBlYjQw
IDIwMGMgNTIwZgo+IDAwMDAwYTAgZDgxMCAwMDAwIDAyMzMgMDBhNiBlNzgxIGQ5MTQgNjNlOSAz
Mzc2Cj4gMDAwMDBiMCA3NTdhIDc1N2EgYmRmNyA1Y2Q1IGY3MTkgZmY1ZCA3MGU5IGE1ZjkKPiAw
MDAwMGMwIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZgo+IDAwMDAwZDAg
MGFmZiBmZmYwIGZmMjEgZmZkYwo+IDAwMDAwZDgKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWUgSHl1
biBZb28gPHF1aWNfamFlaHlvb0BxdWljaW5jLmNvbT4KClJldmlld2VkLWJ5OiBDw6lkcmljIExl
IEdvYXRlciA8Y2xnQGthb2Qub3JnPgoKVGhhbmtzLAoKQy4KCj4gLS0tCj4gICBkcml2ZXJzL210
ZC9zcGktbm9yL3dpbmJvbmQuYyB8IDMgKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jIGIv
ZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMKPiBpbmRleCBmZmFhMjQwNTUyNTkuLmQ2ZjFh
M2I3MjY3ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYwo+ICsr
KyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jCj4gQEAgLTEzMyw2ICsxMzMsOSBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gd2luYm9uZF9ub3JfcGFydHNbXSA9IHsKPiAg
IAl7ICJ3MjVtNTEyanYiLCBJTkZPKDB4ZWY3MTE5LCAwLCA2NCAqIDEwMjQsIDEwMjQpCj4gICAJ
CU5PX1NGRFBfRkxBR1MoU0VDVF80SyB8IFNQSV9OT1JfUVVBRF9SRUFEIHwKPiAgIAkJCSAgICAg
IFNQSV9OT1JfRFVBTF9SRUFEKSB9LAo+ICsJeyAidzI1cTUxMm53cSIsIElORk8oMHhlZjYwMjAs
IDAsIDY0ICogMTAyNCwgMTAyNCkKPiArCQlQQVJTRV9TRkRQCj4gKwkJT1RQX0lORk8oMjU2LCAz
LCAweDEwMDAsIDB4MTAwMCkgfSwKPiAgIAl7ICJ3MjVxNTEybndtIiwgSU5GTygweGVmODAyMCwg
MCwgNjQgKiAxMDI0LCAxMDI0KQo+ICAgCQlQQVJTRV9TRkRQCj4gICAJCU9UUF9JTkZPKDI1Niwg
MywgMHgxMDAwLCAweDEwMDApIH0sCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
