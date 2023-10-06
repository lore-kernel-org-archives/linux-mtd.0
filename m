Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEDEE94115
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 20:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GoyK2SY8coEvf44k5B4l4e7jqqf0xnf976AS/bXbh/I=; b=syF9XICuIB7L4/
	jgKj/Pwo9jqr60ctxalLab3JVdk6R7G+V2ZbmrJowZ/KRP9V1x5PAcECkqRwWfrGdrbs2xOp2pqte
	Mt8ct8NBw11Il56sZ+afQBgWNf1w+kqgfk9vV38H3RBFKuacWac9d5MXcdxWRjOQhJlYkRabpVZki
	+YT2MOvzYCbbwPBBmxl9y7OqWnW3VV2htA8dX8M+rsbvwaMBMjjir5l0EUpbuabL+1WH75nYNgUAA
	3I/9g8mhKPEajDAWHftHLNzJUolvOIvwnTH2ykQ8UjvsbGBdEQp8R6ba/8RXJZtBCzGPFFukKAU/P
	DvdPhtvyEucmONh+WQ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qorkb-006TZV-2g;
	Fri, 06 Oct 2023 20:48:45 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qorkW-006TYn-0l
	for linux-mtd@lists.infradead.org;
	Fri, 06 Oct 2023 20:48:41 +0000
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
	by cmsmtp with ESMTP
	id orRIqHAERaLCxorkTqnpoL; Fri, 06 Oct 2023 20:48:37 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id orkSqavcAsqNForkSqbosK; Fri, 06 Oct 2023 20:48:36 +0000
X-Authority-Analysis: v=2.4 cv=aPzjFJxm c=1 sm=1 tr=0 ts=652072a4
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=Dx1Zrv+1i3YEdDUMOX3koA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=wYkD_t78qR0A:10 a=P-IC7800AAAA:8
 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=mK_AVkanAAAA:8 a=XYAwZIGsAAAA:8
 a=Ikd4Dj_1AAAA:8 a=i0EeH86SAAAA:8 a=T1oDNNq1AAAA:8 a=1RTuLK3dAAAA:8
 a=JfrnYn6hAAAA:8 a=NEAV23lmAAAA:8 a=cm27Pg_UAAAA:8 a=0yL73Cyy68KADmUz8mEA:9
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=aeg5Gbbo78KNqacMgKqU:22
 a=AjGcO6oz07-iQ99wixmX:22 a=3gWm3jAn84ENXaBijsEo:22 a=E8ToXWR_bxluHZ7gmE-Z:22
 a=RDR0i3bhJUuoZSeB_ChE:22 a=kRpfLKi8w9umh8uBmg1i:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4QrkZaC8I3x+NYPAvbO6PQjOx4YgS6vmJGhsbvHZz6U=; b=bJlEBsDz1hqI5968UGUp4/OqSs
	w37DXwT5z/QF2u+CJ+69fe0W1KOlticXzJC7x5TKCPWEbfL8nJ0DWX01of6UBL7G6GJZjAV74wKhx
	HKRiRHZcX3SLHP1k4y25URrB/7zaQqUfFxQrbDu2YOeeVG3YZ9TrdKKy6mFufaXM0aOyozQsLSQAh
	W6GY9OoQXk+uIeYryRdfXT/9mKDSkOL2/qmPTuOs7EDqf9j4NMtjM1yKoQ02Gh9jQ6tUKDWXXsR1B
	XqWo+vFkBCXhkbVwIfuCUpWM10KUXvPzi9CcW5YGbREPfrBIFzVmwnVJ2N/C4mymoCwfHJyuqC9Q6
	3QEytMCA==;
Received: from 94-238-9-39.abo.bbox.fr ([94.238.9.39]:47408 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qorkQ-001Bge-1H;
	Fri, 06 Oct 2023 15:48:34 -0500
Message-ID: <bc89b149-8a93-4677-823a-72302a1876ef@embeddedor.com>
Date: Fri, 6 Oct 2023 22:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: cadence: Annotate struct cdns_nand_chip
 with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Roger Quadros <rogerq@kernel.org>, Thierry Reding <treding@nvidia.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Valentin Korenblit <vkorenblit@sequans.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20231006201734.work.060-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231006201734.work.060-kees@kernel.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.238.9.39
X-Source-L: No
X-Exim-ID: 1qorkQ-001Bge-1H
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 94-238-9-39.abo.bbox.fr ([192.168.1.98]) [94.238.9.39]:47408
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 85
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfH2Eljb7cIoASNTiB9Eq+vIDDHmIOX7sf+mly1pAmKF4/h5fylVnXXK7TfhWDVqZPulEkWAttXa2sdEH9gK2RJG/zR9xe0tpYxh6x9iLJMc2Kl+BsM3r
 OKsfxKZXIZLLLKANBk4d8TGLHEXJkqfVaaCDJ5Q42DUCkU6v+HBXD88flkxPVjgjlX4ivdrUbFJ/6hbW4wII1z5XVZmg259hsNpv2OH1K5rxYqXV1VzoDJso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_134840_363384_055CFF8B 
X-CRM114-Status: GOOD (  10.71  )
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

CgpPbiAxMC82LzIzIDIyOjE3LCBLZWVzIENvb2sgd3JvdGU6Cj4gUHJlcGFyZSBmb3IgdGhlIGNv
bWluZyBpbXBsZW1lbnRhdGlvbiBieSBHQ0MgYW5kIENsYW5nIG9mIHRoZSBfX2NvdW50ZWRfYnkK
PiBhdHRyaWJ1dGUuIEZsZXhpYmxlIGFycmF5IG1lbWJlcnMgYW5ub3RhdGVkIHdpdGggX19jb3Vu
dGVkX2J5IGNhbiBoYXZlCj4gdGhlaXIgYWNjZXNzZXMgYm91bmRzLWNoZWNrZWQgYXQgcnVuLXRp
bWUgdmlhIENPTkZJR19VQlNBTl9CT1VORFMgKGZvcgo+IGFycmF5IGluZGV4aW5nKSBhbmQgQ09O
RklHX0ZPUlRJRllfU09VUkNFIChmb3Igc3RyY3B5L21lbWNweS1mYW1pbHkKPiBmdW5jdGlvbnMp
Lgo+IAo+IEFzIGZvdW5kIHdpdGggQ29jY2luZWxsZVsxXSwgYWRkIF9fY291bnRlZF9ieSBmb3Ig
c3RydWN0IGNkbnNfbmFuZF9jaGlwLgo+IAo+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgo+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0
Pgo+IENjOiBWaWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+Cj4gQ2M6ICJHdXN0
YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPgo+IENjOiBNYXJ0aW4gQmx1
bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+IENjOiBOaWNv
bGFzIEZlcnJlIDxuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb20+Cj4gQ2M6IFJvZ2VyIFF1YWRy
b3MgPHJvZ2VycUBrZXJuZWwub3JnPgo+IENjOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0Budmlk
aWEuY29tPgo+IENjOiBZYW5nIFlpbmdsaWFuZyA8eWFuZ3lpbmdsaWFuZ0BodWF3ZWkuY29tPgo+
IENjOiAiVXdlIEtsZWluZS1Lw7ZuaWciIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
Cj4gQ2M6IFZhbGVudGluIEtvcmVuYmxpdCA8dmtvcmVuYmxpdEBzZXF1YW5zLmNvbT4KPiBDYzog
eWUgeGluZ2NoZW4gPHllLnhpbmdjaGVuQHp0ZS5jb20uY24+Cj4gQ2M6IGxpbnV4LW10ZEBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LWhhcmRlbmluZ0B2Z2VyLmtlcm5lbC5vcmcKPiBM
aW5rOiBodHRwczovL2dpdGh1Yi5jb20va2Vlcy9rZXJuZWwtdG9vbHMvYmxvYi90cnVuay9jb2Nj
aW5lbGxlL2V4YW1wbGVzL2NvdW50ZWRfYnkuY29jY2kgWzFdCj4gU2lnbmVkLW9mZi1ieTogS2Vl
cyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CgpSZXZpZXdlZC1ieTogR3VzdGF2byBBLiBS
LiBTaWx2YSA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPgoKVGhhbmtzIQotLSAKR3VzdGF2bwoKPiAt
LS0KPiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLmMgfCAy
ICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FkZW5jZS1uYW5kLWNvbnRyb2xs
ZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLmMKPiBp
bmRleCAwMzRlYzU2NGMyZWQuLjdkNWVmN2ZmZTBmZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9jYWRlbmNlLW5hbmQtY29udHJvbGxlci5jCj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvY2FkZW5jZS1uYW5kLWNvbnRyb2xsZXIuYwo+IEBAIC01MjYsNyArNTI2LDcgQEAg
c3RydWN0IGNkbnNfbmFuZF9jaGlwIHsKPiAgIAkvKiBFQ0Mgc3RyZW5ndGggaW5kZXguICovCj4g
ICAJdTggY29ycl9zdHJfaWR4Owo+ICAgCj4gLQl1OCBjc1tdOwo+ICsJdTggY3NbXSBfX2NvdW50
ZWRfYnkobnNlbHMpOwo+ICAgfTsKPiAgIAo+ICAgc3RydWN0IGVjY19pbmZvIHsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
