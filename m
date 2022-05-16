Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252B4C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 16 May 2022 18:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqN3Hcw1TRQPkCTlbvpEpfgZa4iO687OyT1jGLv87/Y=; b=fZOVK2XFjIjW/p
	RCjzE+6cfRTvWkeQCHH1T5WLt02J/V4JJPPwNWcxE6R1uu0t9y/AWUMoaWzVFWgpDhovSY8Khd7hH
	shOU8yGfjgXd+9Hj8a4B8hWFvuWH3SniisPjY/zHb5ElSuXV0bu0t5GioYEqiHYJ2mdslmcn/MBpC
	XeH5aKw9tF5dGZXbQG1sVx3nZiMjmdhOqIzuUM2ia7YR1euDExjFhKnNwfltIlyrjjpG99hwOqprs
	phens2Ua/o6291gHkFmCUfK55uveVqHX89A9A7YKIhnvYgRkBEcAXD4+0GJ3gn/e9j5zo3cgVi8Sz
	GRNJFUz9AkH+h/iGF9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqfd4-009c0Y-PN; Mon, 16 May 2022 18:39:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqfcu-009byX-00; Mon, 16 May 2022 18:39:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B1E961467;
 Mon, 16 May 2022 18:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41F0C34100;
 Mon, 16 May 2022 18:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652726367;
 bh=uB3ceHjdyIYIrq6O7Ou3iUbDoNJSf6Vwwjiv6bTT8sk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=aethkcieAmzy7b8cGKRBdAPWSFwCkpCHnoew6BVpYkR+d2cK4K/pBjL1t5aVjwjsL
 IKpSpsuuA4p7ZkjTiArGHGzCf71Dzd/T8Q5T3tVT1bDrJO5E0ISnK9Ju7tDX45aqn9
 kOaTmja9a8ZIy8icvgXmoAeRwygYc23PkmOJ/mfuu1TK+ovdHbvDVf/+kGhLlOI4oc
 Mtssfd4RwKymKzutwv7n/tF6lUnOABU1zSBy+Z3GOfUU27g/NeHFoZ8EApXL0jvwP/
 5WeV1TkuII719KFikxqcfPVelTHUqHpL05ggq0iMFgbWtBbDoMimfQnteSigwpQ55w
 zJkZhLPRfmpLg==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, clg@kaod.org
Cc: andrew@aj.id.au, robh+dt@kernel.org, devicetree@vger.kernel.org,
 p.yadav@ti.com, linux-arm-kernel@lists.infradead.org, richard@nod.at,
 joel@jms.id.au, tudor.ambarus@microchip.com, miquel.raynal@bootlin.com,
 chin-ting_kuo@aspeedtech.com, linux-aspeed@lists.ozlabs.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
In-Reply-To: <20220509175616.1089346-1-clg@kaod.org>
References: <20220509175616.1089346-1-clg@kaod.org>
Subject: Re: (subset) [PATCH v7 00/11] spi: spi-mem: Convert Aspeed SMC driver
 to spi-mem
Message-Id: <165272636363.750911.14933122170662994904.b4-ty@kernel.org>
Date: Mon, 16 May 2022 19:39:23 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_113928_150280_CF1D3A6A 
X-CRM114-Status: GOOD (  13.84  )
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

T24gTW9uLCA5IE1heSAyMDIyIDE5OjU2OjA1ICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBUaGlzIHNlcmllcyBhZGRzIGEgbmV3IFNQSSBkcml2ZXIgdXNpbmcgdGhlIHNwaS1tZW0g
aW50ZXJmYWNlIGZvciB0aGUKPiBBc3BlZWQgc3RhdGljIG1lbW9yeSBjb250cm9sbGVycyBvZiB0
aGUgQVNUMjYwMCwgQVNUMjUwMCBhbmQgQVNUMjQwMAo+IFNvQ3MuCj4gCj4gICogQVNUMjYwMCBG
aXJtd2FyZSBTUEkgTWVtb3J5IENvbnRyb2xsZXIgKEZNQykKPiAgKiBBU1QyNjAwIFNQSSBGbGFz
aCBDb250cm9sbGVyIChTUEkxIGFuZCBTUEkyKQo+ICAqIEFTVDI1MDAgRmlybXdhcmUgU1BJIE1l
bW9yeSBDb250cm9sbGVyIChGTUMpCj4gICogQVNUMjUwMCBTUEkgRmxhc2ggQ29udHJvbGxlciAo
U1BJMSBhbmQgU1BJMikKPiAgKiBBU1QyNDAwIE5ldyBTdGF0aWMgTWVtb3J5IENvbnRyb2xsZXIg
KGFsc28gcmVmZXJyZWQgYXMgRk1DKQo+ICAqIEFTVDI0MDAgU1BJIEZsYXNoIENvbnRyb2xsZXIg
KFNQSSkKPiAKPiBbLi4uXQoKQXBwbGllZCB0bwoKICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnJvb25pZS9zcGkuZ2l0IGZvci1uZXh0CgpUaGFua3Mh
CgpbMDIvMTFdIGR0LWJpbmRpbmdzOiBzcGk6IENvbnZlcnQgdGhlIEFzcGVlZCBTTUMgY29udHJv
bGxlcnMgZGV2aWNlIHRyZWUgYmluZGluZwogICAgICAgIGNvbW1pdDogY2U5ODU4ZWE0OTlkYTAy
NTY4NGE3YTVmMTk4MjNjMmMzZjE0YmRjZQpbMDMvMTFdIHNwaTogc3BpLW1lbTogQ29udmVydCBB
c3BlZWQgU01DIGRyaXZlciB0byBzcGktbWVtCiAgICAgICAgY29tbWl0OiA5YzYzYjg0NmU2ZGY0
M2U1YjNkMzEyNjNmN2RiNTQ1ZjMyZGVlZGEzClswNC8xMV0gc3BpOiBhc3BlZWQ6IEFkZCBzdXBw
b3J0IGZvciBkaXJlY3QgbWFwcGluZwogICAgICAgIGNvbW1pdDogOWRhMDZkN2JkZWM3ZGFkODAx
OGMyM2IxODBlNDEwZWYyZTdhNDM2NwpbMDUvMTFdIHNwaTogYXNwZWVkOiBBZGp1c3QgZGlyZWN0
IG1hcHBpbmcgdG8gZGV2aWNlIHNpemUKICAgICAgICBjb21taXQ6IGJiMDg0Zjk0ZTFiY2E0YTVj
NGY2ODlkN2FhOWI0MTAyMjBjMWVkNzEKWzA2LzExXSBzcGk6IGFzcGVlZDogV29ya2Fyb3VuZCBB
U1QyNTAwIGxpbWl0YXRpb25zCiAgICAgICAgY29tbWl0OiA1Nzg1ZWVkZWU0MmMzNGNmZWM0OTYx
OTlhODBmYThlYzlkZGNmN2ZlClswNy8xMV0gc3BpOiBhc3BlZWQ6IEFkZCBzdXBwb3J0IGZvciB0
aGUgQVNUMjQwMCBTUEkgY29udHJvbGxlcgogICAgICAgIGNvbW1pdDogNTM1MjZhYjI3ZDljMjU2
NTA0ZjI2NzcxM2FlYTYwZGI3YWYxOGZiMApbMDgvMTFdIHNwaTogYXNwZWVkOiBDYWxpYnJhdGUg
cmVhZCB0aW1pbmdzCiAgICAgICAgY29tbWl0OiBlZWFlYzFlYTA1YzBlMGYwOGUwNGM2ODQ0ZjIw
Y2MyNGEyZmNjMGY0ClsxMS8xMV0gbXRkOiBzcGktbm9yOiBhc3BlZWQ6IHNldCB0aGUgZGVjb2Rp
bmcgc2l6ZSB0byBhdCBsZWFzdCAyTUIgZm9yIEFTVDI2MDAKICAgICAgICBjb21taXQ6IDczYWU5
N2UzY2FiYjU4MDYzOWYwMmYxMmExOTIzMjRhNTNjNGJlYmIKCkFsbCBiZWluZyB3ZWxsIHRoaXMg
bWVhbnMgdGhhdCBpdCB3aWxsIGJlIGludGVncmF0ZWQgaW50byB0aGUgbGludXgtbmV4dAp0cmVl
ICh1c3VhbGx5IHNvbWV0aW1lIGluIHRoZSBuZXh0IDI0IGhvdXJzKSBhbmQgc2VudCB0byBMaW51
cyBkdXJpbmcKdGhlIG5leHQgbWVyZ2Ugd2luZG93IChvciBzb29uZXIgaWYgaXQgaXMgYSBidWcg
Zml4KSwgaG93ZXZlciBpZgpwcm9ibGVtcyBhcmUgZGlzY292ZXJlZCB0aGVuIHRoZSBwYXRjaCBt
YXkgYmUgZHJvcHBlZCBvciByZXZlcnRlZC4KCllvdSBtYXkgZ2V0IGZ1cnRoZXIgZS1tYWlscyBy
ZXN1bHRpbmcgZnJvbSBhdXRvbWF0ZWQgb3IgbWFudWFsIHRlc3RpbmcKYW5kIHJldmlldyBvZiB0
aGUgdHJlZSwgcGxlYXNlIGVuZ2FnZSB3aXRoIHBlb3BsZSByZXBvcnRpbmcgcHJvYmxlbXMgYW5k
CnNlbmQgZm9sbG93dXAgcGF0Y2hlcyBhZGRyZXNzaW5nIGFueSBpc3N1ZXMgdGhhdCBhcmUgcmVw
b3J0ZWQgaWYgbmVlZGVkLgoKSWYgYW55IHVwZGF0ZXMgYXJlIHJlcXVpcmVkIG9yIHlvdSBhcmUg
c3VibWl0dGluZyBmdXJ0aGVyIGNoYW5nZXMgdGhleQpzaG91bGQgYmUgc2VudCBhcyBpbmNyZW1l
bnRhbCB1cGRhdGVzIGFnYWluc3QgY3VycmVudCBnaXQsIGV4aXN0aW5nCnBhdGNoZXMgd2lsbCBu
b3QgYmUgcmVwbGFjZWQuCgpQbGVhc2UgYWRkIGFueSByZWxldmFudCBsaXN0cyBhbmQgbWFpbnRh
aW5lcnMgdG8gdGhlIENDcyB3aGVuIHJlcGx5aW5nCnRvIHRoaXMgbWFpbC4KClRoYW5rcywKTWFy
awoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
