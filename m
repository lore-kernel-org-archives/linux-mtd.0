Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8E4C43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 08:52:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D44DF20855
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 08:52:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pLjSB7ep"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D44DF20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKRd1E6svtXwcZjNB8pE6MkipLsBwsS1UuQ9gLyNR1E=; b=pLjSB7epvMsUO4
	P0mcxZaHqEadgQ/mZmbnRuMCsA1SksEp63wm4dVCgHqUMxf78pYElaX7Pi5FfDx8VzXKUbxxWsXWB
	rzR/j5MlBKVx5EIO7LucNVIfosslo6JkczguMzIly/aX4dQdbmfedPkAlwmT+IUEeefhqxvJH7KQE
	IppEdtflIjMJtWwuAR+sBCMZfA/YBWbypEQZMq3mBJ2oHf6uIOQvLuYdl9rAE9x6EHB8qFid2gdpl
	TMj3A6OCwFubZwpKsb3xDtDmXwJ4RZJkiKjn4w62musg3w+EUGgUOKVJAO6Dz7lnx2Q7AuGpe1d8Y
	dHtiNGlk8UGJNHDko1Ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkPtL-0001xy-2Q; Fri, 18 Jan 2019 08:52:43 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkPtC-0001xM-3T
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 08:52:35 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 28405207AC; Fri, 18 Jan 2019 09:52:31 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-37-87.w90-88.abo.wanadoo.fr
 [90.88.156.87])
 by mail.bootlin.com (Postfix) with ESMTPSA id CE625206DC;
 Fri, 18 Jan 2019 09:52:30 +0100 (CET)
Date: Fri, 18 Jan 2019 09:52:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mtd: rawnand: denali: get ->setup_data_interface()
 working again
Message-ID: <20190118095230.5f097e9e@xps13>
In-Reply-To: <1547789438-11899-1-git-send-email-yamada.masahiro@socionext.com>
References: <1547789438-11899-1-git-send-email-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_005234_283162_2EF2C1CF 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 "linux-stable # v4 . 20" <stable@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBGcmksIDE4IEphbgoyMDE5IDE0OjMwOjM4ICswOTAwOgoKPiBDb21taXQg
N2EwOGRiYWVkZDM2ICgibXRkOiByYXduYW5kOiBNb3ZlIC0+c2V0dXBfZGF0YV9pbnRlcmZhY2Uo
KSB0bwo+IG5hbmRfY29udHJvbGxlcl9vcHMiKSBtaXNzZWQgdG8gaW52ZXJ0IHRoZSBpZi1jb25k
aXRvbmFsIGZvciBkZW5hbGkuCj4gU2luY2UgdGhlbiwgdGhlIERlbmFsaSBOQU5EIGRyaXZlciBj
YW5ubm90IGludm9rZSBzZXR1cF9kYXRhX2ludGVyZmFjZS4KPiAKPiBGaXhlczogN2EwOGRiYWVk
ZDM2ICgibXRkOiByYXduYW5kOiBNb3ZlIC0+c2V0dXBfZGF0YV9pbnRlcmZhY2UoKSB0byBuYW5k
X2NvbnRyb2xsZXJfb3BzIikKPiBDYzogbGludXgtc3RhYmxlIDxzdGFibGVAdmdlci5rZXJuZWwu
b3JnPiAjIHY0LjIwCj4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFz
YWhpcm9Ac29jaW9uZXh0LmNvbT4KPiAtLS0KPiAKCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
