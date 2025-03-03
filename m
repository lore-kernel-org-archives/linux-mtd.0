Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C6EC282CD
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Mar 2025 10:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+MIn3ISQ30d+/MZobalEWmPB2z3l2Qs+waed4JDkZkI=; b=CKTYmpeJMjb0tj
	bDWPzbWhHaHLUArJk7ZN4vfmfkze2u5AdZDY9YLYgJX8Bi4TwDNIGN1/jJk2Sg7DfjRaT8fnDDMKD
	ikcVjA0RKJxDZT2TRHyiKCwuF/50k9KfsHDSULGMcXBty76WoRej9uJ9QUlGYRThLokswlEyN8mtu
	2yTSVvUdmdQNkbi1w5UnFHYKd+IwFnuzdvQ6hB/SWX48kqM3XBLHBIkuatlOatjBvw90nb1TsKvdl
	6XHuqT+UoCzdS+MEKMsbPYHeYDtXU8W3cS6CXdcioqDlHtBi7C3yTYW6Cynk/Xwl8vOC9dvJ/SzYb
	ucJd1JevmuWjkYALXiTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3Jx-00000000Ny2-1m0H;
	Mon, 03 Mar 2025 10:46:49 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3GP-00000000Mz2-1aCW
	for linux-mtd@lists.infradead.org;
	Mon, 03 Mar 2025 10:43:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85D9F4419B;
	Mon,  3 Mar 2025 10:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740998585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jowEScGafDqHehCuuxXQ5RRiB4vq3Q0DU122NO345r8=;
	b=ZTbOFcm1NXHdDGcFApkbQVn+GvCtY6pHznZmCM/8Fpoza1+dDfDUmHpHWoXfXcn73CYtNz
	AHMEa1NG0lWQlgUao5wKITGBs/mTFO6CSGThHPHwXSzF2tFHcG90iptSiEYE15hoNhcTQg
	ZmDz3AEcStB4ZIBqxO41pPZQ8Hvc8EtEeryqPnl6gYMmOZN8sGND4gQv3IX9M8cK7OdmJ5
	Yip2F0tgDeWDZwtY1/jYiRsym2VbJhJgGholjkEeLmP1L/8orwNOfD1Ures6wK8eIzP1MZ
	B2H3omjy5L8SC7aL3rquCzr8n2clDF2oeOgcb89rFgnEs5EVck2SApYr7xdcyg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-tegra@vger.kernel.org,  linux-mtd@lists.infradead.org,  Jonathan
 Hunter <jonathanh@nvidia.com>,  Lucas Stach <dev@lynxeye.de>,  Richard
 Weinberger <richard@nod.at>,  Stefan Agner <stefan@agner.ch>,  Thierry
 Reding <thierry.reding@gmail.com>,  Vignesh Raghavendra <vigneshr@ti.com>,
  LKML <linux-kernel@vger.kernel.org>,  kernel-janitors@vger.kernel.org,
  Qasim Ijaz <qasdev00@gmail.com>,  Natalie Vock <natalie.vock@gmx.de>
Subject: Re: [PATCH] mtd: rawnand: tegra: Simplify maximum determination in
 tegra_nand_setup_timing()
In-Reply-To: <d564cafe-d45a-40b5-9a91-a2e2b97c80d6@web.de> (Markus Elfring's
	message of "Fri, 28 Feb 2025 19:33:10 +0100")
References: <d564cafe-d45a-40b5-9a91-a2e2b97c80d6@web.de>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 03 Mar 2025 11:43:04 +0100
Message-ID: <87pliy9yyv.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelkeeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepofgrrhhkuhhsrdfglhhfrhhinhhgseifvggsrdguvgdprhgtphhtthhopehlihhnuhigqdhtvghgrhgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehjohhnrghthhgrnhhhsehnvhhiughirgdrtghomhdprhgtphhtthhopeguvghvsehlhihngigvhigvrdguv
 gdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehsthgvfhgrnhesrghgnhgvrhdrtghhpdhrtghpthhtohepthhhihgvrhhrhidrrhgvughinhhgsehgmhgrihhlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_024309_542076_99962DDD 
X-CRM114-Status: UNSURE (   7.39  )
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

SGksCgpPbiAyOC8wMi8yMDI1IGF0IDE5OjMzOjEwICswMSwgTWFya3VzIEVsZnJpbmcgPE1hcmt1
cy5FbGZyaW5nQHdlYi5kZT4gd3JvdGU6Cgo+IEZyb206IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5n
QHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4KPiBEYXRlOiBGcmksIDI4IEZlYiAyMDI1IDE5OjE5OjQ1
ICswMTAwCj4KPiBSZWR1Y2UgbmVzdGVkIG1heCgpIGNhbGxzIGJ5IGEgc2luZ2xlIG1heDMoKSBj
YWxsIGluIHRoaXMKPiBmdW5jdGlvbiBpbXBsZW1lbnRhdGlvbi4KPgo+IFRoZSBzb3VyY2UgY29k
ZSB3YXMgdHJhbnNmb3JtZWQgYnkgdXNpbmcgdGhlIENvY2NpbmVsbGUgc29mdHdhcmUuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5u
ZXQ+CgpJIGFtIHNvcnJ5LCBJIGRvIG5vdCBzZWUgd2hhdCBnZXRzIHNpbXBsaWZpZWQuIG1heCht
YXgoYSxiKSxtYXgoYyxkKSkKbG9va3Mgc2ltcGxlciB0aGFuIG1heDMoYSxiLG1heChjLGQpKS4g
RG9lcyBpdCBicmluZyBzb21ldGhpbmcgaW4gdGVybXMKb2Ygb3B0aW1pemF0aW9uPwoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
