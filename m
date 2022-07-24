Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9F7C43334
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jul 2022 01:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References:Message-Id
	:Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJ5taijcG0mfsfhVbeB5XVx1NCClfNxuvUJxzE8Ulqw=; b=pqzshVFchS8lng
	ps9fnvnK9nX7+CphFyr6DfrcbeeM+uhbrDk3Ud2kKiBuPIx+Xhu8ZcALjA7b32lMP0r36RU2wrW0z
	cS2yewcP7lmeymHoGLznizJzG1sXgCsOH22LXfyYPlsnBLqRdpXK/Rvq7u+zvSH6bGofo5JHGba9X
	7s10gihwEq3VR3VaDG/3n1HjGz0nlRjWuzsdJmLWFbWLRZwT6P07ppoI/3PlR+okadI1IdHB7hR6B
	fN6I6yZ8afrhAwREK+iBfh9jRVTvFZoT9rEnHxzCBMDVWLJCx7IfJt+NKmJp6FBC7lVloz/cuBdyC
	rWFlU618FooH/wNPmLCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFQTj-009U77-7V; Sun, 24 Jul 2022 01:32:19 +0000
Received: from ci74p00im-qukt09081502.me.com ([17.57.156.5])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFQTg-009Tx3-GC
	for linux-mtd@lists.infradead.org; Sun, 24 Jul 2022 01:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1658626325;
	bh=GsdFZK4oQNZWNc6BXkPULWSnbkpQG2ue3MdM2e30/GQ=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To;
	b=0CptV9Iz/vhCxOz+MlOz1/Go5VCVLeDJ2h0pg7LmemPmrBHCrtetn8oqlaqsgIwqq
	 looD+9jRM6S3CV+hpiFh4iRqCD/A70nflY5gK3X8GhlcjLi6lEmi6iWK32/0kIhudX
	 XqftYSYdWc6stW2ougQ1PP3rmGiqhEMCLpyGAaK42G+R3HVpXnoNXupzUluP33aP9X
	 Qfi7bKp4merH8SYr+I+ITSSHyi2GYSM/dPDhEzWVJJZLO7e3K2d2PgGD+coR81M4ZJ
	 zSRf25jyzIQjyTGjfnMFNceP90tfdwq9kwq0WtyY01VrUsfonkMlfKoKjy+QcThJP8
	 YawddyCMIsEdA==
Received: from smtpclient.apple (ci77p00im-dlb-asmtp-mailmevip.me.com [17.57.156.26])
	by ci74p00im-qukt09081502.me.com (Postfix) with ESMTPSA id 776E228400F1;
	Sun, 24 Jul 2022 01:32:03 +0000 (UTC)
From: Vee Page <takeiteasy27@icloud.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 0/3] Add SFC support for Ingenic SoCs.
Date: Sat, 23 Jul 2022 21:32:01 -0400
Message-Id: <D7ACE3CD-3189-4988-BB44-F32514C70425@icloud.com>
References: <MN2PR17MB33758BDD0221A0C49A13DC3DB8929@MN2PR17MB3375.namprd17.prod.outlook.com>
Cc: Tomasz Maciej Nowak <tmn505@gmail.com>, Tudor.Ambarus@microchip.com,
 p.yadav@ti.com, michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 aidanmacdonald.0x0@gmail.com, paul@crapouillou.net,
 dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
 jinghui.liu@ingenic.com, sernia.zhou@foxmail.com, reimu@sudomaker.com
In-Reply-To: <MN2PR17MB33758BDD0221A0C49A13DC3DB8929@MN2PR17MB3375.namprd17.prod.outlook.com>
To: Zhou Yanjie <zhouyanjie@wanyeetech.com>
X-Mailer: iPhone Mail (19B81)
X-Proofpoint-ORIG-GUID: L2zjtVGRKGpQPmIocJ94RIVCaPPsaP4E
X-Proofpoint-GUID: L2zjtVGRKGpQPmIocJ94RIVCaPPsaP4E
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=855 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2207240006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_183216_647230_1AFDDA7F 
X-CRM114-Status: GOOD (  10.21  )
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

Tm8gcHJvYmxlbSEhIQpJIGZvcmdldCB0byB0ZWxsIHRoZW0uIEl04oCZcyBva2F5IHRob3VnaCEg
8J+RjPCfkY0K8J+YmvCfmJrwn5ia8J+YmvCfmJrwn5ia8J+YmvCfmJrwn5ia8J+YmvCfmJrwn5ia
8J+YmvCfmJrimLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/i
mLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrv
uI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/imLrvuI/i
mLrvuI/imLrvuI/imLrvuI/imLrvuI8KSeKAmW0gYmx1c2hpbmchIExhc3QgbmlnaHQgd2FzIGZ1
bi4KCj4gT24gSnVsIDIzLCAyMDIyLCBhdCA5OjMwIFBNLCBWYW5lc3NhIFBhZ2UgPFZlYnBlQG91
dGxvb2suY29tPiB3cm90ZToKPiAKPiDvu7/wn6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn6Ww8J+l
sPCfpbDwn6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn6Ww
8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDw
n6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn6Ww8J+lsPCfpbDwn5iN8J+YjfCfmI3wn5iN8J+YjfCf
mI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5ia8J+Y
jfCfmJrwn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN
8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3w
n5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCf
mI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI3wn5iN8J+YjfCfmI0KPiAKPiBP
bWcgdGhhbmsgeW91IEphbmlrYSEKPiAKPiBJ4oCZbSBnbGFkIHRvIHNlZSBldmVyeXRoaW5nIGlz
IG9rYXkganVzdCB0ZWxsIHRoZW0gbmV4dCB0aW1lIQo+IAo+IExvdmUgeWEgYmFiZXMhCj4gCj4+
IE9uIEp1bCAyMywgMjAyMiwgYXQgOToyNyBQTSwgWmhvdSBZYW5qaWUgPHpob3V5YW5qaWVAd2Fu
eWVldGVjaC5jb20+IHdyb3RlOgo+PiAKPj4g77u/SGkgVG9tYXN6LAo+PiAKPj4+PiBPbiAyMDIy
LzcvMjMg5LiL5Y2IMTA6NDcsIFRvbWFzeiBNYWNpZWogTm93YWsgd3JvdGU6Cj4+PiBXIGRuaXUg
MjIuMDcuMjAyMiBvIDE4OjQ4LCDlkajnkLDmnbAgKFpob3UgWWFuamllKSBwaXN6ZToKPj4+PiAx
LlVzZSB0aGUgc3BpLW1lbSBwb2xsIHN0YXR1cyBBUElzIGluIFNQSS1OT1IgdG8gcmVkdWNlIENQ
VSBsb2FkLgo+Pj4+IDIuQWRkIFNGQyBzdXBwb3J0IGZvciB0aGUgWDEwMDAgU29DLCB0aGUgWDE2
MDAgU29DLCBhbmQgdGhlIFgyMDAwIFNvQyBmcm9tIEluZ2VuaWMuCj4+Pj4gCj4+Pj4gTGl1IEpp
bmdodWkgYW5kIEFpZGFuIE1hY0RvbmFsZCBwcm92aWRlZCBhIGxvdCBvZiBhc3Npc3RhbmNlIGR1
cmluZyB0aGUgZGV2ZWxvcG1lbnQgb2YgdGhpcyBkcml2ZXIuCj4+Pj4gCj4+Pj4g5ZGo55Cw5p2w
IChaaG91IFlhbmppZSkgKDMpOgo+Pj4+ICBtdGQ6IHNwaS1ub3I6IFVzZSB0aGUgc3BpLW1lbSBw
b2xsIHN0YXR1cyBBUElzLgo+Pj4+ICBkdC1iaW5kaW5nczogU1BJOiBBZGQgSW5nZW5pYyBTRkMg
YmluZGluZ3MuCj4+Pj4gIFNQSTogSW5nZW5pYzogQWRkIFNGQyBzdXBwb3J0IGZvciBJbmdlbmlj
IFNvQ3MuCj4+Pj4gCj4+Pj4gLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2luZ2VuaWMsc2Zj
LnlhbWwgICAgICAgfCAgNjQgKysKPj4+PiBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICA0MiArLQo+Pj4+IGRyaXZlcnMvc3BpL0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA5ICsKPj4+PiBkcml2ZXJzL3NwaS9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4+Pj4gZHJpdmVycy9z
cGkvc3BpLWluZ2VuaWMtc2ZjLmMgICAgICAgICAgICAgICAgICAgICAgfCA2NjIgKysrKysrKysr
KysrKysrKysrKysrCj4+Pj4gNSBmaWxlcyBjaGFuZ2VkLCA3NjggaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pCj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zcGkvaW5nZW5pYyxzZmMueWFtbAo+Pj4+IGNyZWF0ZSBtb2RlIDEwMDc1
NSBkcml2ZXJzL3NwaS9zcGktaW5nZW5pYy1zZmMuYwo+Pj4+IAo+Pj4gRXZlbiB0b3VnaCBpdCdz
IHN0aWxsIGVhcmx5IGluIHJldmlzaW9uIHByb2Nlc3MsIEknbGwgYWRkIG15Cj4+PiBUZXN0ZWQt
Ynk6IFRvbWFzeiBNYWNpZWogTm93YWsgPHRtbjUwNUBnbWFpbC5jb20+Cj4+PiAKPj4+IFRoZSB0
ZXN0IHdhcyBwZXJmb3JtZWQgd2l0aCBEYW1haSBETTYyOTFBIFNvQyB3aGljaCBpcyBhIEluZ2Vu
aWMgWDEwMDAgSVAKPj4+IGJ1dCB3aXRoIDI1NiBNaUIgUkFNLiBObyBidWdzIHlldCBvYnNlcnZl
ZCBvbiBteSBzaWRlLgo+PiAKPj4gCj4+IFRoYW5rcyBmb3IgeW91IHRlc3QhCj4+IAo+PiAKPj4+
IAo+PiAKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+PiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
