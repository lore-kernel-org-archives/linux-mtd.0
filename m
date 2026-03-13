Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9A6105F7AF
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 14:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+owrgyoXNXg+KclS8qegKqVcbdSnpy4n7tc1dwyGDvg=; b=UMfa4XR11cg/gF
	8JK8lzrzIGfp10wr1hSh5QPTns66JCxG0pA5IUSz4lcdoYDNVROd1lXf3UYY9Nq936VguPu2nECTq
	sfYxGwtmuWQfk7TS5coBryXWeKxTG1e/fGFm39OwVk98UgXK4kylaJfIXCfLoVXhvYv0M7xFR749B
	1fUHlhzdrmV63DQtt1V2xYX+G0yeJ7UPezyYP9A656/+CGAhLYFmbsUl16V47nEoP4vNSviLWWVb+
	8uhEQ0p4Agtk5hSotUH1SLJPmaYWlu87alnSwq/8K/OArVarAjczKNouiu5IV3ljPmUzjk8EqqUvE
	2ZotCoEVd75Yr/g4gBLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13bK-00000000Ow3-3EZH;
	Fri, 13 Mar 2026 14:34:54 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13bH-00000000OvG-0lHn
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 14:34:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2F8554E42664;
	Fri, 13 Mar 2026 14:34:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 049FE60027;
	Fri, 13 Mar 2026 14:34:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 113C210369F2D;
	Fri, 13 Mar 2026 15:34:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773412486; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=t2UqooiJtxGpcfVLLGS3aLsSdKecUfNQ3C62O5U+waA=;
	b=PmptMbwKkZYM7PUXCT2ddcCl2KPuaQR4rwbtlIcyojYxgop4F4MvwboHQmBsB3JXZqyMjb
	0GNTsc1kduRqDhnLxmHreIX9lj+oXwew/AxrUxC/ekipikdIWduPtsuIlRVgVNwOmOQ0NG
	zniHlI8a/UaOjADNHExmtpXGrOMSiPiB6sZI6NWjZ7yRJtxpQFwzX9dDFfnusLTTLl2GzI
	+UMGpbpjfZnrLQ531lx2sIpMYbybbX2xOtTfSyRA24YmPWIZ/sRAkkuGFdUfx2mrt68Imo
	kEURqyCYzuJjjhLmE0JPAeFQmIrHjj7MJ93AHmFZ3BMyXH1BukVZ3ONPVnUFAg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael
 Walle <michael@walle.cc>,  <linux-mtd@lists.infradead.org>,  Jakub Czapiga
 <czapiga@google.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Takahiro Kuwano <takahiro.kuwano@infineon.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix RDCR controller capability core
 check
In-Reply-To: <2vxz4imkf0hx.fsf@kernel.org> (Pratyush Yadav's message of "Fri,
	13 Mar 2026 11:10:50 +0000")
References: <20260108121430.1096844-1-miquel.raynal@bootlin.com>
	<873429oxwf.fsf@bootlin.com> <2vxz4imkf0hx.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 13 Mar 2026 15:34:41 +0100
Message-ID: <87ms0bkdby.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_073451_644457_3683A570 
X-CRM114-Status: GOOD (  19.30  )
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

On 13/03/2026 at 11:10:50 GMT, Pratyush Yadav <pratyush@kernel.org> wrote:

> On Mon, Mar 09 2026, Miquel Raynal wrote:
>
>> Hello SPI NOR folks :-)
>>
>> + Takahiro
>>
>> On 08/01/2026 at 13:14:29 +01, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>>
>>> Commit 5008c3ec3f89 ("mtd: spi-nor: core: Check read CR support") adds a
>>> controller check to make sure the core will not use CR reads on
>>> controllers not supporting them. The approach is valid but the fix is
>>> incorrect. Unfortunately, the author could not catch it, because the
>>> expected behavior was met. The patch indeed drops the RDCR capability,
>>> but it does it for all controllers!
>>>
>>> The issue comes from the use of spi_nor_spimem_check_op() which is an
>>> internal helper dedicated to check page operations, ie. it is only used
>>> for page reads and page programs (despite its generic name).
>>>
>>> This helper looks for the biggest number of address bytes that can be
>>> used for a page operation and tries 4 then 3. It then calls the usual
>>> spi-mem helpers to do the checks. These will always fail because there
>>> is now an inconsistency: the address cycles are forced to 4 (then 3)
>>> bytes, but the bus width during the address cycles rightfully remains 0:
>>> impossible, the operation is invalid.
>>>
>>> The correct check in this case is to directly call spi_mem_supports_op()
>>> which doesn't messes up with the operation content.
>>>
>>> Fixes: 5008c3ec3f89 ("mtd: spi-nor: core: Check read CR support")
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>
>> These two patches are fixes which need to get in, I'd like to pick them
>> for the next fixes MTD PR that I am preparing, but I was expecting some
>> kind of acknowledgement on it.
>
> With Tudor's suggestions:
>
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>
> I am going through the SPI NOR patch backlog. Since you plan to take
> these directly via mtd/fixes, I'll not queue these.

I was too busy this week to follow-up, but indeed I might just apply
with the suggestions from Tudor if I'm able to send a fixes PR by
Saturday, otherwise I'll go for the normal route and submit a v2. Patch
2 however is not eligible for -fixes, it clearly is an enhancement that
is not a bug fix or whatever, so you can take it when I send a v2
through SPI NOR next, as AFAIR it will not conflict with patch 1.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
