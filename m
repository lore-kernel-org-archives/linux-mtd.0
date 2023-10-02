Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E0FE7849A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Oct 2023 14:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61beShAK/fVcvReIWXAs8vQjqTOJug3ULqo5G1X99Ik=; b=evNIJfX1DWEoQl
	P+uXKbJXgWXFj1xu/6WizMfZlmvQehf7Jv26li87cE4HVLvYrG2YQlTfU8VY3BzjTY6sPD5pml5T3
	Z+sYDd5miLb+gSdZvBOjfd1Cd+xKtlquYlHlYxnUIwFF8UqYErg4xGkOWuvMgilB3VgU22JveBqcV
	Xr+wodZc9TA/pWRAdnx0JiVdvtIeVDKkuAjnMt3lUAbcNf+YyWGA1xrWBRYHwHp+Fz4qCMpfOjqqV
	djM4WAG7Cs4A9SyBAql3sgZwFgq/Lyno96lLpVoouwKrujsP/MMuNVu2GS+VwCKTUjcPOOAiHD5er
	V1SunVR1NmG9AcKIx9Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJXT-00CpyB-1s;
	Mon, 02 Oct 2023 14:04:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJXR-00CpxJ-1m
	for linux-mtd@lists.infradead.org;
	Mon, 02 Oct 2023 14:04:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7DD48CE1034;
	Mon,  2 Oct 2023 14:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6914EC433CA;
	Mon,  2 Oct 2023 14:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696255482;
	bh=LIDCsNC0XaBYNVpWKokDJhLXTwTQcHbH42cgxyB26VY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rz/7ZbpQoN0mLuLNqLCOU/2N8auM9xb2OthgI61ALF4xwxTiGjC367HeDdbLQk96U
	 8JYWXF/qMlTBQOc+ESuO1lIPybv4SNn+L7IV09JIw/JIDfIHS4vWpgUTWgtroTYBYp
	 JU+tJt4ne8CAJoQbZsgJF0/V7fFDA14B3VFi76n1aXS4+vDscg3Lwdb14zwL5lQZBZ
	 jw+ElpcILSVazG+JXzC2pL2TY7BNEChi5RhEznwGEFK6jAradej4mKr1YIWl9g7c/B
	 fcOFisShI2KOfdlHBiUkOtsf8ZoIuOqiv755N1Hb0ortWOX3dAyNE5uJgsmdMPD2Lq
	 Kz3au9nw7/59A==
Date: Mon, 2 Oct 2023 15:04:37 +0100
From: Lee Jones <lee@kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, Yu Hao <yhao016@ucr.edu>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: BUG: divide error in ubi_attach_mtd_dev
Message-ID: <20231002140437.GA8453@google.com>
References: <CA+UBctD_w=75wChmePZHp7KsBSNPWYGDBtzHPRPPtaFoqhGvXA@mail.gmail.com>
 <977347543.226888.1682011999468.JavaMail.zimbra@nod.at>
 <CA+UBctA4fSbSdooQ9q9fwNuaHb_PnkfFuqJ7Q5vii-3-uCiUjw@mail.gmail.com>
 <412779912.228444.1682023015809.JavaMail.zimbra@nod.at>
 <ed510d18-47f1-7f46-03dd-84e043cab6d9@huawei.com>
 <1366603418.245114.1682236940160.JavaMail.zimbra@nod.at>
 <951e4cf7-a0ea-b3ec-931d-e6a394ddc2ab@huawei.com>
 <20231002101117.GA175828@google.com>
 <43988304.25483.1696242486225.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43988304.25483.1696242486225.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_070445_760517_5C018FF8 
X-CRM114-Status: GOOD (  16.98  )
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

T24gTW9uLCAwMiBPY3QgMjAyMywgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgoKPiAtLS0tLSBV
cnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gPiBWb246ICJMZWUgSm9uZXMiIDxsZWVAa2VybmVs
Lm9yZz4KPiA+IEZvciBiZXR0ZXIgb3Igd29yc2UsIHNvbWVvbmUgaGFzIGFwcGxpZWQgdG8gaGF2
ZSB0aGlzIHJlcG9ydCBhc3NvY2lhdGVkCj4gPiB3aXRoIGEgQ1ZFIHdoaWNoIG1lYW5zIGEgYnVu
Y2ggb2YgY29tcGFuaWVzIGFuZCBpbmRpdmlkdWFscyBhcmUgZ29pbmcgdG8KPiA+IGJlIHRyYWNr
aW5nIGl0Lgo+ID4gCj4gPiBXaGF0IGlzIHRoZSBjdXJyZW50IHN0YXR1cyBwbGVhc2U/Cj4gCj4g
SSB3YXMgYWJvdXQgdG8gYW5zd2VyIHRoYXQgdGhlIHBhdGNoIGlzIHVwc3RyZWFtLCBidXQgaXQn
cyBvbmx5IGluIGxpbnV4LW5leHQuIDotUwo+IEFmdGVyIGx1bmNoIEknbGwgaW1tZWRpYXRlbHkg
c2VuZCBhIFBSLiBJIG1lc3NlZCB1cCBkdWUgdG8gdG9vIG11Y2ggdHJhdmVsaW5nCj4gdGhlIGxh
c3QgbW9udGhzLgo+ICAKPiA+IElzIHRoaXMgZGVlbWVkIHRvIGJlIGEgcmVhbCBpc3N1ZT8KPiAK
PiBJIGRvbid0IHRoaW5rIHNvLiBPbmx5IHRoZSByZWFsIHJvb3QgY2FuIGluc3RhbGwgbmV3IE1U
RCBkZXZpY2VzIGFuZCBydW4gVUJJIGF0dGFjaC4KPiAKPiA+IERpZCB0aGUgcmVwb3J0IGN1bG1p
bmF0ZSBpbiBhIHBvc3RlZCBwYXRjaD8KPiAKPiBZZXMuIEFzIEkgc2FpZCBhIHBhdGNoIGlzIGlu
IG5leHQuCgpFeGNlbGxlbnQsIHRoYW5rcy4KCkknZCBsaWtlIHRvIHRyYWNrIGl0LiAgV2hhdCdz
IHRoZSBzdWJqZWN0IHBsZWFzZT8KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
