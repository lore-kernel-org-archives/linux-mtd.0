Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5A7CCD18D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 15:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCeweTc8Mb3ied31TVCm+AHkS65ktB+LWPtQZCYqzkM=; b=HqTgdDKgo+L1zQ
	VXnwQgHSWXSEqgoMLopyb+d4BoRz4aDxfpcQZsIlFwEQetn1VOM3KAd09gwpJOrnjYayhdcBLDBmc
	D71igdc4BzuriQJRI69MdSSIIPHkp+G5Bjf/Ut5BW+U87UyYuABnAg6hRj5UQPW5c4U+BwriawcJT
	enEi3PmDa+ystqQCbPfldZhHgh6Be99YfsFs4/sYAeSVZlMnKyuNFDtemMW/7bqQgsyiNWrhP8rzO
	FechbK5m+YuE7HJ46Um58w9u9hv/GHwgcwy1PqVk6pEvDw7kCo0qnwo6wjpxhA1+nBm0iNV72h2CE
	zskX3wx/fCHBhUeqm4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8K4O-0000000DYQI-2OjS;
	Mon, 13 Oct 2025 15:02:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8K4L-0000000DYP4-0v0X
	for linux-mtd@lists.infradead.org;
	Mon, 13 Oct 2025 15:02:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DAF02451A1;
	Mon, 13 Oct 2025 15:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA620C4CEE7;
	Mon, 13 Oct 2025 15:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760367756;
	bh=JxQbmtcZMXbYi9Pxba30cych1RS1mZdQmjKfuR/V6kE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m0Plmjqb98bx+7qr2DnUrts3R5tobQV/diMu7wqAPfHmvbPLWpc9aSCjOqOiZ+yIQ
	 1peyIYtbMuQH9q+WMWn9PZcB6jZ/LoLd+zaQv3f/rR5Mb1HgDuuu2Q/mnxfocMISZ9
	 q8wI4OQj7Wpyb4sJGLcYs+4mIIP6cffTxbRxQNIAmTAq4MF4/f+LRKRJk070ymVoD6
	 r61Ka/Q3AtisfELqULV2upVVPArf34cKWaZ3QkueMZ2cRU0614Jd0N585KBv5gfdBU
	 Eqpzu54HBZBgy80oZV+4n4Y/U+83Yk25gl5zJ0L4CrCGYj2itlqiWtw9mdHBrtZnsX
	 jr/uPy7WuZYfA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,
  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.18
In-Reply-To: <87ikgjqha2.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 13
	Oct 2025 11:31:49 +0200")
References: <mafs0ecrvdfl9.fsf@kernel.org> <87ikgjqha2.fsf@bootlin.com>
Date: Mon, 13 Oct 2025 17:02:34 +0200
Message-ID: <mafs0sefmlu9h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_080237_275269_B427968B 
X-CRM114-Status: GOOD (  10.48  )
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

On Mon, Oct 13 2025, Miquel Raynal wrote:

> Hello,
>
> On 24/09/2025 at 17:40:02 +02, Pratyush Yadav <pratyush@kernel.org> wrote:
>
>> Hi Miquel,
>>
>> Here are the SPI NOR changes for v6.18.
>
> I'm sorry I forgot to answer. I indeed pulled it in mtd/next before sending
> the PR to Linus (which was applied already), but I was a bit in a hurry
> before being off for a week.

No worries. I already saw the MTD PR had the SPI NOR changes so all
good. Hope you enjoyed your time off :-)

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
