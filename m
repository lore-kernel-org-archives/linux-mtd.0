Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C64BC28B20
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 16:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLeVutxsHEdDrwB0YokYQxJ9Aig1OuJhYn5pOhNGrTY=; b=vV1K9xQgCFQKXz
	NqrAmKNQ96nxG3XYYAJdbSDLQqFYtjLtLldYo3C54ILeg3FcEVMATdXe/1n4dgZkQEEzT3GlgpjC6
	QoWf9+DqAsCWnrk7sFn6F+PvVd63dmyC10cLOog6wUoWmUCao4l4gshotI0fr3+4fCq39gbYzhq+P
	NnvRKfkZd5ZYUd4wlpI4CxdwE07wUjym/xBULFTNriKzKuyerIUdc5xjg0fQyAX1mKxJGiozDsWlM
	lsqEYiUcEdlZHVerXFRIoJcNUEtovEsqXjB0JrR0CC2ar7j4TUD3/5eBiLfrIjrlAGAxia6wLJK3t
	P73WZetbNZPMGIg5PtsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01Ot-00000006hC5-2M0U;
	Wed, 02 Apr 2025 16:57:15 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01Op-00000006hBF-42CD
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 16:57:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A8474436E;
	Wed,  2 Apr 2025 16:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743613027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wB1i3sD4pnit/PHMVxIDiTRb8TvQzmn7UQgxvFG5ANg=;
	b=cWlY62ast0I2fh+PueJmZkKZaSmc5C7M4SP4eIzVdKU6u8MF9wOOdd6e1bkspZqxrHCDKo
	1NVmEfh0AX2zqoJhLgKh3NB7CGo4JhMGfO2wd82/sx5lL+MjnhzebUiThTFbwfoi7oggbC
	uUbz69mw32XG2O6WG/PRHg7dZH1rt5f81bSpZHNUwhgB4yFm6mNDXN+tbGlHaxIvWocZfW
	+fOFjN6uHXQr3djCKqsDCbEl+k+Mk7olKHPxGZOOTBxIPHZ6fQnyzOgqNSnEbAXyJ92Q/u
	PS6iAtA+yY7AErhTeP76IGMD/hxP8oou5a7KsBUgvrv5MydQDk2nV77P6PXY5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin <stlin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/21] mtd: spinand: winbond: Rename DTR variants
In-Reply-To: <3ebd53ef-c7fd-4c8c-96f3-32e97b355b6b@linaro.org> (Tudor
	Ambarus's message of "Wed, 2 Apr 2025 16:19:00 +0100")
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
	<20250307-winbond-6-14-rc1-octal-v1-15-45c1e074ad74@bootlin.com>
	<3ebd53ef-c7fd-4c8c-96f3-32e97b355b6b@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 02 Apr 2025 18:57:05 +0200
Message-ID: <871puaqz6m.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeeivddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtsehttdertddtredtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfelkedvveffleeuhfeigfdvvefhgfejgffghfeiteegteeiudegfedtjeehkeefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehsqdhkieesthhirdgtohhmpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtp
 hhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_095712_635561_AFE05DF7 
X-CRM114-Status: UNSURE (   8.67  )
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

Hello Tudor,

First, thanks a lot for the time spent reviewing, much appreciated.

On 02/04/2025 at 16:19:00 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> Hi, Miquel,
>
> On 3/7/25 3:08 PM, Miquel Raynal wrote:
>> -static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
>> +static SPINAND_OP_VARIANTS(read_cache_dual_quad_dtr_variants,
>
> why not read_cache_single_dual_quad_dtr_variants? I see single dtr too
> in the supported ops.

That's true, but single modes are literally always supported, so it is
not very discriminant, and here my goal is to differentiate the variants
supported by the dual/quad chips vs. the variants supported by the octal
chips (which are not capable of dual/quad transfers). What do you think?


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
