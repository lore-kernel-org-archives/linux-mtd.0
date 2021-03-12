Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E56C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 10:21:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 141D364FE2
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 10:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 141D364FE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wdHHTFPLUTUIK4CxDBnhdndbGQM8vBU4nHbMjwILqFE=; b=lvfa7Strgj9WPEadR8RNSBK9B
	/oh7BN4YUnYKdbeTycxV6Scj8HPuR63TGPe3t65eO8g7CaUP/9HcBv8XRyx14B/1GCIKJGoDz76H9
	9qebqxOJxc2V2lBV8bTpHTusLFmFOCeG/vXT6gqx3FmWZOTLvR9IqD90iwf0CYmQJncOIXnSY1quw
	C0T8RKj0Ztn6SBSAMehGgHxZW3a1lZERY/rE/8wd6jxs+owk+f7AKeRfVnrGgK/JEJ70W34FqDAyp
	VtC/36ze46Rq3dbRVA4KWjwiNe35FetLPDKc2Bi5CE5jf4oXKheM8SqORfZXPJp/ICYjSX/bNQZWO
	LHo+a982Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKeuV-00B9Pg-5Z; Fri, 12 Mar 2021 10:20:47 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKeu3-00B9Ky-La; Fri, 12 Mar 2021 10:20:24 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4848322235;
 Fri, 12 Mar 2021 11:20:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615544415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7AwJyDsly/A7V+5RW+umEy+/kfZBbndM17q5qch0pqs=;
 b=EC0cBBXxN04ASMeKveVSaUo+vYHbtl7LcZarVqKmw9+bat/GbF2Epq/Y9JOx5BwD1X4Tbv
 7ViqqBwt3I0tPDVP6DT7D1wrmEoYlT/xT+EiwfRmMmjKFeaympr/GTTRbaHbDfGLxBPU6l
 WBe87kMZ92vdrhYhqQJIfhbqXkY3n5U=
MIME-Version: 1.0
Date: Fri, 12 Mar 2021 11:20:15 +0100
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor.Ambarus@microchip.com, nm@ti.com, kristo@kernel.org,
 robh+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, lokeshvutla@ti.com
Subject: Re: [RFC PATCH 0/6] spi: Add OSPI PHY calibration support for
 spi-cadence-quadspi
In-Reply-To: <20210312101036.jfz2733ssv4nhfey@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <9c551f56-4c00-b41a-f051-8b7e197fbcdc@microchip.com>
 <20210312101036.jfz2733ssv4nhfey@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <676386736df5e5b22e34b0b5af91c894@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_102019_877002_611DE0A5 
X-CRM114-Status: UNSURE (   7.76  )
X-CRM114-Notice: Please train this message.
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

QW0gMjAyMS0wMy0xMiAxMToxMCwgc2NocmllYiBQcmF0eXVzaCBZYWRhdjoKPiBUaGVyZSBpcyB1
c3VhbGx5IGEgZGVsYXkgZnJvbSB3aGVuIHRoZSBmbGFzaCBkcml2ZXMgdGhlIGRhdGEgbGluZSAo
SU9XLAo+IHB1dHMgYSBkYXRhIGJpdCBvbiBpdCkgYW5kIHdoZW4gdGhlIHNpZ25hbCByZWFjaGVz
IHRoZSBjb250cm9sbGVyLiBUaGlzCj4gZGVsYXkgY2FuIHZhcnkgYnkgdGhlIGZsYXNoLCBib2Fy
ZCwgc2lsaWNvbiBjaGFyYWN0ZXJpc3RpY3MsCj4gdGVtcGVyYXR1cmUsIGV0Yy4KClRlbXBlcmF0
dXJlIG1pZ2h0IGNoYW5nZSBvdmVyIHRpbWUsIGJ1dCB0aGUgY2FsaWJyYXRpb24gaXMgb25seSBk
b25lCm9uY2UuIEkgZG9uJ3Qga25vdyBob3cgbXVjaCBpbmZsdWVuY2UgdGhlIHRlbXBlcmF0dXJl
IGFjdHVhbGx5IGhhcywgYnV0Cm91ciBib2FyZHMgYXJlIHVzdWFsbHkgb3BlcmF0aW5nIGZyb20g
LTQwwrBDIHRvICs4NcKwQy4gU28gdGhlcmUgbWlnaHQgYmUKYSBwb3NzaWJsZSB0ZW1wZXJhdHVy
ZSBkaWZmZXJlbmNlIG9mIDEyNUsgYmV0d2VlbiBhY3R1YWwgY2FsaWJyYXRpb24gYW5kCndoZW4g
dGhlIGZsYXNoIGlzIGFjY2Vzc2VkLgoKLW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
