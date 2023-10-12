Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C4ACDB47E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcAcqr+Svwqx1zz8YdlA/vXZ1BDBSdHEBgWSvibVu+c=; b=Y+xrzZxBiB6Wzl
	31Q8RLaRPsQd92CK1RAr+DlXJzRFIrLUVl40LdbQxyKBnNo3OJ/ZT3eHWlq6jq4otYIK/8/5zQHoi
	lymzhKDycWmLLgxbI1v+6r6zUOEGBkzBxEpka886z78HhAs0XWdcpchQ97FqPZLx65vkTqzOqNqpZ
	XLKV6UwGwFqQPKZmu7eDb/pM0usTHW57ZhVYzdRMzCYHy58yHJ3mw5hsIfwxYRkmC4RRo9jgyvdH1
	LVNkRQz8rGUpkzCepbLv+7F3QMgtvg9GIgJYUvxO24Yx9fNUI6fLfT0yqxjMiGamqMi8YVkravAzV
	of6Z0il9WlPwIX32llQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqzsO-001YvM-2G;
	Thu, 12 Oct 2023 17:53:36 +0000
Received: from mout.gmx.com ([74.208.4.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqzsL-001Yux-1P
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 17:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com; s=s1089575;
 t=1697133199; x=1697737999; i=dregan@mail.com;
 bh=iTthuqAjyy72N+fciK50KP2B+emGs7FSHchafj1YPjM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cZsWwmsEHEW7DNZ1gyewd3dNaZ3IZiJvZtebC5UuBb/X7ZHMgWZWPomrXowoqyIjFtvuEMtu9Pj
 yeciOq7u12FbokjryLWQ2d0OSg9n+Rw8f97c8D4BUY4Q+cg71/Y2DhqpNYOzIWMegMKznz4/iHe8V
 yRlOE+63ErFhC735h9QeRMr9M1ieyk1AGcvlo0Ukd5rIsnPgk2Wz5YVQL09YK/10C/nD8Rq9WW2ED
 kOC7TX7cKP0WW7Mm4Tu6bR+D78qGtJ/+EbvWBe7YHkK4KA18EBQHbJpcJpFkzfbjerMkH7kMFfx+Z
 8N20C1DMuZ7Wd1CYK8Sbq5esW2dxrOcwvvKQ==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [192.19.223.252] ([192.19.223.252]) by web-mail.mail.com
 (3c-app-mailcom-lxa13.server.lan [10.76.45.14]) (via HTTP); Thu, 12 Oct
 2023 19:53:19 +0200
MIME-Version: 1.0
Message-ID: <trinity-2e19f638-4d4f-4516-a0ff-a9dc89d0cd94-1697133199218@3c-app-mailcom-lxa13>
From: dregan@mail.com
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com, JaimeLiao
 <jaimeliao.tw@gmail.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Adam
 Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH v2 3/4] mtd: rawnand: brcmnand: pass host struct to
 bcmnand_ctrl_poll_status
Date: Thu, 12 Oct 2023 19:53:19 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20231012091202.7c963f3f@xps-13>
References: <trinity-d3f78d82-f01e-4c98-9afa-18c5f7ddfd1c-1697071308619@3c-app-mailcom-lxa05>
 <20231012091202.7c963f3f@xps-13>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:NBSGb7g8H5l8ne5XL6fD6KCQdQyqzr2RmWeQf+fA84vfBd758Xx2YcaH4+P3Ah/u0wjc6
 TnW/QfwI5ZY769Q+K9bPKjDvhpc610BNLdApkDFpXPJ83rcdBjR8YSrB6km3IMDyEeF28VIz8lO3
 u4X3hEl/RC6t2Icc75t06tbHrg7ZgWAh+0UEa2nzNAJ3HXr3wGhhb8wi4/4QRKyEiM6cUw2OkWXx
 5vBpTWJ8HHdlCLAOqHkxm6HGvOtJ3VDwab5sBv0CUlGfwbNVqJRTmWoDpYnNwFMrR7IGBEeVYzs6
 f0=
UI-OutboundReport: notjunk:1;M01:P0:6MwWwcKXBHk=;fEsWbCXG+zCUehqLh+Lyg/JWv/8
 OW1d5m1kb3oNzeVg4XqO5pzxHN/ZXjPspBXbu2blJFb2RF8rZeRtUvxwMVWZYHzlADypigVkv
 PFUMnAjbtTM8jrKCzdKanni0CM85CgDOfFrkkKeYCYOZcNM86Ube5+zn5FPerA0yBgGAHCPgN
 ExlalL5/gHCluCLNiUaokz+EiQK+zHwgHM80TTFSWd82+FaUYDQ12GV/SFHGUbZeCFFZH5vo7
 NiznFem7fwt+LJllQTA8ckCcaiMDufkho5x9/mPgA74GsvHPeTp9278FU5cVgSVkzS3/+NKXE
 Dr+VDEBsaBdldt2YiPLo3EdsFPANya8XmF2/CeMIk3rXiUJ4fvZz/8aJJ8kegY3SI5i1jqvOA
 a6NRpq/womnSfH118bN/TSwYFRZ+i+JTqyw9GYL8n8QxkS4RVGdg2eFKuEFWozAGJkapEOUL4
 01ZVMvl9zCO23+4LAxIiWspmNPWD4RtjkPJlSAFWT/EJ5gxwgtf+c+RwvGORM/IFzdcyCuaGq
 LFvh11Juwq10KD0rSXCkO1CEDs2uiTtrF+jQQjpFAsgvQvtBnPGSni3hUrhzqnVuHuvaO6gOd
 CjyUhuteRHolsS52Phbe8cgQx/YzLkhdo+U00zexQ9uDNL42OOfDVMAYGIIfjkeBIlI081ulY
 cS467vKYdeJZ87dT4uDlZ7Y4vxf1ijhuNeDe9YtW19LRoKV2w61LsPt8qq8k+Wk+MFBZJ+KQu
 WOeG+xclLObobapO0emefB2U34ds1iUdk23W2o1wReJqpqTXOJ+2mIYRgzu7F5SzxKystfSP4
 XZc89F+m4cez6lTdIgwhvDmg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_105333_551952_F178C401 
X-CRM114-Status: GOOD (  16.25  )
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

SGkgTWlxdWVsLAoKPgo+IEhpLAo+IAo+IGRyZWdhbkBtYWlsLmNvbSB3cm90ZSBvbiBUaHUsIDEy
IE9jdCAyMDIzIDAyOjQxOjQ4ICswMjAwOgo+IAo+ID4gcGFzcyBob3N0IHN0cnVjdCB0byBiY21u
YW5kX2N0cmxfcG9sbF9zdGF0dXMgaW5zdGVhZCBvZiBjdHJsIHN0cnVjdCwKPiAKPiBDYXBpdGFs
IGxldHRlcgoKV2lsbCBmaXguCgo+IAo+ID4gc2luY2UgcmVhbCB0aW1lIHN0YXR1cyByZXF1aXJl
cyBob3N0LCBhbmQgY3RybCBpcyBhIG1lbWJlciBvZiBob3N0Lgo+IAo+IHJlYWwgdGltZSBzdGF0
dXM/IEknbSBzb3JyeSB0aGlzIGNvbW1pdCBsb2cgaXMgbm90IHZlcnkgY2xlYXIuCgpJIGNhbiB1
c2UgdGhpcyBhcyB0aGUgZXhwbGFuYXRpb246CgpQYXNzIGhvc3Qgc3RydWN0IHRvIGJjbW5hbmRf
Y3RybF9wb2xsX3N0YXR1cyBpbnN0ZWFkIG9mIGN0cmwgc3RydWN0CnNpbmNlIHJlYWwgdGltZSBz
dGF0dXMgcmVxdWlyZXMgaG9zdCwgYW5kIGN0cmwgaXMgYSBtZW1iZXIgb2YgaG9zdC4KUmVhbCB0
aW1lIHN0YXR1cyBpcyByZXF1aXJlZCBmb3IgbG93IGxldmVsIGNvbW1hbmRzIHZzIGNhY2hlZCBz
dGF0dXMKc2luY2UgdGhlIE5BTkQgY29udHJvbGxlciB3aWxsIG5vdCBkbyBhbiBhdXRvbWF0aWMg
c3RhdHVzIHJlYWQgYXQgdGhlCmVuZCBvZiBhIGxvdyBsZXZlbCBjb21tYW5kIGFzIGl0IHdvdWxk
IHdpdGggYSBoaWdoZXIgbGV2ZWwgY29tbWFuZC4KCj4gCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6
IERhdmlkIFJlZ2FuIDxkcmVnYW5AbWFpbC5jb20+Cj4gPiAKPiAKPiBUaGlzIG5ldyBsaW5lIHNo
b3VsZCBiZSBkcm9wcGVkIChpbiBhbGwgeW91ciBjb21taXQgbG9ncykKCkknbGwgcmVtb3ZlIHRo
ZXNlLgoKPiAKPiA+IC0tLQo+ID4gCj4gPiBDaGFuZ2VzIGluIHYyOiBhZGRlZCB0aGlzIHBhdGNo
IGluIHNlcmllcwo+IAo+IFRoZSB2ZXJzaW9uaW5nIGlzIHdyb25nIGJ0dywgeW91IHNob3VsZCBj
b250aW51b3VzbHkgaW5jcmVhc2UgdGhlCj4gY291bnRlciwgdGhpcyBpcyBub3QganVzdCB5b3Vy
IHNlY29uZCB2ZXJzaW9uLiBBbmQgYXMgSSBzYWlkIHBsZWFzZSB1c2UKPiBiNCBvciBnaXQtc2Vu
ZC1lbWFpbCBzbyBwYXRjaGVzIDIrIGFyZSBhbnN3ZXJzIG9mIHBhdGNoIDEgYW5kIGluIG15Cj4g
aW5ib3ggaXQgbG9va3MgbGlrZSA0IHJlbGF0ZWQgcGF0Y2hlcyBpbnN0ZWFkLgoKTG9va3MgbGlr
ZSBJIHN0aWxsIG5lZWQgdG8gd29yayBvbiB0aGlzLgoKPiAKPiBUaGFua3MsCj4gTWlxdcOobAo+
IAoKVGhhbmtzIQoKLURhdmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
