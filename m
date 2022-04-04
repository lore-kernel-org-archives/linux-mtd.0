Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4137C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 08:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IevoVfWBcdydh5U7xrI6jaw6KD1NN6Yq132+lMKp6fw=; b=XuW0g1+V48ctfk
	Csc+bdjspesPNu4N9kGEEINKC9M5rx4RIuLLyucQhg098TEBmRj4AEPyPv4NUu0cP8KwwnwBjM8PH
	zwSIBkbDS0vNnMZ4d3bdTsuEoTL/hvDUgBavZJBPTFxelNpBf5s3irEuSn4Hb8UOPzcmJ0f36IqcT
	dYdU6pAzXZDO7qr22e6fKKn89WtpdJebx8AovWrgPFg7u75hqg5/ZHIE9EeveMmNSpxl4f+6VzrVD
	+9Q5tqAUwCB51tmadRh8ZPC+pp1z1e5IkIKvB8XJVQ7Sq1ywu1k0LCBYv36ny6msFLNodu0STODCf
	I8h7fNyzvcDf7CaDSQsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbIMf-00Duc8-VC; Mon, 04 Apr 2022 08:47:10 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbIMc-00Duag-O2
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 08:47:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B742DE0008;
 Mon,  4 Apr 2022 08:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649062024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p0OPYJTGf+Dm5K2y8xd2O8sDEyOgtNhDfv6cC7unOvs=;
 b=prbj1OGvO94djS0icwz28PMFioDs07B4VJDBXeFqPWMn2JJdRaVIeH5WPvzl6pmbb564qW
 wdq7CB4EHTkv36uz6A0ZrhELIjzgG9rfrtjG2QKSgQMifzZE4JDJ6zwxsPTz0lmzEGAOv1
 b5Nz88iLeM1OWrzTjT/rhqM5nK6MaxpBn4AKIEAUTVFhddM++m4YijVPfTgbYsZEOPp3xZ
 03iZbft66aF8X5auL1Ac3N4ldyzC7UKrjsQmlv+C7l9L3F8N1KNC6xuKuBr/f+HQ3sRcDp
 ap/bpYuVQ6/MtE1e6kVakSxd6M7oS0zL785uHWx1ElPfZlz6eECbh1GOoJJvpQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: rawnand: print offset instead of page number for bad
 blocks
Date: Mon,  4 Apr 2022 10:47:03 +0200
Message-Id: <20220404084703.1202181-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220326163304.30806-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f7c48bccf1a0262a763f7e39f28c5c6798f2d6c3'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_014706_960407_6568A11D 
X-CRM114-Status: UNSURE (   6.00  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAyMDIyLTAzLTI2IGF0IDE2OjMzOjA0IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IFRoaXMgbWFrZXMgcHJpbnRlZCBpbmZvIGNvbnNpc3RlbnQgd2l0aCBvdGhlciBr
ZXJuZWwgbWVzc2FnZXMuIEFmdGVyCj4gc2Nhbm5pbmcgTkFORCBCQlQgY3JlYXRlX2JidCgpIHBy
aW50cyBvZmZzZXQgb2YgZWFjaCBiYWQgYmxvY2suIFRoaXMKPiBjaGFuZ2UgbWFrZXMgaXMgZWFz
eSB0byB2ZXJpZnkgbmFuZF9lcmFzZV9uYW5kKCkgZmFpbHVyZSByZWFzb24uCj4gCj4gU2lnbmVk
LW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKQXBwbGllZCB0byBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXgu
Z2l0IG5hbmQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
