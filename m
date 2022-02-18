Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B7BC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 12:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7ZgyIiuqLPhhswz6P2HTecmwCvKDuaG9RolXuaY4mg=; b=wMg0RYepA1NM3l
	cRY/AJB+LxRFqwd54C6+CFfu4qUhyai36nfH+U6Xpy4S4d4+83j27Qo0a2o3BL/f8tAQxKnfCuQ/D
	FWNvC2Yya2eNh4vR9kw/dI5844CYnHG+I57KKukaD/5+T6z602NCVPCzE/GBy9qgGosqrmMUrK0x6
	VjolXaIxrQtnSNPJk1SlCUX1ggh7lejMy8sBM7H8fk4JtYYGNicBXHxETqRFCW6CBlBgjkKmGoxlg
	Gum1g4gli9alPiGjMT+sU2XY7dt30LtW30t2e1nendxiF5Prr+qZ/6+2pCkwE8QDIfnhJDnsVSmwC
	OsefBUlPu0yjKyzZSX5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL2hb-00EJDO-VU; Fri, 18 Feb 2022 12:49:36 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL1pd-00E67r-0D
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 11:53:50 +0000
Received: by mail-ej1-x633.google.com with SMTP id qk11so14497836ejb.2
 for <linux-mtd@lists.infradead.org>; Fri, 18 Feb 2022 03:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PAFU6gayxYycFAjsYYdsBH4fb14B+9k5K1rC1fr5ibU=;
 b=y1ApFGs2wBKqI6YmqGjiKRoomFaWQn9GJ+esuDqvq1CBp+bPpXaaNWJxFaT95S6sQO
 nbB6NlB9oE/XYNfZ5GZGqFa1ulYJLqfN/+qUK4VZFEi8JQSmztrhJ5+iMlIvi6yW+JPj
 4fPTTTqHCCrzKTkp/QUn9I5U+wD1oSPiY08DcdkkFp5QNxU2ATqMGhNflB2g8QK1Mpi3
 zrM+ocM6Hvet65ejBI8tO8ffQ5j6KWZPkiPfFtTCywS5Kup/tbAlm2BHDqnGEZHS6HwZ
 DORXagahzNdE99rrzWxALDbyqxmTh/UcgIXyD24Lg2PYuGbeYTy037/J+Oq5S0w06VJK
 mj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PAFU6gayxYycFAjsYYdsBH4fb14B+9k5K1rC1fr5ibU=;
 b=LDqXyspuSvQHsuMw948uIA3x+7ZTCTo7Ve3XBTGDUdZH6ZTALwo4eWUGSVYoRjogRR
 GqsbQ5RgXo+dSJhDrCIv0+DyTxftL1YC23FeN07PWvEw7Rkq72m25VX8a5mlAY4dG1kT
 V9tIx1+bcDQlSNijl2al+jk7jiOJrolM0ORf0rNFNIRZn57SbKsd9vCGkdUWmpZqjxbD
 BetHa0RV1lY//H43eW/qxWkd5ho30WT1wwQbqmFZvrjft4ZEkgF2YXiQe+E2xJoTx03b
 0H0c1M+mLWsGFpeiTqUfgdVoSAQhDb8X/95XsuPY0DySGHhpTp2kG153ceEN6LUUTQPu
 8ptg==
X-Gm-Message-State: AOAM532YlSbFP12te7eBIXnXtAi1fb78qJIwRkRRR1ZZWbTU0BO4UK1Z
 SMRNpImIQOWkbdq+JxywFCe3Tw==
X-Google-Smtp-Source: ABdhPJzz58mhC9gqhYwFYu4oy6FCTDMQGTy6UF4AuD1gK4uU6HBfQlrpYujnCiE43A0uNYbiJHFm/A==
X-Received: by 2002:a17:906:5a6e:b0:6d0:afaa:6ce9 with SMTP id
 my46-20020a1709065a6e00b006d0afaa6ce9mr1219253ejc.72.1645185226330; 
 Fri, 18 Feb 2022 03:53:46 -0800 (PST)
Received: from ?IPV6:2a02:768:2307:40d6::f9e? ([2a02:768:2307:40d6::f9e])
 by smtp.gmail.com with ESMTPSA id m7sm2203683ejq.10.2022.02.18.03.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 03:53:45 -0800 (PST)
Message-ID: <41049c30-aaf1-30e5-2d11-14df0b468411@monstr.eu>
Date: Fri, 18 Feb 2022 12:53:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v6 0/3] Stacked/parallel memories bindings
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
References: <20220126112608.955728-1-miquel.raynal@bootlin.com>
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20220126112608.955728-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_035349_132782_946F8164 
X-CRM114-Status: GOOD (  22.21  )
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

SGkgTWFyawoKT24gMS8yNi8yMiAxMjoyNiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbyBS
b2IsIE1hcmssIFR1ZG9yICYgUHJhdHl1c2gsCj4gCj4gSGVyZSBpcyBhIHNpeHRoIHZlcnNpb25z
IGZvciB0aGVzZSBiaW5kaW5ncywgd2hpY2ggYXBwbGllcyBvbiB0b3Agb2YKPiB0aGUgdjUuMTct
cmMxIG5vdyB0aGF0IFByYXR5dXNoJ3Mgd29yayBhcyBiZWVuIG1lcmdlZC4KPiAoaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjExMTA5MTgxOTExLjIyNTEtMS1wLnlhZGF2QHRpLmNvbS8p
Cj4gCj4gQ2hlZXJzLAo+IE1pcXXDqGwKPiAKPiBDaGFuZ2VzIGluIHY2Ogo+ICogQWRkZWQgUHJh
dHl1c2gncyBhY2tzLgo+ICogVGhlIHRvb2xpbmcgbm93IHZhbGlkYXRlcyB0aGUgYmluZGluZyAo
dXBkYXRpbmcgZHQtc2NoZW1hIGlzCj4gICAgbmVjZXNhcnkpLgo+ICogVXBkYXRlZCB0aGUgbWF4
SXRlbXMgZmllbGQgdG8gNCBhcyBhICJiaWcgZW5vdWdoIHZhbHVlIiBhcyBkaXNjdXNzZWQuCj4g
Cj4gQ2hhbmdlcyBpbiB2NToKPiAqIFVzZWQgdGhlIHVpbnQ2NC1hcnJheSBpbnN0ZWFkIG9mIHRo
ZSBtYXRyaXggdHlwZS4KPiAqIFVwZGF0ZWQgdGhlIGV4YW1wbGUgYXMgd2VsbCB0byB1c2UgYSBz
aW5nbGUgIi9iaXRzLyA2NCIgY2FzdCBiZWNhdXNlCj4gICAgZG9pbmcgaXQgdHdpY2UsIGRlc3Bp
dGUgYmVpbmcgc3VwcG9ydGVkIGJ5IHRoZSBsYW5ndWFnZSBpdHNlbGYsIGlzIG5vdAo+ICAgIHll
dCBzb21ldGhpbmcgdGhhdCB3ZSBjYW4gdXNlIGZvciBkZXNjcmliaW5nIGJpbmRpbmdzLgo+IAo+
IENoYW5nZXMgaW4gdjQ6Cj4gKiBDaGFuZ2VkIHRoZSB0eXBlIG9mIHByb3BlcnRpZXMgdG8gdWlu
dDY0LWFycmF5cyBpbiBvcmRlciB0byBiZSBhYmxlIHRvCj4gICAgZGVzY3JpYmUgdGhlIHNpemUg
b2YgZWFjaCBlbGVtZW50IGluIHRoZSBhcnJheS4KPiAqIFVwZGF0ZWQgdGhlIGV4YW1wbGUgYWNj
b3JkaW5nbHkuCj4gCj4gQ2hhbmdlcyBpbiB2MzoKPiAqIFJlYmFzZWQgb24gdG9wIG9mIFByYXR5
dXNoJ3MgcmVjZW50IGNoYW5nZXMuCj4gKiBEcm9wcGVkIHRoZSBjb21taXQgYWxsb3dpbmcgdG8g
cHJvdmlkZSB0d28gcmVnIGVudHJpZXMgb24gdGhlIG5vZGUKPiAgICBuYW1lLgo+ICogRHJvcHBl
ZCB0aGUgY29tbWl0IHJlZmVyZW5jaW5nIHNwaS1jb250cm9sbGVyLnlhbWwgZnJvbQo+ICAgIGpl
ZGVjLHNwaS1ub3IueWFtbCwgbm93IHJlcGxhY2VkIGJ5IHNwaS1wZXJpcGhlcmFsLXByb3BzLnlh
bWwgYW5kCj4gICAgYWxyZWFkeSBkb25lIGluIFByYXR5dXNoJ3Mgc2VyaWVzLgo+ICogQWRkZWQg
Um9iJ3MgQWNrLgo+ICogRW5oYW5jZWQgYSBjb21taXQgbWVzc2FnZS4KPiAqIE1vdmVkIHRoZSBu
ZXcgcHJvcGVydGllcyB0byB0aGUgbmV3IFNQSSBwZXJpcGhlcmFsIGJpbmRpbmcgZmlsZS4KPiAK
PiBDaGFuZ2VzIGluIHYyOgo+ICogRHJvcHBlZCB0aGUgZHRjIGNoYW5nZXMgZm9yIG5vdy4KPiAq
IE1vdmVkIHRoZSBwcm9wZXJ0aWVzIGluIHRoZSBkZXZpY2UncyBub2Rlcywgbm90IHRoZSBjb250
cm9sbGVyJ3MuCj4gKiBEcm9wcGVkIHRoZSB1c2VsZXNzICNhZGRyZXNzLWNlbGxzIGNoYW5nZS4K
PiAqIEFkZGVkIGEgbWlzc2luZyAibWluSXRlbXMiLgo+ICogTW92ZWQgdGhlIG5ldyBwcm9wZXJ0
aWVzIGluIHRoZSBzcGktY29udHJvbGxlci55YW1sIGZpbGUuCj4gKiBBZGRlZCBhbiBleGFtcGxl
IHVzaW5nIHR3byBzdGFja2VkIG1lbW9yaWVzIGluIHRoZQo+ICAgIHNwaS1jb250cm9sbGVyLnlh
bWwgZmlsZS4KPiAqIFJlbmFtZWQgdGhlIHByb3BlcnRpZXMgdG8gZHJvcCB0aGUgWGlsaW54IHBy
ZWZpeC4KPiAqIEFkZGVkIGEgcGF0Y2ggdG8gZml4IHRoZSBzcGktbm9yIGplZGVjIHlhbWwgZmls
ZS4KPiAKPiBNaXF1ZWwgUmF5bmFsICgzKToKPiAgICBkdC1iaW5kaW5nczogbXRkOiBzcGktbm9y
OiBBbGxvdyB0d28gQ1MgcGVyIGRldmljZQo+ICAgIHNwaTogZHQtYmluZGluZ3M6IERlc2NyaWJl
IHN0YWNrZWQvcGFyYWxsZWwgbWVtb3JpZXMgbW9kZXMKPiAgICBzcGk6IGR0LWJpbmRpbmdzOiBB
ZGQgYW4gZXhhbXBsZSB3aXRoIHR3byBzdGFja2VkIGZsYXNoZXMKPiAKPiAgIC4uLi9iaW5kaW5n
cy9tdGQvamVkZWMsc3BpLW5vci55YW1sICAgICAgICAgICB8ICAzICsrLQo+ICAgLi4uL2JpbmRp
bmdzL3NwaS9zcGktY29udHJvbGxlci55YW1sICAgICAgICAgIHwgIDcgKysrKysrCj4gICAuLi4v
YmluZGluZ3Mvc3BpL3NwaS1wZXJpcGhlcmFsLXByb3BzLnlhbWwgICAgfCAyNSArKysrKysrKysr
KysrKysrKysrCj4gICAzIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPiAKCkNhbiB5b3UgcGxlYXNlIHBpY2sgdXAgdGhpcyBzZXJpZXM/CgpUaGFua3MsCk1p
Y2hhbAoKLS0gCk1pY2hhbCBTaW1laywgSW5nLiAoTS5FbmcpLCBPcGVuUEdQIC0+IEtleUlEOiBG
RTNEMUY5MQp3OiB3d3cubW9uc3RyLmV1IHA6ICs0Mi0wLTcyMTg0Mjg1NApNYWludGFpbmVyIG9m
IExpbnV4IGtlcm5lbCAtIFhpbGlueCBNaWNyb2JsYXplCk1haW50YWluZXIgb2YgTGludXgga2Vy
bmVsIC0gWGlsaW54IFp5bnEgQVJNIGFuZCBaeW5xTVAgQVJNNjQgU29DcwpVLUJvb3QgY3VzdG9k
aWFuIC0gWGlsaW54IE1pY3JvYmxhemUvWnlucS9aeW5xTVAvVmVyc2FsIFNvQ3MKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
