Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DFCC87FCA
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jul 2025 16:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ON3bq7+CECcjBE9jBPVlv2lBP8GtMjnMNSoM7ZQNiw=; b=JVqmBY/aqm1nAF
	PzLhnN8B85NygPx6vZZL02skhrCbJqnpbYMFde4m0vpPM0qB9olXkQurV2WZylVls8RLIOkPqWLAK
	ryHy5vLyFstPS9S4XUFbtpx7GY0hN9WMdxJz0l+iu1WkXBlAIZSITBPT+fTtVtqVtJb5/ribAd4NL
	Axulj+lhtRpACb4gp0VKOrQgPFRNPy6mSDL5R+bBJtKgQjqTf74r94vpc2BXVgN+zJamWIn8HPz3j
	RMMcGNVxZnwuQYpnr77dprPpAhnlCyWvCNIGWL9Kf7sEL0d+mP+Gr34CLiDtGj1SsDqbpjx+lxyAK
	cpGqaB0bBTQ7ZJkMuiqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWaj-000000047rT-162Q;
	Thu, 31 Jul 2025 16:57:17 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWah-000000047pN-1AUs
	for linux-mtd@lists.infradead.org;
	Thu, 31 Jul 2025 16:57:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1754844440;
	Thu, 31 Jul 2025 16:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753981032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KS4kfVkXIPnJCKzga+HqF7n9ePi3REK/GMfXWoo+jEI=;
	b=PYhiBoKb8SAiJFNKv/m41/fq9xh3No5RkOFTR0PmByu/LQjJC4pFGB5VKUufBCn/lLmyHB
	8ugdntxxfTQsqClGKa9vC9H+8P/7ZOQr50gdnUQXMR/36RRv7y9k7Z7JZ+5BG9mZadvABX
	cD+VJXok2pZtzXyQfBnhsnXCILRsfotZ6PfMNA1BEOWW1Jir1Gfdlf1G4CCD5E7L02s7oR
	wICdzMwrpoO2QfYtAqMAUvFHB0jUNcSBuomN4qNq8LHrT//yapdUEUgWt4us3mJrjsyp/F
	SBGXxsC/rQaZcCf1TYaR2AvDnvQr67bJFAq6dKuhzgxwedZgjfC0cQ42xxng+A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Tudor Ambarus <Tudor.Ambarus@linaro.org>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  Michael Walle <michael@walle.cc>,  Pratyush Yadav <pratyush@kernel.org>,
  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: nand: Changes for 6.17
In-Reply-To: <87jz3o9uel.fsf@bootlin.com> (Miquel Raynal's message of "Thu, 31
	Jul 2025 18:50:26 +0200")
References: <87jz3o9uel.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 31 Jul 2025 18:57:09 +0200
Message-ID: <87wm7o8fiy.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddufeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtsehttdertddtredtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfelkedvveffleeuhfeigfdvvefhgfejgffghfeiteegteeiudegfedtjeehkeefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopefvuhguohhrrdetmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepfhhrihgvuggvrhdrshgthhhrvghmphhfsehkohhnthhrohhnrdguvgdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtphhtthhopehprhgrthihuhhsh
 heskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_095715_488960_53EAE536 
X-CRM114-Status: UNSURE (   6.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 31/07/2025 at 18:50:26 +02, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hello,
>
> A little bit late, this is the NAND PR for 6.17.
> Patches have been lying in -next only for a few days due to my limited
> availability during July. I am almost done catching up, but in order to
> send the PR ASAP to Linus, I'll immediately apply it and trigger the MTD
> PR (including SPI NOR, ofc).

Pulled into mtd/next.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
