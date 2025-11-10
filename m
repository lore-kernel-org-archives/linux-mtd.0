Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2731FCCFA13
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Nov 2025 16:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKJXBqORq7qS4IZGN4I9wURM9LkS2d4lIyg3GQwa3IE=; b=hPERD7CB6cg8RT
	X1lzCjmQ0zwjjcrKCR5muAIZUbVnFGIoQzzMI9bQfCaI8Unp41K9EQ0xU0YxEtVTZ7UNvBROAgjH8
	N8w0hwROFKE2VEY1NAQapdur1iofWZMU3PpKRamnWHNofjROu2MA/baN37EJVFGNhRid95X2Ibxwt
	qa7hoJqrdMOSWuKH5Wtmr6mIkticMEPUBKr1b2ypbp+T6ZIyj+P2wjnNtmUSu54PSn1ftLA+C9ijI
	lUN5xQySurgnu7nVGOaecarrD1yNTvmjeM9TIJUN4cFqzeaIiOkjWFrNZXXJXz0SWnr3JO+6PR3Tr
	JRCxAHE1681+eqBAwvQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUtD-00000005oAx-41bE;
	Mon, 10 Nov 2025 16:37:11 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUt7-00000005o3Z-3969
	for linux-mtd@lists.infradead.org;
	Mon, 10 Nov 2025 16:37:09 +0000
Message-ID: <76896942-0f84-47d0-90ca-7bfc5d39318c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762792601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P+P7K+rz0Ws/ScnZWiTNIBElASi6e33VQ2WL92YsmHM=;
	b=aZDpW1Rc7Ox8OUMVxRfBV2n7iIwaFCOTeIgUYRm3px8cVyQGd9a1anbO4V2kjPTBssfN/W
	/cYMhiR8uPV0c+kKOjL76dp82ahwxOgJl1sxHQxy4EL/PBmaO6cV0HRkBRw6H+Wk6pGc/C
	VO8EIEQF8c8iuyGTBo4W2gwM84TXMS4=
Date: Mon, 10 Nov 2025 11:36:37 -0500
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
 <mafs0ecreontu.fsf@kernel.org>
 <4888cefa-e8be-4f0d-9d4a-c82f9ff6cda0@linux.dev>
 <mafs05xcpo9sz.fsf@kernel.org>
 <26a795ac-e6ff-4363-a8b9-38793a9be794@linux.dev>
 <mafs0ikgnn07u.fsf@kernel.org>
 <d00d42ce-4262-4736-8c73-5d2544e86d33@linux.dev>
 <33cbbac1-c247-4644-b555-998eea6e8305@linaro.org>
 <92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev>
 <31d01667-e80e-423c-bdab-8d05831d575d@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <31d01667-e80e-423c-bdab-8d05831d575d@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_083706_319254_FA65CACB 
X-CRM114-Status: UNSURE (   7.30  )
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

On 11/10/25 02:08, Tudor Ambarus wrote:
> 
> The locking tests look fine to me:
> 
> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> Sean, if you care you can extend the documentation on how to test locking.

I'll take a look.

> Also, you may drop the non SFDP data from the flash's static definition as
> a follow up patch.

I don't understand what you mean by "non SFDP data".

--Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
