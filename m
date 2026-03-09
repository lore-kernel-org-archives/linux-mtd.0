Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717E3F417F3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 15:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZ7uCab74e1+aJV4R3wyO7ya1rtWhXMOGjALQbqt4cA=; b=eepPl3k9WZPCg5
	SBmAXkc5RBt5orKkB/D9BYv+dW5ecMXH1l5g8xC6ePc2UQVjdisWlSGNCifEy0GQ3pdaGyh0pzEXV
	DmbqPFO1/fpX3MYrAWnwRCh7sO6pBhIcZirY2Wk0kZAXiZCDUNJWvWtEzYqS/N5wSjnbr13ozdIXk
	PfM5fYR7fZPTD9JQPmjGzGc9IhFP+i/9eniy8C0dzfaOo705tzIC/aITR7LxnMA9vH5pn+mkLOSFe
	v80A1KZvvg7w+NVsA901IPhDeW08oCeWXjk47bR4JXW+cL1knDnjTJHRtQWFz47IPEOmShhRxH1B2
	LqQGgByce+usoU6od59A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcWO-00000007bSS-0z9q;
	Mon, 09 Mar 2026 15:27:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcWL-00000007bRk-3B88
	for linux-mtd@lists.infradead.org;
	Mon, 09 Mar 2026 15:27:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4C9184E425DC;
	Mon,  9 Mar 2026 15:27:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21DD15FFB8;
	Mon,  9 Mar 2026 15:27:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A34C810369A9B;
	Mon,  9 Mar 2026 16:27:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773070067; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7o2lSlwnqD1IVDD/21T16zX/mpFvqv7Ltx6kYFACD5k=;
	b=NcIIly4DbRfRXqvItRLuep3qvqLnq7SWhqJtYzXeNVq2UihIuui7iJgcIR9rZ7xWW5Htgk
	DrnDaxi8xhMGISqAKGpd0ZYMozw4VtIKNzmAMN8P7zyyJ5RbuoEAwpobhkkGBsiXOuQ2WE
	x0v/927EmHkOjGGwcFUC+Hfw5D3mV0ZgxuOAd+MzRN/YWnV3OBq8QwsuB692Tvyg1CcEnf
	VYQSx1JfLeeHLZ0mwzfH2Adf+oROoXoyOhZrGgJAKAm92N8GElRtRDmfq7HGxmfo0tLBog
	izRJVSb3XnR45xZUIzhSonml8BF0sWdzQWNrrZaC7jlCX8HQ6LKGS6vEhLxVYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Chen-Yu Tsai <wens@csie.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,  Wentao
 Liang <vulab@iscas.ac.cn>,  Maxime Ripard <mripard@kernel.org>,  Boris
 Brezillon <bbrezillon@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] mtd: rawnand: sunxi: do not count BBM bytes twice
In-Reply-To: <20260305100137.2558423-4-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Thu, 5 Mar 2026 11:01:34 +0100")
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
	<20260305100137.2558423-4-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 09 Mar 2026 16:27:42 +0100
Message-ID: <87a4whnhu9.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_082749_929582_56E42726 
X-CRM114-Status: GOOD (  10.92  )
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

SGVsbG8gUmljaGFyZCwKCk9uIDA1LzAzLzIwMjYgYXQgMTE6MDE6MzQgKzAxLCBSaWNoYXJkIEdl
bm91ZCA8cmljaGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBCQk0gaXMgcGFydCBv
ZiBVU0VSX0RBVEEgc2VjdGlvbiwgc28gd2Ugc2hvdWxkIHJlbW92ZSBpdCB0d2ljZQoKTWF5YmUg
eW91IG1lYW4gImlzIGFscmVhZHkgcGFydCIgYW5kIGFzIHN1Y2ggdGhlIGVuZCBvZiB0aGUgc2Vu
dGVuY2UKc2hvdWxkIGJlIHRoYXQgIndlIHNob3VsZCAqbm90KiByZW1vdmUgaXQgdHdpY2UiPwoK
PiBUaGlzIHdhcyB3b3JraW5nIG9rIGJlY2F1c2Ugd2UgYXJlIG9uIHRoZSBzYWZlIHNpemUsIGFk
dmVydGlzaW5nIHRoYXQKPiB0aGVyZSB3YXMgMiBieXRlcyBsZXNzIGF2YWlsYWJsZSB0aGFuIGlu
IHJlYWxpdHkuCj4KPiBCdXQgd2UgY2FuJ3QgY2hhbmdlIG9sZCBwbGF0Zm9ybXMsIHNpbmNlIGl0
IG1heSBsZWFkIHRvIGEgZGlmZmVyZW50IEVDQwo+IHN0cmVuZ3RoLCBzbywgaW50cm9kdWNlIGEg
bGVnYWN5IGZsYWcgZm9yIG9sZCBwbGF0Zm9ybXMsIGFuZCBzd2l0Y2ggdGhlCj4gbmV3IHBsYXRm
b3JtcyB0byB0aGUgY29ycmVjdCBjb3VudC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgR2Vu
b3VkIDxyaWNoYXJkLmdlbm91ZEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
