Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABBCD7877B
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2024 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+EVQadgGBs4hhfHUjxEzUsCo5avXZCslPhJI6ow7kdM=; b=ZssYUkhf6ZgvPE
	LgiXYrJnJNpgrEfLxvPqoknd5QE5hId49DkgxrCFYuML7cdRYPEPEMsWudpka2EVUnJbhjCIdW2UD
	4L35kkrKPelYGjH4JGu2OSB92/89H/YG2ZMYSMajgX80ZnD/gLZtR9KkOGwuYQNRw9/4IAFEBHnzw
	BBUvzcB8OccvWmYTszuVc6JubxaOTFOsgLRtGvDAyfmaLDON0y3G08vBZK7s8VIoaqRu/FzaebfpM
	qVoVTwoGjR6FTtn6t1rGth3cqrEBxgcNjkXWUmDurFUdz30YL0jvZdihCWiKXhYbupaL1NkFDEYr/
	eZzZppD15PyLsb/R8uZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9kv-00000000QLA-2For;
	Thu, 21 Nov 2024 16:10:09 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9kr-00000000QKe-0TPD
	for linux-mtd@lists.infradead.org;
	Thu, 21 Nov 2024 16:10:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FAC61C0006;
	Thu, 21 Nov 2024 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732205401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dvf6xlBVJTyaom0TJCD4ejTgXiaU375nYmWTgfLUuWg=;
	b=Ybq7qYr0Acr21LzwWTBs5aWc9IHO1vbiKDcyCIcixRPaCpzmPTchivOkUkZCReb9Wbmc9n
	i32vF9ImjXDjFcD8JVJPmpcTEzunjbhQBtGwxCngS2ap4TX2QzRl682a4PFC6aEWsowAbM
	duRRekVzuNX2snseoz9VL3DHZyvhYIQDhnZq0LeWJ/LWu5gWq55ElmzkO0oyMIKALw+IYc
	vaNV53KCY2dju3yIY9MImZrP5+Zr/MTHxTTRw5HGSEPnk2NOq6uWPO0Lqkgk2Wk1dNkIcD
	e180Bp/GavKp+eopfNZY3sfPv1eTXvh2sTbM8uxc41qiQ6JuUWU87pc/dsjF3Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Tudor Ambarus <Tudor.Ambarus@linaro.org>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  Michael Walle <michael@walle.cc>,  Pratyush Yadav <pratyush@kernel.org>,
  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: nand: Changes for 6.13
In-Reply-To: <87ttc3z27y.fsf@bootlin.com> (Miquel Raynal's message of "Tue, 19
	Nov 2024 16:13:05 +0100")
References: <87ttc3z27y.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 21 Nov 2024 17:09:59 +0100
Message-ID: <87a5dssh48.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_081005_432963_A1458448 
X-CRM114-Status: UNSURE (   4.45  )
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

T24gMTkvMTEvMjAyNCBhdCAxNjoxMzowNSArMDEsIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBIZWxsbywKPgo+IFRoaXMgaXMgdGhlIE5BTkQgUFIg
Zm9yIDYuMTMuCgpQdWxsZWQgaW4gbXRkL25leHQuCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
