Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837EAEB64DC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 13:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hIWJA3KlIWPkaYQaB6UC0SOG6qeONOSxzxtjn7p1ZTw=; b=EsSJtCfpyiDQ+6
	8VR2jMFhKNT1+BIi+0mYapHKIwArRPXOepjQc32n+7pRPNvBtHQ/rJmf5yV08wGAVy4mRb+Z4J4cn
	zrt4ajhXoCjxzJCOUP7x1MpQKcix9McYRub9ACmSohuVYp5EIcSdpjy9xeKUdkoFBUwU3vBGJXET1
	1JdjnlmePMHZmS8B5YQR5vVVOTF+6v67JE5Ne9J+9YT9mAvuXgVXtPa3e/mf4M6w9ODZjb/tkRgKB
	AzZTDnuHw2fMXBQCVY6oqDv4M85BBUR9Z94tRLxj0nl7GiL8qePlIJKl/HK0cYD5eQIY9o2MRF6RT
	utdknzoLhWVpbwThDt7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLO1W-0044iI-0z;
	Mon, 17 Jul 2023 13:12:22 +0000
Received: from unicorn.mansr.com ([2001:8b0:ca0d:1::2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLO0m-0044be-1m
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 13:12:19 +0000
Received: from raven.mansr.com (raven.mansr.com [81.2.72.235])
	by unicorn.mansr.com (Postfix) with ESMTPS id D70AC15360;
	Mon, 17 Jul 2023 14:11:31 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
	id 8AA65219B40; Mon, 17 Jul 2023 14:11:31 +0100 (BST)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, JaimeLiao
 <jaimeliao.tw@gmail.com>, Alexander Shiyan <eagle.alexander923@gmail.com>,
 Domenico Punzo <dpunzo@micron.com>, Bean Huo <beanhuo@micron.com>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: Support for sequential cache reads
References: <20230112093637.987838-1-miquel.raynal@bootlin.com>
	<20230112093637.987838-4-miquel.raynal@bootlin.com>
	<yw1xfs6j4k6q.fsf@mansr.com> <20230716174917.3a9ca7a7@xps-13>
	<yw1x7cqzzr4d.fsf@mansr.com> <20230717091900.52ed815a@xps-13>
Date: Mon, 17 Jul 2023 14:11:31 +0100
In-Reply-To: <20230717091900.52ed815a@xps-13> (Miquel Raynal's message of
	"Mon, 17 Jul 2023 09:19:00 +0200")
Message-ID: <yw1x351mznr0.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_061138_696487_AA5A4998 
X-CRM114-Status: GOOD (  16.05  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Miquel Raynal <miquel.raynal@bootlin.com> writes:

> So, I should have done that earlier but, could you please slow the
> whole operation down, just to see if there is something wrong with the
> timings or if we should look in another direction.
>
> Maybe you could add a boolean to flag if the last CMD was a
> READCACHESEQ, READCACHESTART or READCACHEEND, and if the flag is
> true, please get the jiffies before and after each waitrdy and
> delay_ns. Finally, please print the expected delay and the actual one
> and compare to see if something was too fast compared to what we
> expected.

Between which points exactly should the delay be measured?  Also, there
is no command called READCACHESTART.  Did you mean READSTART or
something else?

> In a second test, you could simply add a udelay(50); at the end of
> omap_nand_exec_instr().

That didn't help.

-- =

M=E5ns Rullg=E5rd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
