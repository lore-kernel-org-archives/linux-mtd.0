Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E886DC02185
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2025 08:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TV8+You9A/TV6ecPDBxre1XWicYk5O6AfJY++yweO/U=; b=4WrXgnh5y+lwya
	H8076wnrNSExWz2No+ph05mz6phbbpBjQlZTeKc0rtBVfhmhIHhbFxNAc1Lo7yckdbLE05DecBNjZ
	GMIlYH67cFbcoCZKNBidonFNYZqRXARcn/a1gF+hrTHd1noqUzIXDJN1t2k3+i77Gl9LW4cQ/y39t
	2Q7c7Dj8FulqnjfMbK2My7/JVaeAdMA8CHnMrsHn/WP+fZiajYNyTC+ABxEpKpqi6ly/KD7hFpg3O
	1U4nWDq1hNYTtsjlfa5yEWVPPXzYtPFcTzJbclt3CmZ8hN2iLk1B0CMK76uJW3duSxnWXIsH34EUr
	3NduCkHyVMOQ2Z1zS3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZmwr-000000050Eu-3H3A;
	Mon, 20 Jan 2025 08:15:53 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZmwl-000000050Cs-1BNK
	for linux-mtd@lists.infradead.org;
	Mon, 20 Jan 2025 08:15:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 946721C0004;
	Mon, 20 Jan 2025 08:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737360944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F5kuSlohP0YVQsyEp2OI9YNs5VfOo7KQkaD+4gW0/GI=;
	b=LQWm8AAQkr6Qr9qqcjOCl804ejA+PdBBuI8ibUiWc6K10Y6D/9nB7Wt2jazP8ix8fz/Vv6
	wngBEvK8kXRYN87+tgvg1hjv+mjNe7d0cIHJ35V3wH91pIcToXtvKkYwkhGktIs+fzbox+
	4Mv6sPY3kZa7X4g2opBvzMhAZ0IuaJIsh7w7x4q3QrnVbcvJl1kmWEs2u/CN869a4AOfJQ
	kGXISaM308vwFrN3uP2d8+omKao+4Bn9EI7ehZo3/y02Cnr/RgIGFRUGzBgJ/OCCrb92JA
	C5FquUONPwKubHrwIO32pz9FevEInXm0/9Pv3hDNsCyvU0p12mDPzKhtwLUGzA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <stlin2@winbond.com>,
	kernel test robot <lkp@intel.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] mtd: spinand: skyhigh: Align with recent read from cache variant changes
Date: Mon, 20 Jan 2025 09:15:42 +0100
Message-ID: <173736092387.659417.14542777219993535543.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250116093527.472648-1-miquel.raynal@bootlin.com>
References: <20250116093527.472648-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_001547_913140_AE2AE710 
X-CRM114-Status: UNSURE (   8.04  )
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

T24gVGh1LCAxNiBKYW4gMjAyNSAxMDozNToyNyArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBUaGUgU1BJTkFORF9QQUdFX1JFQURfRlJPTV9DQUNIRV9PUCBtYWNybyBoYXMganVzdCBiZWVu
IGNoYW5nZWQgdG8gc3RvcAo+IGVuY29kaW5nIHRoZSAiZmFzdCIgcGFyYW1ldGVyICh0aGUgbWFj
cm8gaGFzIGJlZW4gZHVwbGljYXRlZCBhbmQKPiByZW5hbWVkKS4gVGhlIFNreWhpZ2ggZHJpdmVy
IGlzIG5ldyBhbmQgaXMgc3RpbGwgdXNpbmcgdGhlIG9sZCBzdHlsZQo+IG1hY3JvLgo+IAo+IAoK
QXBwbGllZCB0byBuYW5kL25leHQuCgpbMS8xXSBtdGQ6IHNwaW5hbmQ6IHNreWhpZ2g6IEFsaWdu
IHdpdGggcmVjZW50IHJlYWQgZnJvbSBjYWNoZSB2YXJpYW50IGNoYW5nZXMKICAgICAgY29tbWl0
OiAyNmEzMDFiN2ExNzllZTIwMjVhYzVlZGI4ZTcxNjZkNTIwNGZiZTUzCgpLaW5kIHJlZ2FyZHMs
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
