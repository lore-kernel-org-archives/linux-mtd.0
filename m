Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E98BC35FFA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 20:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OavvBtaLZUKU/enSobZcMFdLEewo7LbVNc4XZ1iBv4=; b=wevSOBWCpxV2Ph
	HZlR1j072eNTqx1xOAyMQV6FADtBxErXalNZNuxGOud10MyJlk2glQuSkRLLxsmi9WgMIwp6uTaSz
	yK1PTILRYcr3VGd21cjxd2QOHDUe9PORzOyx6cz4sqC4T/MwepH0TGwmwySemIOKHA1xtzD9f5xIx
	SffoR1n4WeQJ7Rr1sL4HDiZD44OK76zgX1y4ql0ysy76zq7K9s7NdOVyLjMr9hApHrPWF3KKJJvxy
	NTnAx2JleKCIvqWI/d4TzBTnlWfy7ol+QjPHe2x3S0nsVWepzJ9oIuHmtxbzqnE5kC4tFoJKRDv7V
	8zLcL/VdPFuu7kmoUqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuzik-0000000A2pk-3GUt;
	Wed, 19 Mar 2025 20:08:58 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuzih-0000000A2oz-0dHn
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 20:08:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5680744457;
	Wed, 19 Mar 2025 20:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742414932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zBYEvxHYDEPHyt7n9KinUMtqyVY5IgTEOKZ+DSUZBS8=;
	b=ZPEBDzrC11BVkharYlDWxfFq8Bf+YYnhBKXIhgz82ouOAuBEOrOpEO9+SwwnM1yp3PSCHi
	roOzJJrTIZkj6gE/1+gxoWDR7YoQBtxstpRrtZkr5WcE5UIv+LBJh7GcthOYBLvEFcY3mF
	amZtRFkEC0hmAAIawVtdnw8cHEvhRcA3VatuCTkztynaa81eH58DqXQvysC6r5GH8BYum5
	Z51R9nRN3uQBFs3Ku+5+T377GwEDGU45Q38gqv6jyVBAZHyAX7k+m02k6qGVaaLBFjnSL9
	3K4gz8Nux9B9Uu8rMF0a4TriYqRnUhdVopAtpDguRxr161L+HVcNkJe02A/yJA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  linux-spi@vger.kernel.org,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] spi: spi-mem: Introduce a default ->exec_op() debug log
In-Reply-To: <a97f8ddc-c9b9-45a4-bef3-cbc01c3d07c6@sirena.org.uk> (Mark
	Brown's message of "Wed, 19 Mar 2025 17:39:50 +0000")
References: <20250305201140.2513431-1-miquel.raynal@bootlin.com>
	<a073191e-afab-484e-9659-66b957301db1@linaro.org>
	<ce648080-2964-40d2-a2a7-cafcb6592cd1@sirena.org.uk>
	<87h63p2c3n.fsf@bootlin.com>
	<a97f8ddc-c9b9-45a4-bef3-cbc01c3d07c6@sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 19 Mar 2025 21:08:50 +0100
Message-ID: <87ldt0ye99.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeeivdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtsehttdertddtredtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfelkedvveffleeuhfeigfdvvefhgfejgffghfeiteegteeiudegfedtjeehkeefnecukfhppeelvddrudekgedrleekrddukeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdelkedrudekledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhsphhisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehprhgrthihuhhsh
 heskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_130855_819227_4888787F 
X-CRM114-Status: GOOD (  13.21  )
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

On 19/03/2025 at 17:39:50 GMT, Mark Brown <broonie@kernel.org> wrote:

> On Wed, Mar 19, 2025 at 05:56:28PM +0100, Miquel Raynal wrote:
>
>> I'd say that for this particular purpose I do not thing that trace
>> printks or events would really fit. As a developer, I'd definitely
>> always change the function calls to some direct printk calls in this
>> case. The verbose debug alternative seduced me though, so if that's okay
>> for you, I'll switch to dev_vdgb() as suggested by Tudor, which honestly
>> feels like a seducing alternative.
>
> That's fine for me.  I do have to say that I tend to end up doing the
> opposite of you and adding tracepoints to code I'm doing much with, they
> work so much better so long as you can get the buffer off the device.
> Low overhead, much bigger lookback and better tooling.

Interesting. Maybe I should consider playing a bit more with those. It's
true that the fact that you need to load the trace buffer off is always
a bit painful, but as long as network works, that should not be that
much of a burden once it's been set up.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
