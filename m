Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE25F013D5
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 08:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGiXWp8Y9PlhRzFnjhNTyQD7M7QP9p8SqxAoyd/jfBE=; b=JcLC6gQS9rB6pk
	joIW/X6Wzi1h/7/+4peszUoImC+xqnIoLYaaebjwZoeRQGM5YPQNZYH3Xj7j6EcdPSVvPFOcRk4zb
	zoUA29wp8HU4W75thvwPRc3eJd5K8NSt7Y8Mj8CwrBwEXNVLp3PPagzzW9O/QNd8/kQJ3vbn5AayZ
	I5+rQ6WUx9qW35S4BxmcGJHkK0pAi3xJKDXo5Zm/pD77E7MC6pdMmei0VbsBaXvApdJrMFw3tO7vz
	sTR/qqZFLcZJ8v862DkS6ID5TUIX5EzjVs185yRIWMj2rvPlPYtjAt0dPH366BaAUABAXHE31t/H9
	2DEf4BS/GN//9InggtPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23bA-00000003ZcG-3GkC;
	Mon, 16 Mar 2026 08:46:52 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23b6-00000003ZbY-2rck
	for linux-mtd@lists.infradead.org;
	Mon, 16 Mar 2026 08:46:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 63A7CC415A5
	for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2026 08:47:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B12475FC4A;
	Mon, 16 Mar 2026 08:46:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45045103683DF;
	Mon, 16 Mar 2026 09:46:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773650803; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uzy3Nla4L7Nw+ktfD3Xv1LrZh4KNF1TVAyAovINCmFM=;
	b=vWh34LfBL1MwPmo2Pc72pM5XDhHOe5wDRtlrH22UI8yMeKkBHYH7jQrZXjEtJjMW58xF8j
	hhb15gvPAw4uBx2LcNFWk2aHdamH+BwT0Zw7Lb9V4Sfk+v2fy0DkoQYXURSwSMdGhCQemy
	J0rkC65QUcDjxeycgwH6fqKtcvoAECrs6zOKlQo1i9Qyabm4709bV3nKGSBLAZemncoFnu
	qI+0ZkUIq8aheSp64IBriX9MqGylPrJIaP5ctf1tMc4RocG6xFpJlEcb7hh/6ph4YOgv83
	bmK2k9Aosh4UKFoKYG6g3dXVe0pXS1MZNW9NEhmJHB1/6qC6xkMFcteCzUovww==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Olivier Sobrie <olivier@sobrie.be>
Cc: Michal Simek <michal.simek@amd.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org, Andrea
 Scian <andrea.scian@dave.eu>
Subject: Re: [PATCH] mtd: rawnand: pl353: make sure optimal timings are applied
In-Reply-To: <20260304211823.569972-1-olivier@sobrie.be> (Olivier Sobrie's
	message of "Wed, 4 Mar 2026 22:18:23 +0100")
References: <20260304211823.569972-1-olivier@sobrie.be>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 16 Mar 2026 09:46:39 +0100
Message-ID: <87bjgogo0g.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_014649_173837_A758FEEB 
X-CRM114-Status: GOOD (  10.91  )
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

SGVsbG8gT2xpdmllciwKCisgQW5kcmVhCgpPbiAwNC8wMy8yMDI2IGF0IDIyOjE4OjIzICswMSwg
T2xpdmllciBTb2JyaWUgPG9saXZpZXJAc29icmllLmJlPiB3cm90ZToKCj4gVGltaW5ncyBvZiB0
aGUgbmFuZCBhcmUgYWRqdXN0ZWQgYnkgcGwzNXhfbmZjX3NldHVwX2ludGVyZmFjZSgpIGJ1dAo+
IGFjdHVhbGx5IGFwcGxpZWQgYnkgdGhlIHBsMzV4X25hbmRfc2VsZWN0X3RhcmdldCgpIGZ1bmN0
aW9uLgo+IElmIHRoZXJlIGlzIG9ubHkgb25lIG5hbmQgY2hpcCwgdGhlIHBsMzV4X25hbmRfc2Vs
ZWN0X3RhcmdldCgpIHdpbGwgb25seQo+IGFwcGx5IHRoZSB0aW1pbmdzIG9uY2Ugc2luY2UgdGhl
IHRlc3QgYXQgaXRzIGJlZ2lubmluZyB3aWxsIGFsd2F5cyBiZSB0cnVlCj4gYWZ0ZXIgdGhlIGZp
cnN0IGNhbGwgdG8gdGhpcyBmdW5jdGlvbi4gQXMgYSByZXN1bHQsIHRoZSBoYXJkd2FyZSB3aWxs
Cj4ga2VlcCB1c2luZyB0aGUgZGVmYXVsdCB0aW1pbmdzIHNldCBhdCBib290IHRvIGRldGVjdCB0
aGUgbmFuZCBjaGlwLCBub3QKPiB0aGUgb3B0aW1hbCBvbmVzLgo+Cj4gV2l0aCB0aGlzIHBhdGNo
LCB3ZSBwcm9ncmFtIGRpcmVjdGx5IHRoZSBuZXcgdGltaW5ncyB3aGVuCj4gcGwzNXhfbmZjX3Nl
dHVwX2ludGVyZmFjZSgpIGlzIGNhbGxlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IE9saXZpZXIgU29i
cmllIDxvbGl2aWVyQHNvYnJpZS5iZT4KCk5pY2UsIHRoaXMgcHJvYmFibHkgd2lsbCBkZXNlcnZl
IGEgRml4ZXMgdGFnIGFuZCBDYzogc3RhYmxlLgoKQW5kcmVhLCB0aGlzIG1pZ2h0IGJlIHRoZSBy
ZWFzb24gd2h5IHlvdXIgTkFORCBjaGlwIG1pc2JlaGF2ZXMgYWZ0ZXIgYQpzZXRfZmVhdHVyZS4g
V291bGQgeW91IG1pbmQgdGVzdGluZyBpdD8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
