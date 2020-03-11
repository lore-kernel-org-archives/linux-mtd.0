Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CDEC10F27
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 14:47:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9AAD206BE
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 14:47:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k2BPJ4M7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WLW62g7o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9AAD206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VZRHXO0O5eKhs44WRZUYLOnXop3TOAmn8mbuhcU9iFs=; b=k2BPJ4M7KAN0DP
	AXhUKV3SbYPSpGfxTRMVMVT5/BVPYPDa7JeerHjnifguh+1pjQF94CO5BN0OTznJeMYRkqgzgwdJp
	ARXBSwAuIOnohtsrpOYkXwdqK/dJ5qRS+luRIQVTKfVrDrDLtcDQPnipFSrvkgodUbhm8bewdGbvY
	JO482FViWsd7U7CGZYtganyK/bEODpU0tkt7vNwBnHjDIN9DaXxVFXeuYBeI/eWh9lPSd0oxzqyIs
	xwL+Ufd+FgCMgit5au0E93mOFFWjptl4kUpZyJjEnx87eX1Yst8N/aquMZwCQnQHGgAfCKRRRalKj
	k+p0/p/4fkAoL/5Ae+kQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC2Mz-0005qs-RB; Wed, 11 Mar 2020 14:30:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC2My-0005qR-9d
 for linux-mtd@bombadil.infradead.org; Wed, 11 Mar 2020 14:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=EHGSE9Rn4+PHeIVMpkAcNng1vlgYGQ+mYuwSNp3VuvY=; b=WLW62g7oTHJsPnHpuM/4TFmzrw
 YHzqNt5YtDqQP6GtHeeD9K7qmDNhn70pckGora/D6NdGIpgfGq9e67lBHMR3YPRowid5lZF/oqRg7
 FQT0zqLpSJi28R7gZh2F+I/niJz0HmyiRwaek9ueDdV8Wx2PSUPRpYgxg/18F5tCp7moGQStEiuyF
 NDVckquBVHpk3xi5Q7OQ1Jgsq1NG1Ty5yr8naJ3mT+8/GrE1L43G8K53szHcQdfj0YFmq2sUTmoco
 wmLEzAxGXo0lcPFSjozRMeKQ1mFFQMzDwl/sapVoI7h8EyWE2fET1nZf0JBCK9QsHXgdkW+iVWY/O
 WPZUA8cg==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC2Mu-0007A1-BC
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 14:29:58 +0000
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9615760009;
 Wed, 11 Mar 2020 14:29:23 +0000 (UTC)
Date: Wed, 11 Mar 2020 15:29:22 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH -next 013/491] INGENIC JZ47xx SoCs: Use fallthrough;
Message-ID: <20200311152922.2dc56137@xps13>
In-Reply-To: <CAPDyKFo2UensmH_gYkH+u22bs=K9Xn0q3Dr9v6tq6GPNRg_Lew@mail.gmail.com>
References: <cover.1583896344.git.joe@perches.com>
 <ad408ff8dc4e5fae0884312cb0aa618664e546e5.1583896348.git.joe@perches.com>
 <20200311084052.3ca3c331@xps13>
 <CAPDyKFo2UensmH_gYkH+u22bs=K9Xn0q3Dr9v6tq6GPNRg_Lew@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_142956_508774_9F182C1F 
X-CRM114-Status: GOOD (  17.93  )
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
Cc: alsa-devel@alsa-project.org, Vignesh Raghavendra <vigneshr@ti.com>,
 David Airlie <airlied@linux.ie>, Richard Weinberger <richard@nod.at>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Joe Perches <joe@perches.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ClVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPiB3cm90ZSBvbiBXZWQsIDExIE1h
ciAyMDIwIDE1OjIwOjU5CiswMTAwOgoKPiBPbiBXZWQsIDExIE1hciAyMDIwIGF0IDA4OjQwLCBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiBI
aSBKb2UsCj4gPgo+ID4gSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4gd3JvdGUgb24gVHVl
LCAxMCBNYXIgMjAyMCAyMTo1MToyNyAtMDcwMDoKPiA+ICAKPiA+ID4gQ29udmVydCB0aGUgdmFy
aW91cyB1c2VzIG9mIGZhbGx0aHJvdWdoIGNvbW1lbnRzIHRvIGZhbGx0aHJvdWdoOwo+ID4gPgo+
ID4gPiBEb25lIHZpYSBzY3JpcHQKPiA+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC9iNTY2MDJmY2Y3OWY4NDllNzMzZTdiNTIxYmIwZTE3ODk1ZDM5MGZhLjE1ODIyMzAzNzku
Z2l0LmpvZS5jb20vCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvZSBQZXJjaGVzIDxqb2VA
cGVyY2hlcy5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5n
ZW5pYy1kcm0uYyAgICAgICAgICAgfCAyICstCj4gPiA+ICBkcml2ZXJzL21tYy9ob3N0L2p6NDc0
MF9tbWMuYyAgICAgICAgICAgICAgICAgICB8IDYgKystLS0tCj4gPiA+ICBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZF9kcnYuYyB8IDIgKy0KPiA+ID4gIGRyaXZlcnMv
bXRkL25hbmQvcmF3L2luZ2VuaWMvano0NzI1Yl9iY2guYyAgICAgIHwgNCArKy0tCj4gPiA+ICBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2p6NDc4MF9iY2guYyAgICAgICB8IDQgKystLQo+
ID4gPiAgc291bmQvc29jL2NvZGVjcy9qejQ3NzAuYyAgICAgICAgICAgICAgICAgICAgICAgfCAy
ICstCj4gPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25z
KC0pICAKPiA+Cj4gPiBJIGxpa2UgdmVyeSBtdWNoIHRoZSBuZXcgd2F5IHRvIGFkdmVydGlzZSBm
b3IgZmFsbHRocm91Z2ggc3RhdGVtZW50cywKPiA+IGJ1dCBJIGFtIG5vdCB3aWxsaW5nIHRvIHRh
a2UgYW55IHBhdGNoIGNvbnZlcnRpbmcgYSBzaW5nbGUgZHJpdmVyCj4gPiBhbnltb3JlLiBJIGhh
ZCB0b28gbWFueSBmcm9tIEd1c3Rhdm8gd2hlbiB0aGVzZSBjb21tZW50cyBoYWQgdG8gYmUKPiA+
IGluc2VydGVkLiBJIHdvdWxkIHJlYWxseSBwcmVmZXIgYSBNVEQtd2lkZSBvciBhIE5BTkQtd2lk
ZSBvciBhdCBsZWFzdCBhCj4gPiByYXctTkFORC13aWRlIHNpbmdsZSBwYXRjaCAoYW55dGhpbmcg
aW5zaWRlIGRyaXZlcnMvbXRkL25hbmQvcmF3LykuCj4gPgo+ID4gSG9wZSB5b3UnbGwgdW5kZXJz
dGFuZCEgIAo+IAo+IEkgZnVsbHkgYWdyZWUgKGZvciBtbWMpLiBPbmUgcGF0Y2ggcGxlYXNlLgo+
IAo+IEFub3RoZXIgb3B0aW9uIGlzIHRvIG1ha2UgYSBiaWcgZmF0IHRyZWUgd2lkZSBwYXRjaCBh
bmQgYXNrIExpbnVzIGlmCj4gaGUgd2FudCB0byBwaWNrIHVwIGltbWVkaWF0ZWx5IGFmdGVyIGFu
IHJjMS4gVGhhdCBzaG91bGQgY2F1c2UgbGVzcwo+IGRpc3R1cmJhbmNlIGZvciBldmVyeW9uZSwg
bm8/CgpBYnNvbHV0ZWx5LgoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
