Return-Path: <SRS0=wBEz=4V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B593AC3F2D1
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2020 05:21:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7A842146E
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2020 05:21:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ePNb/D8T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="kyJaerqf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7A842146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zoztVSPWMwLSV99aeBxny7oqEs6izz45JVW53XDhCTU=; b=ePNb/D8T8CEbF3
	KcmLA/P+AeUcIDWV/qABcBLM2zV+Z+urYc22NWBUN1ZlN/MTN6JAYlf6EzQAf0kC0/NWRJhVkyg0+
	QUIWONJMOLePgpsnYxSN1iNc5W6+sBeAwbA4mYKrHJCzjl37FxPZEydS9Qa8Uvz/BGy8dondZ6urC
	QyIEADVg4yKC4Giun81zF4fX72Z8lxE3jx3tqPZZ6T83c9Gwk1dI7gDk9fz0KHpNsF+2cpy8jf8xX
	jNM4rWLJiDlzuN5F+PhFYGX3m9D3HsEHG0pd8ZmP9TkgK+EctfBbokTo8wlTNC0KWnh3hOR8ZZRjS
	uup40+zAA9h1wngZkxdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9MSs-0005NG-07; Wed, 04 Mar 2020 05:21:02 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9MSo-0005MY-GB
 for linux-mtd@lists.infradead.org; Wed, 04 Mar 2020 05:21:01 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200304052041epoutp030d4a4b45ea37c7f992683bee2b6239fe~5AkViCRZd2936029360epoutp03L
 for <linux-mtd@lists.infradead.org>; Wed,  4 Mar 2020 05:20:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200304052041epoutp030d4a4b45ea37c7f992683bee2b6239fe~5AkViCRZd2936029360epoutp03L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583299241;
 bh=Agv1Q1sgfsjVUCeK5mv2u8/pewVTsU+VsyJ+HyWN/Lk=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=kyJaerqfg1dY4SJ+lSl6g+dMoYWgt4GNnVrXR4+1s2e6UGl1djCD85cg8F2WST9jq
 QpJhAsoWA2siwDeqUG/CnIqXTgcfM8ugGQ6aR6HihgnbPqdRxPHLc1GTN8JKTjeisG
 0Rf1/EwmLOXkeM0A4tKbgQnkYRTd27PKorvCzty0=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200304052040epcas1p1fffe647032449bd6cc645c0d6a1da127~5AkVAsNwP0990309903epcas1p1i;
 Wed,  4 Mar 2020 05:20:40 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.160]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 48XMfH2r05zMqYkp; Wed,  4 Mar
 2020 05:20:39 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 87.53.57028.6AA3F5E5; Wed,  4 Mar 2020 14:20:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200304052038epcas1p1f978e428dfb1c13ae56841cc88848625~5AkTA1zCy1681216812epcas1p1L;
 Wed,  4 Mar 2020 05:20:38 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200304052038epsmtrp2d72880c095b7735eeccd3280a8d81ec9~5AkTAEaFe2844328443epsmtrp2j;
 Wed,  4 Mar 2020 05:20:38 +0000 (GMT)
X-AuditID: b6c32a35-50bff7000001dec4-8e-5e5f3aa6c202
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 1F.B5.10238.6AA3F5E5; Wed,  4 Mar 2020 14:20:38 +0900 (KST)
Received: from asdf (unknown [10.88.100.192]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200304052038epsmtip1e748e4a286f84ec6d10ac53abeaa9f25~5AkSylq6C0145501455epsmtip10;
 Wed,  4 Mar 2020 05:20:38 +0000 (GMT)
Message-ID: <c54cc6e145237b8b04eb96bc133e4c77378b8ae7.camel@samsung.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
From: Jungseung Lee <js07.lee@samsung.com>
To: "chenxiang (M)" <chenxiang66@hisilicon.com>, Jungseung Lee
 <js07.lee@gmail.com>, Tudor.Ambarus@microchip.com, js07.lee@samsung.com
Date: Wed, 04 Mar 2020 14:20:34 +0900
In-Reply-To: <7932da1d-77d8-04a4-4ee1-8ab88ec97f97@hisilicon.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHeXd2OVqL06x82JfWyQIldac5O2V2L05UJEWgEpsHd3TSbuxs
 kX5RSsrMpBsUKyvIbkKUZjmzlbco0kzyLgpeupG5Lt41qc2zqG+/5//+H57L++CY4qZUiWdY
 HJzdwppIabD4cV14dOStdXqd+kS9hu5ob0V02fOjEnr2ildED3TNSOiqo7dkdF1po4j+UbyJ
 /v3mu2wTzlS6emXMYFGpjMmtH5YwD4uzmZ7Jm4gpLC9BzMvOClGCLNm03sixBs6u4iypVkOG
 JT2e3LVfv1WvjVVTkdRaeg2psrBmLp7ctjshckeGydcUqTrMmpw+KYHleTJ6w3q71engVEYr
 74gnOZvBZKPUtiieNfNOS3pUqtW8jlKrV2t9zhSTcbwtznYs+kjXUDvKQQ/IfITjQMRA+5Q1
 HwXjCsKN4FfLmEQIfiJou5QrEoJxBFeLcqR/M0ruBAm6B8HEr3MB0wAC75VynykIlxMMvL3+
 QeTnEGIXXC4cntOlRAR0zpTNlVhE5CG4XfoC+R8wIhMKWhoxP4uJFTBS1ijxcxCxGYa+Tczp
 QKyC4deFYn8XcmIhzLpDhNSlcOzR5YDlkxRGu+UCb4PO8QsygUPgy8vyACthxOuRCsxD5d2z
 Mn8/QOQiGLhdHDBpwDt8D/PXwohwuP8kWpCXQeVMUaDlBeAdK5AIS5FD3nGFYCHha1+uWGCA
 5sHTEoEZmHzvDmz3owgqTleJziCV6980rv+mcf0rfB1hJWgJZ+PN6RxP2aj/v7cMzZ1ohNaN
 LjTtrkUEjsj5ctip0ykk7GE+01yLAMfIRfIQrV6nkBvYzCzObtXbnSaOr0Va367PYsrFqVbf
 wVscekq7WqPR0DGxa2K1GjJU3p8UrlMQ6ayDO8RxNs7+N0+EBylzEJ+WlOhdNpQY6ZrXO+sZ
 eXaqScNes0Zsbs74UKMMy/psV2z3zBjcefvVoQdONq/yHMjuHKjeePBtX+nUqT1p78aqHTWt
 jv6L1aPTBb3dYXuTVZNbVlKvjQue7uvpzT+u7VdVhzlHi9Cr51tdManGLGVDw7ev5PK4G30r
 z6dcne4gSTFvZKkIzM6zfwCKXJnguAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsWy7bCSnO4yq/g4g983uCyuX7vCaLFpfxOr
 xd8575gsHt38zWqxu2kZu8XhjWeYLD4ucbD4f/YDuwOHx85Zd9k9Hs/dyO7RcuQtq8fmJfUe
 d34sZfTo27KK0eP4je1MAexRXDYpqTmZZalF+nYJXBnfrloXNOtX3Hx9jbGBcYNSFyMHh4SA
 icSqFZxdjFwcQgK7GSXefZrD2sXICRSXkHi08wsLRI2wxOHDxRA1Dxgl5p49xgRSwyvgIXF+
 wVMwW1jAW2J231s2EJtNQEvixu9NrCANIgKdjBKH971gBkkwC1RKXJp5AKyBRUBV4vOmM2DL
 OAUcJV6//84MseE1k8SaW+eZIBo0JVq3/2aHuEhH4u2pPrCLeAUEJf7uEIYokZdo3jqbeQKj
 4CwkHbMQqmYhqVrAyLyKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM4OrQ0dzBeXhJ/
 iFGAg1GJh1fKMy5OiDWxrLgy9xCjBAezkgivsGl8nBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHe
 p3nHIoUE0hNLUrNTUwtSi2CyTBycUg2Mdn/3leQxnZhTVi2bMlkvocQg5tVFa0ve/ohN1g/0
 z6j2zpRZuWBDosSLZO3aSQu8jnAbSnBmx8e5zzKcVs6Wt83X7qk9mxIPl/0HU5bU7VtWcyV0
 xK9Q/K13z91qxy2ni21/XHZs/Htzz/neysAi6xP3/OqsjvI39jSs+RjxraTR5lnLe2MlluKM
 REMt5qLiRADQe8tEigIAAA==
X-CMS-MailID: 20200304052038epcas1p1f978e428dfb1c13ae56841cc88848625
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200113055910epcas1p377b2618bea2ca860acac2b6f34e2b83e
References: <20200113055907.9029-1-js07.lee@samsung.com>
 <CGME20200113055910epcas1p377b2618bea2ca860acac2b6f34e2b83e@epcas1p3.samsung.com>
 <20200113055907.9029-2-js07.lee@samsung.com>
 <3703036.Ns4Yp6NO8s@localhost.localdomain>
 <CAPP0e=NMzizy=fEZi4nWzo9GAJOpB2Qwv7ReK7HDvrGKUv+VEw@mail.gmail.com>
 <7932da1d-77d8-04a4-4ee1-8ab88ec97f97@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_212059_063980_53942B3B 
X-CRM114-Status: GOOD (  39.84  )
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
Cc: John Garry <john.garry@huawei.com>, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgoyMDIwLTAyLTExICjtmZQpLCAxNTo1MiArMDgwMCwgY2hlbnhpYW5nIChNKToKPiBIaSBK
dW5nc2V1bmcgTGVlLAo+IAo+IOWcqCAyMDIwLzEvMTcgMjM6MDYsIEp1bmdzZXVuZyBMZWUg5YaZ
6YGTOgo+ID4gSGksIFR1ZG9yLAo+ID4gCj4gPiBPbiBUdWUsIEphbiAxNCwgMjAyMCBhdCA3OjQ5
IFBNIDxUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20+Cj4gPiB3cm90ZToKPiA+ID4gSGksIEp1
bmdzZXVuZywKPiA+ID4gCj4gPiA+IFRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzLgo+ID4gPiAK
PiA+ID4gT24gTW9uZGF5LCBKYW51YXJ5IDEzLCAyMDIwIDc6NTk6MDYgQU0gRUVUIEp1bmdzZXVu
ZyBMZWUgd3JvdGU6Cj4gPiA+ID4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBv
ciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcwo+ID4gPiA+IHlvdSBrbm93IHRoZQo+ID4gPiA+IGNv
bnRlbnQgaXMgc2FmZQo+ID4gPiA+IAo+ID4gPiA+IEN1cnJlbnRseSwgd2UgYXJlIHN1cHBvcnRp
bmcgYmxvY2sgcHJvdGVjdGlvbiBvbmx5IGZvcgo+ID4gPiA+IGZsYXNoIGNoaXBzIHdpdGggMyBi
bG9jayBwcm90ZWN0aW9uIGJpdHMgaW4gdGhlIFNSIHJlZ2lzdGVyLgo+ID4gPiA+IFRoaXMgcGF0
Y2ggZW5hYmxlcyBibG9jayBwcm90ZWN0aW9uIHN1cHBvcnQgZm9yIHNvbWUgZmxhc2ggd2l0aAo+
ID4gPiA+IDQgYmxvY2sgcHJvdGVjdGlvbiBiaXRzKGJwMC0zKS4KPiA+ID4gCj4gPiA+IFNvbWU/
IElzbid0IHRoaXMgZ2VuZXJpYyBmb3IgYWxsIHRoZSBmbGFzaGVzIHRoYXQgc3VwcG9ydCBCUDAt
Mz8KPiA+ID4gCj4gPiAKPiA+IFRoaXMgb25lIHdvdWxkIGJlIGEgZ2VuZXJpYyBzb2x1dGlvbiB0
byBzdXBwb3J0IEJQMC0zIG9uIFN0YXR1cwo+ID4gUmVnaXN0ZXIuCj4gPiA+IEZyb20gbXkgc3R1
ZHksIHRoaXMgY292ZXJzIGFsbCB0aGUgZmxhc2hlcyBsaXN0ZWQgb24gc3BpLW5vci5jCj4gPiA+
IHRoYXQKPiA+IAo+ID4gaGF2ZSBCUDAtMyBiaXQgb24gU1IuCj4gPiBJdCBsb29rcyBsaWtlIEkg
aGF2ZSB0byBjaGFuZ2UgdGhpcyBkZXNjcmlwdGlvbi4KPiA+IAo+ID4gTm90ZSB0aGF0IGl0IGlz
IE5PVCBmb3Igc29tZSBmbGFzaGVzIHRoYXQgaGF2ZSBCUDAtMyBpbiBhbm90aGVyCj4gPiByZWdp
c3Rlci4KPiA+IEFzIHlvdSBrbm93LCBqdXN0IGxpa2UgU1BJX05PUl9IQVNfVEIgZGlkLgo+ID4g
Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSnVuZ3NldW5nIExlZSA8anMwNy5sZWVAc2Ftc3VuZy5j
b20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gdjMgOgo+ID4gPiA+ICAgIEZpeCB3cm9uZyBvZnMgY2Fs
Y3VsYXRpb24gb24gdjIgcGF0Y2gKPiA+ID4gPiB2MiA6Cj4gPiA+ID4gICAgQWRkIHNhbXBsZSB0
YWJsZSBwb3J0aW9uIGFib3V0IDRiaXQgYmxvY2sgcHJvdGVjdGlvbiBvbiB0aGUKPiA+ID4gPiBj
b21tZW50Cj4gPiA+ID4gICAgVHJpdmlhbCBjb2Rpbmcgc3R5bGUgY2hhbmdlCj4gPiA+ID4gCj4g
PiA+ID4gICBkcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyB8IDEyNwo+ID4gPiA+ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KPiA+ID4gPiAgIGluY2x1ZGUvbGludXgvbXRk
L3NwaS1ub3IuaCAgIHwgICA4ICsrKwo+ID4gPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMTkgaW5z
ZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jIGIvZHJpdmVycy9tdGQvc3BpLQo+ID4gPiA+
IG5vci9zcGktbm9yLmMKPiA+ID4gPiBpbmRleCBlM2RhNmE4NjU0YTguLjdlOGFmNmM0ZmRmYSAx
MDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYwo+ID4gPiA+
ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jCj4gPiA+ID4gQEAgLTIzOCw2ICsy
MzgsMTQgQEAgc3RydWN0IGZsYXNoX2luZm8gewo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICogc3RhdHVzIHJlZ2lzdGVyLgo+ID4gPiA+IE11c3QgYmUg
dXNlZAo+ID4gPiA+IHdpdGggKiBTUElfTk9SX0hBU19UQi4KPiA+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwo+ID4gPiA+ICsjZGVmaW5lIFNQSV9OT1Jf
SEFTX0JQMyAgICAgICAgICAgICAgICBCSVQoMTcpIC8qCj4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAqIEZsYXNoIFNSIGhhcyA0IGJpdAo+ID4gPiA+IGZp
ZWxkcyAoQlAwLTMpCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAqIGZvciBibG9jawo+ID4gPiA+IHByb3RlY3Rpb24uCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwo+ID4gPiA+ICsjZGVmaW5lIFNQSV9OT1Jf
QlAzX1NSX0JJVDYgICAgQklUKDE4KSAvKgo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKiBCUDMgaXMgYml0IDYgb2YKPiA+ID4gPiBzdGF0dXMgcmVnaXN0
ZXIuCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIE11
c3QgYmUgdXNlZCB3aXRoCj4gPiA+IAo+ID4gPiBBcmUgd2Ugc2FmZSB0byByZXBsYWNlIFNQSV9O
T1JfVEJfU1JfQklUNiBhbmQgU1BJX05PUl9CUDNfU1JfQklUNgo+ID4gPiB3aXRoIGEKPiA+ID4g
U1BJX05PUl9TUl9UQl9CSVQ2X0JQM19CSVQ1PyBPciBtYXliZSB3aXRoIGEKPiA+ID4gU1BJX05P
Ul9TUl9CUDNfQklUNl9UQl9CSVQ1LCBob3cKPiA+ID4gaXMgbW9yZSBjb252ZW5pZW50Pwo+ID4g
PiAKPiA+IAo+ID4gTGV0J3MgdGhpbmsgYWJvdXQgc29tZSBmbGFzaCBpbiB3aGljaCBCUDAtMyBl
eGlzdHMgaW4gdGhlIHN0YXR1cwo+ID4gcmVnaXN0ZXIgYnV0IFRCIGV4aXN0cyBpbiBhbm90aGVy
IHJlZ2lzdGVyLgo+ID4gZm9yIGV4YW1wbGUsIG14MjV1MTI4MzVmLgo+ID4gSSBoYXZlbid0IHRl
c3RlZCB5ZXQsIGJ1dCBhY2NvcmRpbmcgdG8gdGhlIGRhdGFzaGVldCwgSSB0aGluayB0aGlzCj4g
PiBwYXRjaCBjYW4gc3VwcG9ydCA0Yml0IGJsb2NrIHByb3RlY3Rpb24gZm9yIHRoZSBmbGFzaC4K
PiA+IAo+ID4gSW4gb3JkZXIgdG8gZW1icmFjZSB0aGUgY2FzZSwgaG93IGFib3V0IGxldHRpbmcg
dGhlbSBhcyBJdCBpcy4KPiA+IElzIHRoZXJlIGFueSBzdWdnZXN0aW9uPwo+IAo+IEluIG15IGJv
YXJkKGhpc2lsaWNvbiBEMDYpIHRoZXJlIGlzICBhIG14MjV1MTI4MzVmIEZsYXNoLCBhbmQgaQo+
IGVuYWJsZSAKPiBTUElfTk9SX0hBU19MT0NLIGFuZCBTUElfTk9SX0hBU19CUDMgd2hpY2ggaXMg
bm90IGVuYWJsZWQgaW4gc3BpLQo+IG5vci5jLCAKPiBmaW5kIGl0IHNlZW1zIG5vdCB3b3JrOgo+
IAo+IEV1bGVyOn4gIyBscyAvZGV2L210ZDAKPiAvZGV2L210ZDAKPiBFdWxlcjp+ICMgLi9mbGFz
aF9sb2NrIC1pIC9kZXYvbXRkMAo+IERldmljZTogL2Rldi9tdGQwCj4gU3RhcnQ6IDAKPiBMZW46
IDB4MTAwMDAwMAo+IExvY2sgc3RhdHVzOiB1bmxvY2tlZAo+IFJldHVybiBjb2RlOiAwCj4gRXVs
ZXI6fiAjCj4gRXVsZXI6fiAjIC4vZmxhc2hfbG9jayAvZGV2L210ZDAKPiBmbGFzaF9sb2NrOiBl
cnJvciE6IGNvdWxkIG5vdCBsb2NrIGRldmljZTogL2Rldi9tdGQwCj4gCj4gICAgICAgICAgICAg
IGVycm9yIDUgKElucHV0L291dHB1dCBlcnJvcikKPiBFdWxlcjp+ICMgLi9mbGFzaF9sb2NrIC1p
IC9kZXYvbXRkMAo+IERldmljZTogL2Rldi9tdGQwCj4gU3RhcnQ6IDAKPiBMZW46IDB4MTAwMDAw
MAo+IExvY2sgc3RhdHVzOiBsb2NrZWQKPiBSZXR1cm4gY29kZTogMQo+IEV1bGVyOn4gIwo+IAo+
IEkgZmluZCB0aGF0IGluIGZ1bmN0aW9uIHNwaV9ub3Jfd3JpdGVfc3JfYW5kX2NoZWNrKCksIGlm
IHNwaV9ub3IgaGFzIAo+IDE2Yml0IFNSLCBzcGlfbm9yX3dyaXRlXzE2Yml0X3NyX2FuZF9jaGVj
aygpIHdpbGwgYmUgY2FsbGVkLCBpZiBub3QgCj4gc3BpX25vcl93cml0ZV9zcjFfYW5kX2NoZWNr
KCkgd2lsbCBiZSBjYWxsZWQuCj4gRm9yIG14MjV1MTI4MzVmLCBpdCBqdXN0IGhhcyA4Yml0IFNS
LCBidXQgU05PUl9GX0hBU18xNkJJVF9TUiBpcyBzZXQKPiBhcyAKPiBkZWZhdWx0LCBzbyBpdCBj
YXVzZXMgYWJvdmUgaXNzdWU7Cj4gRXZlbiBoYWNrIHRoZSBjb2RlIHRvIG5vdCBzZXQgZmxhZyBT
Tk9SX0ZfSEFTXzE2QklUX1NSLCBpdCBzZWVtcwo+IHRoYXQgCj4gbG9jayBpcyBzdGlsbCBub3Qg
dmFsaWRlZCBhcyBQcm9ncmFtL0VyYXNlIHN0aWxsIHN1Y2Nlc3MgZXZlbiBpZiBpdAo+IGlzIAo+
IGxvY2tlZDoKPiAKCkNvdWxkIHlvdSBkdW1wIHNyIHJlZ2lzdGVyIHZhbHVlPwpCdXQgaWYgeW91
IGFyZSB1c2luZyBvbGQga2VybmVsIG9yIHRoZSBmbGFzaCBkb2Vzbid0IGhhdmUgRlNSIGVycm9y
CmJpdHMsIGVyYXNlL3Byb2dyYW0gb3BlcmF0aW9uIGZhaWx1cmUgY291bGRuJ3QgYmUgZGV0ZWN0
ZWQuCgpyZWZlciB0aGlzIG9uZS4KCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2g9djUuNi1yYzQmaWQ9MjBj
Y2I5OTNmMjliZDZhZDE3Njk5ZGQwYjM0OWRiMDg2ZTNjYTcxOQoKSSBhbSBwbGFubmluZyB0byBw
b3N0IG5ldyBwYXRjaCBmb3IgNGJpdCBCbG9jayBwcm90ZWN0aW9uIHNvb24uIEkgd291bGQKYXBw
cmVjaWF0ZSBpdCBpZiB5b3UgY2hlY2sgdGhlcmUgdG9vLgoKVGhhbmtzLAoKPiBFdWxlcjp+ICMg
Li9mbGFzaF9sb2NrIC1pIC9kZXYvbXRkMAo+IERldmljZTogL2Rldi9tdGQwCj4gU3RhcnQ6IDAK
PiBMZW46IDB4MTAwMDAwMAo+IExvY2sgc3RhdHVzOiB1bmxvY2tlZAo+IFJldHVybiBjb2RlOiAw
Cj4gRXVsZXI6fiAjCj4gRXVsZXI6fiAjIC4vbXRkX2RlYnVnIGVyYXNlIC9kZXYvbXRkMCAweGU0
MDAwMCA0MDk2Cj4gRXJhc2VkIDQwOTYgYnl0ZXMgZnJvbSBhZGRyZXNzIDB4MDBlNDAwMDAgaW4g
Zmxhc2gKPiBFdWxlcjp+ICMKPiBFdWxlcjp+ICMgLi9mbGFzaF9sb2NrIC9kZXYvbXRkMAo+IEV1
bGVyOn4gIwo+IEV1bGVyOn4gIyAuL2ZsYXNoX2xvY2sgLWkgL2Rldi9tdGQwCj4gRGV2aWNlOiAv
ZGV2L210ZDAKPiBTdGFydDogMAo+IExlbjogMHgxMDAwMDAwCj4gTG9jayBzdGF0dXM6IGxvY2tl
ZAo+IFJldHVybiBjb2RlOiAxCj4gRXVsZXI6fiAjCj4gRXVsZXI6fiAjIC4vbXRkX2RlYnVnIGVy
YXNlIC9kZXYvbXRkMCAweGU0MDAwMCA0MDk2Cj4gRXJhc2VkIDQwOTYgYnl0ZXMgZnJvbSBhZGRy
ZXNzIDB4MDBlNDAwMDAgaW4gZmxhc2gKPiBFdWxlcjp+ICMgLi9mbGFzaF9sb2NrIC1pIC9kZXYv
bXRkMAo+IERldmljZTogL2Rldi9tdGQwCj4gU3RhcnQ6IDAKPiBMZW46IDB4MTAwMDAwMAo+IExv
Y2sgc3RhdHVzOiBsb2NrZWQKPiBSZXR1cm4gY29kZTogMQo+IEV1bGVyOn4gIwo+IEV1bGVyOn4g
Iwo+IAo+IAo+IFRoYW5rcywKPiBjaGVueGlhbmcKPiAKPiAKPiA+IAo+ID4gPiBDaGVlcnMsCj4g
PiA+IHRhCj4gPiA+IAo+ID4gCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiA+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dAo+ID4gCmh0dHBzOi8vcHJvdGVjdDIuZmlyZWV5ZS5jb20vdXJsP2s9ODFmNTJiYWMtZGMyMTk2
ZTgtODFmNGEwZTMtMGNjNDdhMzEzODFhLWNmZWZmMmZiNzQ5MjYxYWUmdT1odHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KPiA+IAo+ID4gLgo+ID4g
Cj4gCj4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
