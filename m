Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2600E94136
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 23:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyGbcfwijwv7eYNWzkCERlV8UQFuCYWESI282XvQVpg=; b=iHIbUkqjsFkg8j
	MSGTzpx9Y12oVBrsGKrNvjlK68IdiVmkFvPaIeFZQk0fySrKh6KJrrE0lx0BFLiyZiB/gYLSgsDp3
	/Lrd3x8CRFpexo4AEFJ1YlYG4x/LR/zpeUpQYB3UjJxrE9SsLb2Rks2UBH9wi0wHE2TSpTqFY204D
	2tAo/CNJmUvutYuvMdbqr0IMmNe4XVtyK8LgH5cYIikY3TT5DS/U7V3TZtbbQV7MD6E8dDTQRFs2v
	trPEAsY02GR4f4hV60X+DV9m7atHutWHRmQf3zXBOSXYGW2wqcU6LmO+pXzZPTscmBDFvpz88BhWQ
	Wm7rrze+Su0Oq6buTqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qotqY-006d6D-01;
	Fri, 06 Oct 2023 23:03:02 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qotqS-006d4k-1n;
	Fri, 06 Oct 2023 23:02:59 +0000
Received: from eig-obgw-5001a.ext.cloudfilter.net ([10.0.29.139])
	by cmsmtp with ESMTP
	id oqs4qoWeQNWIeotqOqjgWq; Fri, 06 Oct 2023 23:02:52 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id otqNqrKIaaNfxotqNqZQoe; Fri, 06 Oct 2023 23:02:52 +0000
X-Authority-Analysis: v=2.4 cv=NLjGRm2g c=1 sm=1 tr=0 ts=6520921c
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=Dx1Zrv+1i3YEdDUMOX3koA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=wYkD_t78qR0A:10 a=P-IC7800AAAA:8
 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8
 a=mK_AVkanAAAA:8 a=Ikd4Dj_1AAAA:8 a=i0EeH86SAAAA:8 a=JfrnYn6hAAAA:8
 a=NEAV23lmAAAA:8 a=cm27Pg_UAAAA:8 a=csSI4ce9OAwHNZIND1oA:9 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=aeg5Gbbo78KNqacMgKqU:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=AjGcO6oz07-iQ99wixmX:22 a=3gWm3jAn84ENXaBijsEo:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3wWS+KHIdA9zkMV46QWcShY3l4cnXlREbKpL1SFSwiA=; b=KmoqDeHEqpebkY25NU3zGnYeSv
	OdlLE46gwluT+8j88AXfTqeP9pvO6mtR48D9aYO990sPLej+I/pfa1Qf0JqIV1vSfO+IzT3dx2ElA
	nzT72OiaJjAxF39cY2rjbAPnjfl8ejL4qXicxjtIA97eK+U9vE7E4xU+gxFekDNqEAfySdrxKZFQj
	edM77xw59RmwNWyTJEjLPpQeHvSgak1ghNvAhLvILe1YxIEvWaUxmyJDclsJhvSuxp22YkiC1xfp7
	UxVAcyZCNU5D0smv6LtpqHnPugRoUMhwF7EtcVHYzHeN5lCjpuR95OFjdYojyVU1m1nu4ZFYpWCvh
	9P5xXg+w==;
Received: from 94-238-9-39.abo.bbox.fr ([94.238.9.39]:47408 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qorku-001Bge-1W;
	Fri, 06 Oct 2023 15:49:04 -0500
Message-ID: <e177380b-6216-4bc3-8232-41663a828821@embeddedor.com>
Date: Fri, 6 Oct 2023 22:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: Annotate struct mtk_nfc_nand_chip with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <treding@nvidia.com>, Roger Quadros <rogerq@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Cai Huoqing <cai.huoqing@linux.dev>, Chuanhong Guo <gch981213@gmail.com>,
 Rob Herring <robh@kernel.org>, Li Zetao <lizetao1@huawei.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20231006201728.work.750-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231006201728.work.750-kees@kernel.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.238.9.39
X-Source-L: No
X-Exim-ID: 1qorku-001Bge-1W
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 94-238-9-39.abo.bbox.fr ([192.168.1.98]) [94.238.9.39]:47408
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHqhaivXSbrLOLfUO8rqG8p/6LlRriA6bU7YrkB14/EY5w1BbvjD08LPjjEhgTv27anpgsYvRvX0f7QehLCw7wUQSTdSc2vB7rUee+pUVxIM0hXZNj7K
 vaSLZLg6hucxNcOYrgLE1Q3o/bgjNz0Du8sXngXQfm5d2/mtjKfzqtrm393MPullItJlpCebVcgKEwqcBWXVHyO+gJk6xfw12zs2oiTTJmzJ8R/rWaqFytUN
 6AdYfQgcssfnaUGEIE0bR8WbhA5yznqKVXLRXhfFQIqAwlwa7i/FJRmz9BMOubmG3aZibQj6o0uzUYll6JqZugvdEe9VRoq7nM1SBdj/hwg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_160256_664775_D2F2E47C 
X-CRM114-Status: GOOD (  11.28  )
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
c3RydWN0Cj4gbXRrX25mY19uYW5kX2NoaXAuCj4gCj4gQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBu
b2QuYXQ+Cj4gQ2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPiBDYzog
TWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPiBDYzogQW5nZWxvR2lv
YWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNv
bT4KPiBDYzogIkd1c3Rhdm8gQS4gUi4gU2lsdmEiIDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+Cj4g
Q2M6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4gQ2M6IE1hcnRpbiBCbHVtZW5z
dGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cj4gQ2M6IFRoaWVycnkg
UmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gQ2M6IFJvZ2VyIFF1YWRyb3MgPHJvZ2VycUBr
ZXJuZWwub3JnPgo+IENjOiAiVXdlIEtsZWluZS1Lw7ZuaWciIDx1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU+Cj4gQ2M6IENhaSBIdW9xaW5nIDxjYWkuaHVvcWluZ0BsaW51eC5kZXY+Cj4g
Q2M6IENodWFuaG9uZyBHdW8gPGdjaDk4MTIxM0BnbWFpbC5jb20+Cj4gQ2M6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+Cj4gQ2M6IExpIFpldGFvIDxsaXpldGFvMUBodWF3ZWkuY29tPgo+
IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IENjOiBsaW51eC1oYXJkZW5pbmdAdmdlci5rZXJuZWwub3JnCj4gTGluazogaHR0cHM6
Ly9naXRodWIuY29tL2tlZXMva2VybmVsLXRvb2xzL2Jsb2IvdHJ1bmsvY29jY2luZWxsZS9leGFt
cGxlcy9jb3VudGVkX2J5LmNvY2NpIFsxXQo+IFNpZ25lZC1vZmYtYnk6IEtlZXMgQ29vayA8a2Vl
c2Nvb2tAY2hyb21pdW0ub3JnPgoKUmV2aWV3ZWQtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1
c3Rhdm9hcnNAa2VybmVsLm9yZz4KClRoYW5rcyEKLS0gCkd1c3Rhdm8KCj4gLS0tCj4gICBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L210a19uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jCj4g
aW5kZXggMjljOGJkZGRlNjdmLi42MDE5OGUzM2QyZDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbXRrX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19u
YW5kLmMKPiBAQCAtMTMwLDcgKzEzMCw3IEBAIHN0cnVjdCBtdGtfbmZjX25hbmRfY2hpcCB7Cj4g
ICAJdTMyIHNwYXJlX3Blcl9zZWN0b3I7Cj4gICAKPiAgIAlpbnQgbnNlbHM7Cj4gLQl1OCBzZWxz
W107Cj4gKwl1OCBzZWxzW10gX19jb3VudGVkX2J5KG5zZWxzKTsKPiAgIAkvKiBub3RoaW5nIGFm
dGVyIHRoaXMgZmllbGQgKi8KPiAgIH07Cj4gICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
