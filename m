Return-Path: <SRS0=A5yI=4Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6036BC10F00
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Mar 2020 07:40:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A5DB206D5
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Mar 2020 07:40:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pNAxt7x0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fiBJrcv3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A5DB206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGdOoDZ/wvx+LEAoz10rgA3KXdbw7wDMmfsAVKTBO+E=; b=pNAxt7x09oUdqk
	3i4f6awVmVlcDw59DzdITmQ9yW31SfDozh/tdWcrpUIG9vhMzDrOqyFoJQ64MDumFOuP2Ly451IbC
	czZspUoS3XnDgOg4TTwTI6y9XrOwkVVDyZ06SOACLXFBFLZxbbwkK9KyDEwDifc3B+A0Ml1jztmj8
	n7xjCyZ9KhC7lu1h+84bLh5tTTxMhz5L6gbqwgu3Ch2NDsXA/jX5BIgSABow8S8+qq/FUyZ4e1Drf
	8B3q6UbXvUWjesNzGJwI/IT5+y6Nqj8mt2gv7vmI2zYHLiA4pFEYVzb+IYv+rrWxrcv5g9BGjmnFj
	Gs5tz++UL74Hmk0YREQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAU4K-0001ah-6R; Sat, 07 Mar 2020 07:40:20 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAU4F-0001aC-6r
 for linux-mtd@lists.infradead.org; Sat, 07 Mar 2020 07:40:18 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200307074011epoutp03e90c8737c5133fa6caa9a04ccea1e41c~59Z-vt1O20246302463epoutp03b
 for <linux-mtd@lists.infradead.org>; Sat,  7 Mar 2020 07:40:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200307074011epoutp03e90c8737c5133fa6caa9a04ccea1e41c~59Z-vt1O20246302463epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583566811;
 bh=/i3LVpiqX0EXU1jh5zsfKVIdhUjCP6q8S22Al5jfT7Y=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=fiBJrcv3qXzgK7JUngNR1cG+W+3Lu7akmCrfgpv2oKDxD0Yi5f3CuGw+vbtrhilyi
 jz+Tv0t/w/Do0LifJvnnk3Lx7e5Ow09X9vyTcX7gfFdpJtjG4YaO6ZHtDbLFb3hlmn
 BuWAdkSLevAKp5Y4Cf5XwvY9NGSezqmGCKHpsTe4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200307074010epcas1p2c592f23bb56256f650cca65d6240611e~59Z_mgPIF2968629686epcas1p2U;
 Sat,  7 Mar 2020 07:40:10 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.160]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 48ZGbs0B2pzMqYlh; Sat,  7 Mar
 2020 07:40:09 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 DC.D6.48498.8DF436E5; Sat,  7 Mar 2020 16:40:08 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200307074007epcas1p4cfec6e4198bb5484c795890ce5be4199~59Z8YmLi80392803928epcas1p4B;
 Sat,  7 Mar 2020 07:40:07 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200307074007epsmtrp237a7d097517f3130a0e929e7cd2812e2~59Z8X5Xoe0826508265epsmtrp2y;
 Sat,  7 Mar 2020 07:40:07 +0000 (GMT)
X-AuditID: b6c32a36-a3dff7000001bd72-91-5e634fd84104
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 7E.56.10238.7DF436E5; Sat,  7 Mar 2020 16:40:07 +0900 (KST)
Received: from asdf (unknown [10.88.100.192]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200307074007epsmtip16fd0131b97a3edf549390722083ae470~59Z8NFSCj1250112501epsmtip1P;
 Sat,  7 Mar 2020 07:40:07 +0000 (GMT)
Message-ID: <561697d12e9304d0c6e5b9552da91f24e561bb05.camel@samsung.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
From: Jungseung Lee <js07.lee@samsung.com>
To: "chenxiang (M)" <chenxiang66@hisilicon.com>, Jungseung Lee
 <js07.lee@gmail.com>, Tudor.Ambarus@microchip.com, js07.lee@samsung.com
Date: Sat, 07 Mar 2020 16:40:07 +0900
In-Reply-To: <cac6fa64-2213-6f4b-1670-a7b439c77ee4@hisilicon.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju29m5WC1O0+plRK0DURtZm3N2yiyrUQcqMirphnqahynt1s6M
 jCAzMxO1oiBZGVGWNcjQLGcZhV0UM1EMUytQF1jSVtlNGF02j1H/nvf5nud7n/f9PgpTVhEq
 KtvuFlx23soQE+V3Hml0sT0bzWm6xqEl7MvuF4itfZCPsz/PB2XsYG8IZ+/lXyXZRzVtMvZz
 ZTL7+/knMpniGjxvSM5fUUNyBY8DOHer8hD3evQK4srqvIhr7qmXpZA7rMuyBD5TcKkFu9mR
 mW23JDHrNqevTjcm6PSx+iXsYkZt521CEmNanxK7JtsaDsWo9/HWnDCVwosis2j5Mpcjxy2o
 sxyiO4kRnJlWp17nXCjyNjHHbllodtiW6nW6OGNYmWHN6rxSLnO2J+739r0n8tCQphhFUUDH
 w5nuZ2QxmkgpaR+Cy756TCpGEFRcui2Tiu8ILnpLUTGixiwh31qJv4/gxMhnQioGEVwYPUpG
 7lXQHLwpDckjOJpeB+fKAkQEE7QWekK1eMQQQxchqKp5giIHGJ0LJV1tWATL6blws9ojj3SL
 olfCs6OzpKwLINBaNkYr6Knw0xctOWfDkdvnxlIDPURAdeMnTNKboPnjt3EcDcPNdaSEVfAl
 eJ+QsAgN10+RkrkAwWBV5bjIAMHADSzSDKM1cPPuIomeAw2hivHIUyD4rQSXlqKAokKlJGHg
 Q3+BXMIAHf5SXMIcjL714dKuXmMQqB8kTiK15984nv/G8fxrfBFhXjRdcIo2iyDqnXH/P3At
 Gvuk2gQfutS+vgnRFGImK5ITd6cpcX6fmGtrQkBhTIzisNacplRk8rkHBJcj3ZVjFcQmZAzv
 +hSmmmZ2hL+83Z2uN8YZDAY2PmFxgtHAzFAMbNekKWkL7xb2CIJTcP31yagoVR5Kzjj4NZiq
 yu+cn/v4zLtUx3BL4VVT67GCVduXP01saWjd23+twznDVXSkxHq8YktV6X5NY7khz79g0i1f
 x7bJa03e2ldbLQe1qYW7Ts/cMrBB3cse6KgzTZ/gW7GzpT0p/gR7dtPIgO0d1l/eN2X4IQu4
 we+vPgmT8n78mtc1YFjKyMUsXq/FXCL/B+AYrYG6AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsWy7bCSnO51/+Q4g/PflSyuX7vCaLFpfxOr
 xd8575gsHt38zWqxu2kZu8XhjWeYLD4ucbD4f/YDuwOHx85Zd9k9Hs/dyO7RcuQtq8fmJfUe
 d34sZfTo27KK0eP4je1MAexRXDYpqTmZZalF+nYJXBkXl85gKjhnXbHq1ku2Bsbnml2MHBwS
 AiYSv3e4dzFycQgJ7GaU6Dg2mb2LkRMoLiHxaOcXFogaYYnDh4shah4wSszZ8Y0NpIZXwEPi
 bu9vFhBbWMBbYnbfW7A4m4CWxI3fm1hBGkQEOhklDu97wQySYBaolLg08wATiM0ioCqxft0s
 sAWcAo4Sp1vlIBY8ZpZYcPkgE0S9pkTr9t9QB+lIvD3VB1bPKyAo8XeHMESJvETz1tnMExgF
 ZyHpmIVQNQtJ1QJG5lWMkqkFxbnpucWGBYZ5qeV6xYm5xaV56XrJ+bmbGMHRoaW5g/HykvhD
 jAIcjEo8vDNsk+KEWBPLiitzDzFKcDArifA2aiXHCfGmJFZWpRblxxeV5qQWH2KU5mBREud9
 mncsUkggPbEkNTs1tSC1CCbLxMEp1cCoNmer+uv3aWctWH67tqx9G7m/oK1fWiNDPC4zedq5
 pl/8E9Qa18xL+pkqqO5ee53pz4vHPIrZvCWr03U+9U2+t7D5sKTT6rMxbzQD09du+vxLcMX0
 V7sOKvLpr5f74XzSOysszTVs98/jyk4MOzU4itObytYJ5ddnT2OIWmExM3nKol2Br9YqsRRn
 JBpqMRcVJwIAlRx/kIoCAAA=
X-CMS-MailID: 20200307074007epcas1p4cfec6e4198bb5484c795890ce5be4199
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
 <c54cc6e145237b8b04eb96bc133e4c77378b8ae7.camel@samsung.com>
 <cac6fa64-2213-6f4b-1670-a7b439c77ee4@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_234015_673351_B7B48492 
X-CRM114-Status: GOOD (  43.33  )
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

SGksCgoyMDIwLTAzLTA0ICjsiJgpLCAxNjozNiArMDgwMCwgY2hlbnhpYW5nIChNKToKPiBIaSwK
PiAKPiDlnKggMjAyMC8zLzQgMTM6MjAsIEp1bmdzZXVuZyBMZWUg5YaZ6YGTOgo+ID4gSGksCj4g
PiAKPiA+IDIwMjAtMDItMTEgKO2ZlCksIDE1OjUyICswODAwLCBjaGVueGlhbmcgKE0pOgo+ID4g
PiBIaSBKdW5nc2V1bmcgTGVlLAo+ID4gPiAKPiA+ID4g5ZyoIDIwMjAvMS8xNyAyMzowNiwgSnVu
Z3NldW5nIExlZSDlhpnpgZM6Cj4gPiA+ID4gSGksIFR1ZG9yLAo+ID4gPiA+IAo+ID4gPiA+IE9u
IFR1ZSwgSmFuIDE0LCAyMDIwIGF0IDc6NDkgUE0gPFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNv
bT4KPiA+ID4gPiB3cm90ZToKPiA+ID4gPiA+IEhpLCBKdW5nc2V1bmcsCj4gPiA+ID4gPiAKPiA+
ID4gPiA+IFRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBP
biBNb25kYXksIEphbnVhcnkgMTMsIDIwMjAgNzo1OTowNiBBTSBFRVQgSnVuZ3NldW5nIExlZQo+
ID4gPiA+ID4gd3JvdGU6Cj4gPiA+ID4gPiA+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sg
bGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cwo+ID4gPiA+ID4gPiB1bmxlc3MKPiA+ID4gPiA+ID4g
eW91IGtub3cgdGhlCj4gPiA+ID4gPiA+IGNvbnRlbnQgaXMgc2FmZQo+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gQ3VycmVudGx5LCB3ZSBhcmUgc3VwcG9ydGluZyBibG9jayBwcm90ZWN0aW9uIG9u
bHkgZm9yCj4gPiA+ID4gPiA+IGZsYXNoIGNoaXBzIHdpdGggMyBibG9jayBwcm90ZWN0aW9uIGJp
dHMgaW4gdGhlIFNSCj4gPiA+ID4gPiA+IHJlZ2lzdGVyLgo+ID4gPiA+ID4gPiBUaGlzIHBhdGNo
IGVuYWJsZXMgYmxvY2sgcHJvdGVjdGlvbiBzdXBwb3J0IGZvciBzb21lIGZsYXNoCj4gPiA+ID4g
PiA+IHdpdGgKPiA+ID4gPiA+ID4gNCBibG9jayBwcm90ZWN0aW9uIGJpdHMoYnAwLTMpLgo+ID4g
PiA+ID4gCj4gPiA+ID4gPiBTb21lPyBJc24ndCB0aGlzIGdlbmVyaWMgZm9yIGFsbCB0aGUgZmxh
c2hlcyB0aGF0IHN1cHBvcnQKPiA+ID4gPiA+IEJQMC0zPwo+ID4gPiA+ID4gCj4gPiA+ID4gCj4g
PiA+ID4gVGhpcyBvbmUgd291bGQgYmUgYSBnZW5lcmljIHNvbHV0aW9uIHRvIHN1cHBvcnQgQlAw
LTMgb24gU3RhdHVzCj4gPiA+ID4gUmVnaXN0ZXIuCj4gPiA+ID4gPiAgRnJvbSBteSBzdHVkeSwg
dGhpcyBjb3ZlcnMgYWxsIHRoZSBmbGFzaGVzIGxpc3RlZCBvbiBzcGktCj4gPiA+ID4gPiBub3Iu
Ywo+ID4gPiA+ID4gdGhhdAo+ID4gPiA+IAo+ID4gPiA+IGhhdmUgQlAwLTMgYml0IG9uIFNSLgo+
ID4gPiA+IEl0IGxvb2tzIGxpa2UgSSBoYXZlIHRvIGNoYW5nZSB0aGlzIGRlc2NyaXB0aW9uLgo+
ID4gPiA+IAo+ID4gPiA+IE5vdGUgdGhhdCBpdCBpcyBOT1QgZm9yIHNvbWUgZmxhc2hlcyB0aGF0
IGhhdmUgQlAwLTMgaW4gYW5vdGhlcgo+ID4gPiA+IHJlZ2lzdGVyLgo+ID4gPiA+IEFzIHlvdSBr
bm93LCBqdXN0IGxpa2UgU1BJX05PUl9IQVNfVEIgZGlkLgo+ID4gPiA+IAo+ID4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBKdW5nc2V1bmcgTGVlIDxqczA3LmxlZUBzYW1zdW5nLmNvbT4KPiA+ID4g
PiA+ID4gLS0tCj4gPiA+ID4gPiA+IHYzIDoKPiA+ID4gPiA+ID4gICAgIEZpeCB3cm9uZyBvZnMg
Y2FsY3VsYXRpb24gb24gdjIgcGF0Y2gKPiA+ID4gPiA+ID4gdjIgOgo+ID4gPiA+ID4gPiAgICAg
QWRkIHNhbXBsZSB0YWJsZSBwb3J0aW9uIGFib3V0IDRiaXQgYmxvY2sgcHJvdGVjdGlvbiBvbgo+
ID4gPiA+ID4gPiB0aGUKPiA+ID4gPiA+ID4gY29tbWVudAo+ID4gPiA+ID4gPiAgICAgVHJpdmlh
bCBjb2Rpbmcgc3R5bGUgY2hhbmdlCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAgICBkcml2ZXJz
L210ZC9zcGktbm9yL3NwaS1ub3IuYyB8IDEyNwo+ID4gPiA+ID4gPiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tCj4gPiA+ID4gPiA+ICAgIGluY2x1ZGUvbGludXgvbXRkL3NwaS1u
b3IuaCAgIHwgICA4ICsrKwo+ID4gPiA+ID4gPiAgICAyIGZpbGVzIGNoYW5nZWQsIDExOSBpbnNl
cnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYwo+ID4gPiA+ID4gPiBiL2RyaXZl
cnMvbXRkL3NwaS0KPiA+ID4gPiA+ID4gbm9yL3NwaS1ub3IuYwo+ID4gPiA+ID4gPiBpbmRleCBl
M2RhNmE4NjU0YTguLjdlOGFmNmM0ZmRmYSAxMDA2NDQKPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9zcGktbm9yLmMKPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9tdGQvc3Bp
LW5vci9zcGktbm9yLmMKPiA+ID4gPiA+ID4gQEAgLTIzOCw2ICsyMzgsMTQgQEAgc3RydWN0IGZs
YXNoX2luZm8gewo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKiBzdGF0dXMKPiA+ID4gPiA+ID4gcmVnaXN0ZXIuCj4gPiA+ID4gPiA+IE11c3Qg
YmUgdXNlZAo+ID4gPiA+ID4gPiB3aXRoICogU1BJX05PUl9IQVNfVEIuCj4gPiA+ID4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwo+ID4gPiA+ID4gPiAr
I2RlZmluZSBTUElfTk9SX0hBU19CUDMgICAgICAgICAgICAgICAgQklUKDE3KSAvKgo+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICogRmxhc2ggU1Ig
aGFzIDQKPiA+ID4gPiA+ID4gYml0Cj4gPiA+ID4gPiA+IGZpZWxkcyAoQlAwLTMpCj4gPiA+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBmb3IgYmxvY2sK
PiA+ID4gPiA+ID4gcHJvdGVjdGlvbi4KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAqLwo+ID4gPiA+ID4gPiArI2RlZmluZSBTUElfTk9SX0JQM19T
Ul9CSVQ2ICAgIEJJVCgxOCkgLyoKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAqIEJQMyBpcyBiaXQgNiBvZgo+ID4gPiA+ID4gPiBzdGF0dXMgcmVn
aXN0ZXIuCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKiBNdXN0IGJlIHVzZWQKPiA+ID4gPiA+ID4gd2l0aAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBB
cmUgd2Ugc2FmZSB0byByZXBsYWNlIFNQSV9OT1JfVEJfU1JfQklUNiBhbmQKPiA+ID4gPiA+IFNQ
SV9OT1JfQlAzX1NSX0JJVDYKPiA+ID4gPiA+IHdpdGggYQo+ID4gPiA+ID4gU1BJX05PUl9TUl9U
Ql9CSVQ2X0JQM19CSVQ1PyBPciBtYXliZSB3aXRoIGEKPiA+ID4gPiA+IFNQSV9OT1JfU1JfQlAz
X0JJVDZfVEJfQklUNSwgaG93Cj4gPiA+ID4gPiBpcyBtb3JlIGNvbnZlbmllbnQ/Cj4gPiA+ID4g
PiAKPiA+ID4gPiAKPiA+ID4gPiBMZXQncyB0aGluayBhYm91dCBzb21lIGZsYXNoIGluIHdoaWNo
IEJQMC0zIGV4aXN0cyBpbiB0aGUKPiA+ID4gPiBzdGF0dXMKPiA+ID4gPiByZWdpc3RlciBidXQg
VEIgZXhpc3RzIGluIGFub3RoZXIgcmVnaXN0ZXIuCj4gPiA+ID4gZm9yIGV4YW1wbGUsIG14MjV1
MTI4MzVmLgo+ID4gPiA+IEkgaGF2ZW4ndCB0ZXN0ZWQgeWV0LCBidXQgYWNjb3JkaW5nIHRvIHRo
ZSBkYXRhc2hlZXQsIEkgdGhpbmsKPiA+ID4gPiB0aGlzCj4gPiA+ID4gcGF0Y2ggY2FuIHN1cHBv
cnQgNGJpdCBibG9jayBwcm90ZWN0aW9uIGZvciB0aGUgZmxhc2guCj4gPiA+ID4gCj4gPiA+ID4g
SW4gb3JkZXIgdG8gZW1icmFjZSB0aGUgY2FzZSwgaG93IGFib3V0IGxldHRpbmcgdGhlbSBhcyBJ
dCBpcy4KPiA+ID4gPiBJcyB0aGVyZSBhbnkgc3VnZ2VzdGlvbj8KPiA+ID4gCj4gPiA+IEluIG15
IGJvYXJkKGhpc2lsaWNvbiBEMDYpIHRoZXJlIGlzICBhIG14MjV1MTI4MzVmIEZsYXNoLCBhbmQg
aQo+ID4gPiBlbmFibGUKPiA+ID4gU1BJX05PUl9IQVNfTE9DSyBhbmQgU1BJX05PUl9IQVNfQlAz
IHdoaWNoIGlzIG5vdCBlbmFibGVkIGluIHNwaS0KPiA+ID4gbm9yLmMsCj4gPiA+IGZpbmQgaXQg
c2VlbXMgbm90IHdvcms6Cj4gPiA+IAo+ID4gPiBFdWxlcjp+ICMgbHMgL2Rldi9tdGQwCj4gPiA+
IC9kZXYvbXRkMAo+ID4gPiBFdWxlcjp+ICMgLi9mbGFzaF9sb2NrIC1pIC9kZXYvbXRkMAo+ID4g
PiBEZXZpY2U6IC9kZXYvbXRkMAo+ID4gPiBTdGFydDogMAo+ID4gPiBMZW46IDB4MTAwMDAwMAo+
ID4gPiBMb2NrIHN0YXR1czogdW5sb2NrZWQKPiA+ID4gUmV0dXJuIGNvZGU6IDAKPiA+ID4gRXVs
ZXI6fiAjCj4gPiA+IEV1bGVyOn4gIyAuL2ZsYXNoX2xvY2sgL2Rldi9tdGQwCj4gPiA+IGZsYXNo
X2xvY2s6IGVycm9yITogY291bGQgbm90IGxvY2sgZGV2aWNlOiAvZGV2L210ZDAKPiA+ID4gCj4g
PiA+ICAgICAgICAgICAgICAgZXJyb3IgNSAoSW5wdXQvb3V0cHV0IGVycm9yKQo+ID4gPiBFdWxl
cjp+ICMgLi9mbGFzaF9sb2NrIC1pIC9kZXYvbXRkMAo+ID4gPiBEZXZpY2U6IC9kZXYvbXRkMAo+
ID4gPiBTdGFydDogMAo+ID4gPiBMZW46IDB4MTAwMDAwMAo+ID4gPiBMb2NrIHN0YXR1czogbG9j
a2VkCj4gPiA+IFJldHVybiBjb2RlOiAxCj4gPiA+IEV1bGVyOn4gIwo+ID4gPiAKPiA+ID4gSSBm
aW5kIHRoYXQgaW4gZnVuY3Rpb24gc3BpX25vcl93cml0ZV9zcl9hbmRfY2hlY2soKSwgaWYgc3Bp
X25vcgo+ID4gPiBoYXMKPiA+ID4gMTZiaXQgU1IsIHNwaV9ub3Jfd3JpdGVfMTZiaXRfc3JfYW5k
X2NoZWNrKCkgd2lsbCBiZSBjYWxsZWQsIGlmCj4gPiA+IG5vdAo+ID4gPiBzcGlfbm9yX3dyaXRl
X3NyMV9hbmRfY2hlY2soKSB3aWxsIGJlIGNhbGxlZC4KPiA+ID4gRm9yIG14MjV1MTI4MzVmLCBp
dCBqdXN0IGhhcyA4Yml0IFNSLCBidXQgU05PUl9GX0hBU18xNkJJVF9TUiBpcwo+ID4gPiBzZXQK
PiA+ID4gYXMKPiA+ID4gZGVmYXVsdCwgc28gaXQgY2F1c2VzIGFib3ZlIGlzc3VlOwo+ID4gPiBF
dmVuIGhhY2sgdGhlIGNvZGUgdG8gbm90IHNldCBmbGFnIFNOT1JfRl9IQVNfMTZCSVRfU1IsIGl0
IHNlZW1zCj4gPiA+IHRoYXQKPiA+ID4gbG9jayBpcyBzdGlsbCBub3QgdmFsaWRlZCBhcyBQcm9n
cmFtL0VyYXNlIHN0aWxsIHN1Y2Nlc3MgZXZlbiBpZgo+ID4gPiBpdAo+ID4gPiBpcwo+ID4gPiBs
b2NrZWQ6Cj4gPiA+IAo+ID4gCj4gPiBDb3VsZCB5b3UgZHVtcCBzciByZWdpc3RlciB2YWx1ZT8K
PiA+IEJ1dCBpZiB5b3UgYXJlIHVzaW5nIG9sZCBrZXJuZWwgb3IgdGhlIGZsYXNoIGRvZXNuJ3Qg
aGF2ZSBGU1IgZXJyb3IKPiA+IGJpdHMsIGVyYXNlL3Byb2dyYW0gb3BlcmF0aW9uIGZhaWx1cmUg
Y291bGRuJ3QgYmUgZGV0ZWN0ZWQuCj4gPiAKPiA+IHJlZmVyIHRoaXMgb25lLgo+ID4gCj4gPiAK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L2NvbW1pdC8/aD12NS42LXJjNCZpZD0yMGNjYjk5M2YyOWJkNmFkMTc2OTlkZDBi
MzQ5ZGIwODZlM2NhNzE5Cj4gCj4gVGhlIGtlcm5lbCBpIHVzZWQgaXMgNS41LXJjNCwgYW5kIGl0
IGluY2x1ZGVzIHRoZSBhYm92ZSBwYXRjaC4KPiBJIGFsc28gY2hlY2tlZCB0aGUgZGF0YXNoZWV0
IG9mIG14MjV1MTI4MzVmIGZsYXNoLCBhbmQgaXQgZG9lc24ndAo+IGhhdmUgCj4gRlNSIHJlZ2lz
dGVyLCBidXQgaXQgaGFzIG90aGVyIHJlZ2lzdGVyIFNDVVIoU2VjdXJpdHkgUmVpZ3N0ZXIsIAo+
IGJpdDYmYml0NSBhcmUKPiBFX0ZBSUwvUF9GQUlMIHdoaWNoIGkgdGhpbmsgdGhlIGZ1bmN0aW9u
IG9mIHRoZW0gYXJlIGxpa2UgdGhlCj4gYml0NSZiaXQ0IAo+IG9mIEZTUiByZWdpc3RlcikgLgo+
IAoKU28gdGhhdCBpcyB0aGUgb25lIG5vdCBoYXZpbmcgRlNSIHJlZ2lzdGVyLiBJZiBTQ1VSIGlz
IHVzZWQgZWxzZXdoZXJlCmVub3VnaCwgd2UgY291bGQgYWRkIGEgZmVhdHVyZSBmb3IgaXQgbGF0
ZXIuCgpUaGFua3MsCj4gCj4gPiAKPiA+IEkgYW0gcGxhbm5pbmcgdG8gcG9zdCBuZXcgcGF0Y2gg
Zm9yIDRiaXQgQmxvY2sgcHJvdGVjdGlvbiBzb29uLiBJCj4gPiB3b3VsZAo+ID4gYXBwcmVjaWF0
ZSBpdCBpZiB5b3UgY2hlY2sgdGhlcmUgdG9vLgo+IAo+IEl0J3MgbXkgcGxlYXN1cmUgdG8gY2hl
Y2sgaXQuCj4gCj4gPiAKPiA+IFRoYW5rcywKPiA+IAo+ID4gPiBFdWxlcjp+ICMgLi9mbGFzaF9s
b2NrIC1pIC9kZXYvbXRkMAo+ID4gPiBEZXZpY2U6IC9kZXYvbXRkMAo+ID4gPiBTdGFydDogMAo+
ID4gPiBMZW46IDB4MTAwMDAwMAo+ID4gPiBMb2NrIHN0YXR1czogdW5sb2NrZWQKPiA+ID4gUmV0
dXJuIGNvZGU6IDAKPiA+ID4gRXVsZXI6fiAjCj4gPiA+IEV1bGVyOn4gIyAuL210ZF9kZWJ1ZyBl
cmFzZSAvZGV2L210ZDAgMHhlNDAwMDAgNDA5Ngo+ID4gPiBFcmFzZWQgNDA5NiBieXRlcyBmcm9t
IGFkZHJlc3MgMHgwMGU0MDAwMCBpbiBmbGFzaAo+ID4gPiBFdWxlcjp+ICMKPiA+ID4gRXVsZXI6
fiAjIC4vZmxhc2hfbG9jayAvZGV2L210ZDAKPiA+ID4gRXVsZXI6fiAjCj4gPiA+IEV1bGVyOn4g
IyAuL2ZsYXNoX2xvY2sgLWkgL2Rldi9tdGQwCj4gPiA+IERldmljZTogL2Rldi9tdGQwCj4gPiA+
IFN0YXJ0OiAwCj4gPiA+IExlbjogMHgxMDAwMDAwCj4gPiA+IExvY2sgc3RhdHVzOiBsb2NrZWQK
PiA+ID4gUmV0dXJuIGNvZGU6IDEKPiA+ID4gRXVsZXI6fiAjCj4gPiA+IEV1bGVyOn4gIyAuL210
ZF9kZWJ1ZyBlcmFzZSAvZGV2L210ZDAgMHhlNDAwMDAgNDA5Ngo+ID4gPiBFcmFzZWQgNDA5NiBi
eXRlcyBmcm9tIGFkZHJlc3MgMHgwMGU0MDAwMCBpbiBmbGFzaAo+ID4gPiBFdWxlcjp+ICMgLi9m
bGFzaF9sb2NrIC1pIC9kZXYvbXRkMAo+ID4gPiBEZXZpY2U6IC9kZXYvbXRkMAo+ID4gPiBTdGFy
dDogMAo+ID4gPiBMZW46IDB4MTAwMDAwMAo+ID4gPiBMb2NrIHN0YXR1czogbG9ja2VkCj4gPiA+
IFJldHVybiBjb2RlOiAxCj4gPiA+IEV1bGVyOn4gIwo+ID4gPiBFdWxlcjp+ICMKPiA+ID4gCj4g
PiA+IAo+ID4gPiBUaGFua3MsCj4gPiA+IGNoZW54aWFuZwo+ID4gPiAKPiA+ID4gCj4gPiA+ID4g
PiBDaGVlcnMsCj4gPiA+ID4gPiB0YQo+ID4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+ID4g
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4gPiA+ID4gCj4gPiAKPiA+IApodHRw
czovL3Byb3RlY3QyLmZpcmVleWUuY29tL3VybD9rPTgxZjUyYmFjLWRjMjE5NmU4LTgxZjRhMGUz
LTBjYzQ3YTMxMzgxYS1jZmVmZjJmYjc0OTI2MWFlJnU9aHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCj4gPiA+ID4gLgo+ID4gPiA+IAo+ID4gPiAK
PiA+ID4gCj4gPiAKPiA+IC4KPiA+IAo+IAo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
