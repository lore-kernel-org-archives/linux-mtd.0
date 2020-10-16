Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD416C433E7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 03:06:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECB3620897
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 03:06:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ll65Bc/g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDPZeG3N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECB3620897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ATwxDSI4m36PzGnIHTZ+9krPzQchJQs33ObZmoeJMak=; b=Ll65Bc/gYw9kaOZAGf67WIDDM
	ushKORz2DKD9SJKrfTCpXjnrrbtem9QqIR2FX/tb49e28jkbosuwyrrfN8Ul/WHlSZkjrO/rZxyyN
	UNvEvCBpO26oMQh/LsXdg0gfILrv0eFgfEYDCwMvQrlPF/XzISGESH/eFJPIanre/YdJFTZ8M3QBP
	/nv+qLiikNzpHmcfz5nNg0BNnJOqss2RNIbU+6oQ+XWBqFuo2HBLQzWlmgQrhIbfNWVDl4o2SkOJK
	EW+wahb50T2E832PcEnPBw41D12bAtIJD+Jsv96LwS3Xwo/KNl+aLs8PFscfQP+dVrbH50tegZ3pj
	00CZWfGfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTG2n-0006Cu-To; Fri, 16 Oct 2020 03:04:37 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTG2f-0006CP-Sc
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 03:04:30 +0000
Received: by mail-io1-xd41.google.com with SMTP id n6so1950903ioc.12
 for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2020 20:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QlQl4UYEqr8OoixpA9p74w9k/b0lT4Ty3QUeEeavWyE=;
 b=TDPZeG3N/5tz8KuQMTa93KOmho2wVzVXvBCMAh1/2loHyuWzv0QuTcaGx2nuA4UEGO
 xY/D7CoqACApTCgoWqkTON7ukqQm1nVdzdaae/649yBHzbrPLModyrr910PmRiIKgLFZ
 NQ0a9mjnMvosZYcily/K0umtTFUarCo7Laen8mYOBJchspSaMR9BlzW9UJElyOPZ5TMj
 J7mTAZAwV5798gk3Qbjfz3HLZXS4ViAUFKXjhNzRdg47BofKJktPtS7VSDYhiyisjOPF
 N8Ld6+84uUztcqi2381jlqX7I7UHIPxMNIjAmORBe83jeVA2QiIqmQv6DWpU5DkhkDWs
 T/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QlQl4UYEqr8OoixpA9p74w9k/b0lT4Ty3QUeEeavWyE=;
 b=lUkFtglRuXnEW9oG5e+1hyegDoeimg8Wu8rmkVpYsy1B8QT1HTr6KOJ1texhPZb0k8
 LjMzuvUwsV4CuV9WWZe8edwG8x0rwL1S9nKAICT7bacCZIFHhAextYoxhUFdaYRk2BMF
 SreI8WHRi+oi8OT2JM2rUI8dcYR462R20OHnWE6zpSDOU2uQf+wIBLWcCsAEQ31ilSlD
 39dRAp4+d4Dll5il2lOvcDdI+Exg91QzhhT/lz7PD5btHyd/YsLpTBUR5H1pBIC3RH3k
 9TYQerCLoe1nCfIUq4sSAGkEO90ao9rgdDsNzTi2/xunhiU9Fg8nV4tT4rs8AL7JR1A8
 iDog==
X-Gm-Message-State: AOAM5336bJDmv43IeXAPkBKB+iXqMF5GNryV2W3MloES/8s61jQPn0rJ
 KFHil69cpO3eebk2vtrZ67NJeWv8g3r15pNy6ns=
X-Google-Smtp-Source: ABdhPJx06MITyZqyBD3brhEcgCtx9bEnPl27tLRP9tnIbubA2rNeQrUB6+fJg4lpaMN+5pnm0BHG9VkPsESY8Q9vaeI=
X-Received: by 2002:a05:6602:29d4:: with SMTP id
 z20mr856178ioq.207.1602817465666; 
 Thu, 15 Oct 2020 20:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
 <20200921094010.GH21278@pengutronix.de> <20200928172012.712035f8@xps13>
 <CAOMZO5CzNrGnwAB4zuUzeO3LVUqxaD4u0UXfYO8HBNcKSS-mvw@mail.gmail.com>
 <CAOMZO5D8W+Z5enehxFt7XTPn6sEXe9pWM6Tn1SixMntkZ31Wgw@mail.gmail.com>
 <20200930165831.418b8edd@xps13>
 <CAOMZO5BVHBqxLSEZgEqHEdAXstaK8GHHqjQnY+FtOJhXjX--qw@mail.gmail.com>
 <622a62489fa717fe8a94cd2e9cdf3d906da5141f.camel@pengutronix.de>
 <CAOMZO5Cq6v0OvpLSYwqqpHQFDjviM3mwozHcH35qoOTFvdnJ-w@mail.gmail.com>
 <20201014152659.6ef6a2fc@xps13>
In-Reply-To: <20201014152659.6ef6a2fc@xps13>
From: Han Xu <xhnjupt@gmail.com>
Date: Thu, 15 Oct 2020 22:04:14 -0500
Message-ID: <CA+EcR200pOT8F=xS+Fh_gyJMF9ZGxFU6Y+RDRg6XyntyR2yGdA@mail.gmail.com>
Subject: Re: imx27: Unsupported ECC algorithm
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_230429_934925_28CC4439 
X-CRM114-Status: GOOD (  22.57  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgMTQsIDIwMjAgYXQgODozMiBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIEZhYmlvLCBTYXNjaGEsIEx1Y2FzLAo+Cj4g
RmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPiB3cm90ZSBvbiBXZWQsIDE0IE9jdCAy
MDIwIDA5OjIzOjA2Cj4gLTAzMDA6Cj4KPiA+IEhpIEx1Y2FzLAo+ID4KPiA+IE9uIFR1ZSwgT2N0
IDEzLCAyMDIwIGF0IDI6MTQgUE0gTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+
IHdyb3RlOgo+ID4KPiA+ID4gSnVzdCBhIGhlYWRzIHVwOiBvdXIgbGFiIHdhcyBicm9rZW4gZm9y
IHNvbWUgdGltZSBkdWUgdG8gYSBsb2NhbCBpc3N1ZS4KPiA+ID4gSXQncyBub3cgYmFjayB0byB3
b3JraW5nIGFuZCB0aGUgYmFja2xvZyBvZiBqb2JzIGlzIGJlaW5nIGV4ZWN1dGVkIG9uCj4gPiA+
IHRoZSBib2FyZHMgcmlnaHQgbm93LCBzbyByZXN1bHRzIHNob3VsZCBzaG93IHVwIGluIHRoZSBu
ZWFyIGZ1cnR1cmUuCj4gPgo+ID4gVGhhbmtzLiBrZXJuZWxjaSByZXN1bHRzIGFyZSBzaG93aW5n
IHVwIGFnYWluLgo+ID4KPiA+IEhpIE1pcXVlbCwKPiA+Cj4gPiBUaGUgRUNDIGlzc3VlcyBhcmUg
c3RpbGwgcHJlc2VudCBvbiBpbXgyNy1waHl0ZWMtcGh5Y2FyZC1zLXJkazoKPiA+IGh0dHBzOi8v
c3RvcmFnZS5rZXJuZWxjaS5vcmcvbmV4dC9tYXN0ZXIvbmV4dC0yMDIwMTAxMy9hcm0vaW14X3Y0
X3Y1X2RlZmNvbmZpZy9nY2MtOC9sYWItcGVuZ3V0cm9uaXgvYmFzZWxpbmUtaW14MjctcGh5dGVj
LXBoeWNhcmQtcy1yZGsuaHRtbAo+ID4KPiA+IEJUVywgRUNDIGVycm9ycyBhcmUgYWxzbyByZXBv
cnRlZCBvbiBhIEZyZWVzY2FsZSBMYXllcnNjYXBlIDIwODhBIFJEQiBCb2FyZDoKPiA+IGh0dHBz
Oi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2lvbW11L21zZzQ5NzcyLmh0bWwKPiA+Cj4KPiBJIHN1
cHBvc2VkIHRoZSBmYWlsaW5nIGRpdmlzaW9uIGlzIHRoaXMgb25lOgo+Cj4gICAgICAgICAvKgo+
ICAgICAgICAgICogU2V0IHRoZSBudW1iZXIgb2YgcmVhZCAvIHdyaXRlIHN0ZXBzIGZvciBvbmUg
cGFnZSBkZXBlbmRpbmcgb24gRUNDCj4gICAgICAgICAgKiBtb2RlLgo+ICAgICAgICAgICovCj4g
ICAgICAgICBlY2MtPnN0ZXBzID0gbXRkLT53cml0ZXNpemUgLyBlY2MtPnNpemU7Cj4gICAgICAg
ICBpZiAoZWNjLT5zdGVwcyAqIGVjYy0+c2l6ZSAhPSBtdGQtPndyaXRlc2l6ZSkgewo+ICAgICAg
ICAgICAgICAgICBXQVJOKDEsICJJbnZhbGlkIEVDQyBwYXJhbWV0ZXJzXG4iKTsKPiAgICAgICAg
ICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiAgICAgICAgICAgICAgICAgZ290byBlcnJfbmFuZF9t
YW51Zl9jbGVhbnVwOwo+ICAgICAgICAgfQo+Cj4gV2hpY2ggcHJvZHVjZXMgdGhlIHdhcm5pbmcg
cmlnaHQgYWZ0ZXIuIFRoaXMgd291bGQgbWVhbiB0aGF0Cj4KPiAgICAgICAgIGVjYy0+c2l6ZSA9
PSAwCj4KPiBCdXQgdGhpcyBlbnRyeSBpcyBzZXQgYmVmb3JlIGNhbGxpbmcgbmFuZF9zY2FuKCkg
aW4gbXhjbmRfcHJvYmUoKSB0bwo+IDUxMiwgYW5kIHRoYXQgZG9lcyBub3QgbWFrZSBzZW5zZS4K
Pgo+IEkgZ3Vlc3Mgd2Ugc2hvdWxkIGJlIGFibGUgdG8gcmVwcm9kdWNlIHRoaXMgZXJyb3Igd2l0
aCBhbnkgYm9hcmQgdXNpbmcKPiB0aGUgbXhjIE5BTkQgZHJpdmVyIHdpdGggaGFyZHdhcmUgY29y
cmVjdGlvbiAobm93IGFsc28gY2FsbGVkICJvbgo+IGhvc3QiKS4gRG8geW91IGhhdmUgc3VjaCBh
IGJvYXJkIGF2YWlsYWJsZSB0byBhdCBsZWFzdCB2ZXJpZnkgdGhhdCB0aGUKPiBiZWdpbm5pbmcg
b2YgbXkgbG9naWMgaXMgcmlnaHQ/CgpIaSBNaXF1ZWwsCgpJIGRlYnVnZ2VkIG9uIG9uZSBMUzEw
NDNBIHBsYXRmb3JtIGFuZCBmb3VuZCBpbiByYXduYW5kX2R0X2luaXQoKSwgdGhlCmNoaXAtPmVj
Yy5zdHJlbmd0aCB3YXMgc2V0IHRvIG5hbmQtPmVjYy51c2VyX2NvbmYuc3RyZW5ndGgsIHdoaWNo
IG1heQpub3QgaGF2ZSBiZWVuIHRvdWNoZWQgYmVmb3JlLiBTYW1lIGFzIGNoaXAtPmVjYy5zaXpl
LgoKPgo+IFRoYW5rcywKPiBNaXF1w6hsCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8KCgoKLS0gClNpbmNlcmVseSwKCkhhbiBYVQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
