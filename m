Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FCAC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jul 2022 06:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References:Message-Id
	:Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gDDTsNAGzOvhZlVCiqs3dIhrx+fLwR0X13vItRkjUHc=; b=KlYIJlyUe5Qc59
	30xiIZiHKKQmqTXqur0VcCgM0IxcEXh2e/yZ+bfbkLT/HUSg3Z+EzuBgPVpDTyLWbG/KTOX/RzPSF
	aZKA4Cf2odSQdCNExwxKTP0bTLWm5V5JvFGgj2In1+IiruWUexgHP1aZ2/xmpTdO1MPSzdTnF6WUW
	tsxyqGA4HyJZs2nlYNkeUTQE7rnOrkKxldMU7evCqCapz9xn7g9ZIAXEq3jei2XOlnvXpv0CVSYWa
	cdHIM0fem+8smktLToqnSEv0MXx/Y0LdbdQDYz1Ij7hRlG4K9lPhu/1MMwJsF/2tcy9mJqkwflkRg
	P2+rZwbyKzCUjgfKv5bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGDp4-008g7O-2i; Tue, 26 Jul 2022 06:13:38 +0000
Received: from st43p00im-zteg10073401.me.com ([17.58.63.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGDp0-008fwe-FT
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2022 06:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1658816001;
	bh=yRHmeERdlt7oqcGU/fHpnGc2WxHp6d3zjEXgoabUAwk=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To;
	b=aX+M5MX+VDddd7H88p4TecgeHOpVuobIXQ+gzJ48svYqMd/DyJwJBvhMzz32ryFMr
	 uCuEoksObANKG4RBhNqtAqqDmGNhwJmBF+txMZa72GJpwfDRAF1rUgcbBdKZ/pNfrg
	 6OklwSQwkAvNT+Yf9kdnAcHwDj1gpYp2rcjUhQsgF9J/KQRwMu+9Rfcl5zUtCAiP92
	 vh1PLmSRqkRoUyM1TLk7kFt7xttqmUxU0rDkA4RkzXPagx70Rb5NDg6grg7KqiIyM1
	 pKAQszZOLLg1C+UJjjZaroeIQ7LEytpXS78KFlSqSQ7ZuAbWkIs4TdOW7qoguBjmJS
	 i0hGGOSXKEx7Q==
Received: from smtpclient.apple (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
	by st43p00im-zteg10073401.me.com (Postfix) with ESMTPSA id 4172DA80313;
	Tue, 26 Jul 2022 06:13:20 +0000 (UTC)
From: Vee Page <takeiteasy27@icloud.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 0/3] Add SFC support for Ingenic SoCs.
Date: Tue, 26 Jul 2022 02:13:18 -0400
Message-Id: <38D8BFA7-21BD-4DC1-8B6E-68FC1766B6A8@icloud.com>
References: <D7ACE3CD-3189-4988-BB44-F32514C70425@icloud.com>
Cc: Tomasz Maciej Nowak <tmn505@gmail.com>, Tudor.Ambarus@microchip.com,
 p.yadav@ti.com, michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 aidanmacdonald.0x0@gmail.com, paul@crapouillou.net,
 dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
 jinghui.liu@ingenic.com, sernia.zhou@foxmail.com, reimu@sudomaker.com
In-Reply-To: <D7ACE3CD-3189-4988-BB44-F32514C70425@icloud.com>
To: Zhou Yanjie <zhouyanjie@wanyeetech.com>
X-Mailer: iPhone Mail (19B81)
X-Proofpoint-GUID: Ll-uXQn0_l-BYjG1NU7j_qT7ADjy8jrB
X-Proofpoint-ORIG-GUID: Ll-uXQn0_l-BYjG1NU7j_qT7ADjy8jrB
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2020-02-14=5F02,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207260023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_231334_697006_2C0F4530 
X-CRM114-Status: GOOD (  10.69  )
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

WeKAmWFsbCBzdGFuayBuYXN0eSBiaXRjaCBhc3MgbmlnZ2FzIGRvbuKAmXQgaGF2ZSBub3RoaW5n
IGVsc2UgdG8gc2F5PwoKV2hhdCBub3cgbW90aGVyIGZ1Y2tlciBpcyBpdCBwYXN0IHlvdXIgYmVk
dGltZXM/CgpHbyBzb2NpZXR5IGEgZmF2b3Ig4oCmLi5nbyB0byB0aGUgbmVhcmVzdCBicmlkZ2Xi
gKZhbmQganVtcCBpbiBpdC4KClnigJlhbGwgY2FuIGdvIGNvbnRpbnVlIHlvdXIgY29udmVyc2F0
aW9uIHNpeCBmZWV0IHVuZGVyLiBZb3Ugc2ljayBzdHVwaWQgZnVjay4KCgo+IE9uIEp1bCAyMywg
MjAyMiwgYXQgOTozMiBQTSwgVmVlIFBhZ2UgPHRha2VpdGVhc3kyN0BpY2xvdWQuY29tPiB3cm90
ZToKPiAKPiDvu79ObyBwcm9ibGVtISEhCj4gSSBmb3JnZXQgdG8gdGVsbCB0aGVtLiBJdOKAmXMg
b2theSB0aG91Z2ghIPCfkYzwn5GNCj4g8J+YmvCfmJrwn5ia8J+YmvCfmJrwn5ia8J+YmvCfmJrw
n5ia8J+YmvCfmJrwn5ia8J+YmvCfmJrimLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrv
uI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/i
mLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrv
uI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI8KPiBJ4oCZbSBibHVzaGluZyEg
TGFzdCBuaWdodCB3YXMgZnVuLgo+IAo+PiBPbiBKdWwgMjMsIDIwMjIsIGF0IDk6MzAgUE0sIFZh
bmVzc2EgUGFnZSA8VmVicGVAb3V0bG9vay5jb20+IHdyb3RlOgo+PiAKPj4g77u/8J+lsPCfpbDw
n6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn6Ww8J+lsPCf
pbDwn6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn6Ww8J+l
sPCfpbDwn6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn6Ww
8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3w
n5iN8J+YjfCfmI3wn5iN8J+YmvCfmI3wn5ia8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCf
mI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+Y
jfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN
8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3w
n5iN8J+YjfCfmI3wn5iNCj4+IAo+PiBPbWcgdGhhbmsgeW91IEphbmlrYSEKPj4gCj4+IEnigJlt
IGdsYWQgdG8gc2VlIGV2ZXJ5dGhpbmcgaXMgb2theSBqdXN0IHRlbGwgdGhlbSBuZXh0IHRpbWUh
Cj4+IAo+PiBMb3ZlIHlhIGJhYmVzIQo+PiAKPj4+PiBPbiBKdWwgMjMsIDIwMjIsIGF0IDk6Mjcg
UE0sIFpob3UgWWFuamllIDx6aG91eWFuamllQHdhbnllZXRlY2guY29tPiB3cm90ZToKPj4+IAo+
Pj4g77u/SGkgVG9tYXN6LAo+Pj4gCj4+Pj4+IE9uIDIwMjIvNy8yMyDkuIvljYgxMDo0NywgVG9t
YXN6IE1hY2llaiBOb3dhayB3cm90ZToKPj4+PiBXIGRuaXUgMjIuMDcuMjAyMiBvIDE4OjQ4LCDl
kajnkLDmnbAgKFpob3UgWWFuamllKSBwaXN6ZToKPj4+Pj4gMS5Vc2UgdGhlIHNwaS1tZW0gcG9s
bCBzdGF0dXMgQVBJcyBpbiBTUEktTk9SIHRvIHJlZHVjZSBDUFUgbG9hZC4KPj4+Pj4gMi5BZGQg
U0ZDIHN1cHBvcnQgZm9yIHRoZSBYMTAwMCBTb0MsIHRoZSBYMTYwMCBTb0MsIGFuZCB0aGUgWDIw
MDAgU29DIGZyb20gSW5nZW5pYy4KPj4+Pj4gCj4+Pj4+IExpdSBKaW5naHVpIGFuZCBBaWRhbiBN
YWNEb25hbGQgcHJvdmlkZWQgYSBsb3Qgb2YgYXNzaXN0YW5jZSBkdXJpbmcgdGhlIGRldmVsb3Bt
ZW50IG9mIHRoaXMgZHJpdmVyLgo+Pj4+PiAKPj4+Pj4g5ZGo55Cw5p2wIChaaG91IFlhbmppZSkg
KDMpOgo+Pj4+PiBtdGQ6IHNwaS1ub3I6IFVzZSB0aGUgc3BpLW1lbSBwb2xsIHN0YXR1cyBBUElz
Lgo+Pj4+PiBkdC1iaW5kaW5nczogU1BJOiBBZGQgSW5nZW5pYyBTRkMgYmluZGluZ3MuCj4+Pj4+
IFNQSTogSW5nZW5pYzogQWRkIFNGQyBzdXBwb3J0IGZvciBJbmdlbmljIFNvQ3MuCj4+Pj4+IAo+
Pj4+PiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvaW5nZW5pYyxzZmMueWFtbCAgICAgICB8
ICA2NCArKwo+Pj4+PiBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICA0MiArLQo+Pj4+PiBkcml2ZXJzL3NwaS9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgOSArCj4+Pj4+IGRyaXZlcnMvc3BpL01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPj4+Pj4gZHJpdmVycy9zcGkvc3BpLWlu
Z2VuaWMtc2ZjLmMgICAgICAgICAgICAgICAgICAgICAgfCA2NjIgKysrKysrKysrKysrKysrKysr
KysrCj4+Pj4+IDUgZmlsZXMgY2hhbmdlZCwgNzY4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9u
cygtKQo+Pj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NwaS9pbmdlbmljLHNmYy55YW1sCj4+Pj4+IGNyZWF0ZSBtb2RlIDEwMDc1NSBkcml2
ZXJzL3NwaS9zcGktaW5nZW5pYy1zZmMuYwo+Pj4+PiAKPj4+PiBFdmVuIHRvdWdoIGl0J3Mgc3Rp
bGwgZWFybHkgaW4gcmV2aXNpb24gcHJvY2VzcywgSSdsbCBhZGQgbXkKPj4+PiBUZXN0ZWQtYnk6
IFRvbWFzeiBNYWNpZWogTm93YWsgPHRtbjUwNUBnbWFpbC5jb20+Cj4+Pj4gCj4+Pj4gVGhlIHRl
c3Qgd2FzIHBlcmZvcm1lZCB3aXRoIERhbWFpIERNNjI5MUEgU29DIHdoaWNoIGlzIGEgSW5nZW5p
YyBYMTAwMCBJUAo+Pj4+IGJ1dCB3aXRoIDI1NiBNaUIgUkFNLiBObyBidWdzIHlldCBvYnNlcnZl
ZCBvbiBteSBzaWRlLgo+Pj4gCj4+PiAKPj4+IFRoYW5rcyBmb3IgeW91IHRlc3QhCj4+PiAKPj4+
IAo+Pj4+IAo+Pj4gCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+Pj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
