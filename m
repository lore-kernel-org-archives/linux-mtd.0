Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C3A107BCCD
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 16:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KW7mnB2uHtWVf0qG0m8xkePWSkKyviSWy/3zt4NGrhY=; b=tXOmP9iUCK0ThY
	So7pHFyhBEryZejj5Su+6fsrV2O1nFQY11zzQg+NrtfSTJr+jJgXBBW3LU8GAf77T/ZEcyEN8A4sh
	zxDjx2OMwE7o6BIyioNAzTIZg4AqqRG5wJVu9PXWqQhq7tCkj0lj4T7yKwPx313wL1zew+U4KIWpi
	To7kCjJkwGsGiciyc6y6hoOB8Xgj3hj4sMY1d22nWg4QUab7nByZk8+/FZ5CrIk3tcyjtVBAKREE5
	ztCv4x2o0wIxcAM4TB7fEfQK7Tx/Go0mh1cTRTb+SM0lt5GrAlB0q/unPAafXGmhT9uurq8VavpeE
	CIWO3Wjao78yFfojH1hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15b4-00000000g30-0s1u;
	Fri, 13 Mar 2026 16:42:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15b1-00000000g2U-2Lfc
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 16:42:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A5E743F4B;
	Fri, 13 Mar 2026 16:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF058C19421;
	Fri, 13 Mar 2026 16:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773420162;
	bh=09Ci0Y9641G9OyE4XgSfCRFKwWB1Kd/TQzyDle5h1CM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LcMPmwJCfydNgFaiUDoE6XPGYiE+1ROum4NRFMauuZaFAgl56RyPIsmSqMbPt3NyU
	 oECgPUlKXXwP0KfPTlwHUfXRJIJwJ3DUKR3IgTsw9gx5NLNPeVs/Dg44+epwUucm6s
	 ENKqHocVxkti3nR9tnbvqewpAwuTH7xiBIpbjiWskigg/CQ8fqMWw/OuRS3cLnt4Ng
	 qQ/JY1IQefm+tPlxdsN7cpVNR6ROpLskbV0fqnG/ufwagKemnlqv3NcT0gtQNoQ0Gl
	 NAD/MSBzEcGhCycDiUFJe13o/bQzz4RFdwPm+uLm3Y1uHI2YEgoxWGNhj9WDUvpntu
	 aV0wVbf+o45hg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <michael@walle.cc>,
  <linux-mtd@lists.infradead.org>,  Jakub Czapiga <czapiga@google.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix RDCR controller capability core
 check
In-Reply-To: <87ms0bkdby.fsf@bootlin.com> (Miquel Raynal's message of "Fri, 13
	Mar 2026 15:34:41 +0100")
References: <20260108121430.1096844-1-miquel.raynal@bootlin.com>
	<873429oxwf.fsf@bootlin.com> <2vxz4imkf0hx.fsf@kernel.org>
	<87ms0bkdby.fsf@bootlin.com>
Date: Fri, 13 Mar 2026 16:42:38 +0000
Message-ID: <2vxzwlzfd6kh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_094243_614625_A7C15E34 
X-CRM114-Status: GOOD (  13.56  )
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

On Fri, Mar 13 2026, Miquel Raynal wrote:

> On 13/03/2026 at 11:10:50 GMT, Pratyush Yadav <pratyush@kernel.org> wrote:
>
>> On Mon, Mar 09 2026, Miquel Raynal wrote:
[...]
>>>
>>> These two patches are fixes which need to get in, I'd like to pick them
>>> for the next fixes MTD PR that I am preparing, but I was expecting some
>>> kind of acknowledgement on it.
>>
>> With Tudor's suggestions:
>>
>> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>>
>> I am going through the SPI NOR patch backlog. Since you plan to take
>> these directly via mtd/fixes, I'll not queue these.
>
> I was too busy this week to follow-up, but indeed I might just apply
> with the suggestions from Tudor if I'm able to send a fixes PR by
> Saturday, otherwise I'll go for the normal route and submit a v2. Patch
> 2 however is not eligible for -fixes, it clearly is an enhancement that
> is not a bug fix or whatever, so you can take it when I send a v2
> through SPI NOR next, as AFAIR it will not conflict with patch 1.

Sounds good.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
