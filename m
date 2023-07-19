Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590BDC0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 09:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOWPoABlj+PTQH0F/KjYW9a9YsH9NEuxP6JYHl/DiA8=; b=Dw4lyWjLqXvTR8
	NFOkTW5vlmTQJLpzh5q96lhUKVU4gaM5XfR5j/STfprpjbi3GG4cCITjC/Cds0g/4h4rqsvAEH0PE
	iQJqWnGTxxzG0YqgPB/zCbEutWaPFHXoezdRVz2htNbv6Taf29VQ/C39KDFr3560zYwxzxKgQlufp
	YHiY+vQxdK92Kt3YYBXCJ3HVSa11z4eSI3GODNzdbrlGIBslGouIhN0FJfq28rCNLcxXBF7YFZqwZ
	lRKQ3XNnTAB6S+QVFuCzspiD0avMFfpOX/c6qIX3ekr6E4U3TQ8l/deiYMMSFTob537LmwcocdE6b
	0a2Y7cQbV7l/T+7svm+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM3Rr-006XYM-25;
	Wed, 19 Jul 2023 09:26:19 +0000
Received: from unicorn.mansr.com ([81.2.72.234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM3Ro-006XW0-28
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 09:26:18 +0000
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:1::3])
	by unicorn.mansr.com (Postfix) with ESMTPS id 819F615360;
	Wed, 19 Jul 2023 10:26:09 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
	id 735E4219B40; Wed, 19 Jul 2023 10:26:09 +0100 (BST)
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
	<yw1x351mznr0.fsf@mansr.com> <20230717183645.32ef90b0@xps-13>
	<yw1xy1jdxqot.fsf@mansr.com> <20230719102153.2ef93cfe@xps-13>
Date: Wed, 19 Jul 2023 10:26:09 +0100
In-Reply-To: <20230719102153.2ef93cfe@xps-13> (Miquel Raynal's message of
	"Wed, 19 Jul 2023 10:21:53 +0200")
Message-ID: <yw1xttu0xnf2.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_022616_849617_D7E038A9 
X-CRM114-Status: GOOD (  26.66  )
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

> Hi M=E5ns,
>
> mans@mansr.com wrote on Tue, 18 Jul 2023 15:03:14 +0100:
>
>> Miquel Raynal <miquel.raynal@bootlin.com> writes:
>> =

>> > Hi M=E5ns,
>> >
>> > mans@mansr.com wrote on Mon, 17 Jul 2023 14:11:31 +0100:
>> >  =

>> >> Miquel Raynal <miquel.raynal@bootlin.com> writes:
>> >>   =

>> >> > So, I should have done that earlier but, could you please slow the
>> >> > whole operation down, just to see if there is something wrong with =
the
>> >> > timings or if we should look in another direction.
>> >> >
>> >> > Maybe you could add a boolean to flag if the last CMD was a
>> >> > READCACHESEQ, READCACHESTART or READCACHEEND, and if the flag is
>> >> > true, please get the jiffies before and after each waitrdy and
>> >> > delay_ns. Finally, please print the expected delay and the actual o=
ne
>> >> > and compare to see if something was too fast compared to what we
>> >> > expected.    =

>> >> =

>> >> Between which points exactly should the delay be measured?  Also, the=
re
>> >> is no command called READCACHESTART.  Did you mean READSTART or
>> >> something else?  =

>> >
>> > Yeah, whatever command is specific to sequential cache reads:
>> > https://elixir.bootlin.com/linux/latest/source/drivers/mtd/nand/raw/na=
nd_base.c#L1218
>> > https://elixir.bootlin.com/linux/latest/source/drivers/mtd/nand/raw/na=
nd_base.c#L1228  =

>> =

>> I'm still not sure what exactly you want to me measure.  The waitrdy and
>> ndelay combined, each separately, or something else?
>> =

>
> I would like to know, how much time we spend waiting in both cases.

Which "both" cases?

> Is there something wrong with the "wait ready"? As we cannot observe
> the timings with a scope, because we are using a "soft" controller
> implementation somehow, we can easily measure how much time we spend
> in each operation by measuring the time before and after.
>
> These information are only useful when we are doing operations related
> to sequential reads.

I have hooked up some spare GPIOs to a scope, which should be more
accurate (nanosecond) than software timestamps.  All I need to know is
what to measure and what to look for in those measurements.

-- =

M=E5ns Rullg=E5rd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
