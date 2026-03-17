Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AF9FED9EA
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 16:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3qT/x+z5vnDU2LZQ7/NKMJcKn1CKE8vFg/eiLdYwnQ=; b=qYp2jjdEn6d1AE
	STm1HF2PcUQC6sP/X1hQw8aLDrV/LcwAkp8pLiOJxCLcLewTexDJJSFF3dxlItc9fGIER+bQgXa4A
	xKEZKfwyPtWAeuTvLcf2OcPa56EvnrcrFHzQkBAZ8fW6lZusia/76Z9JlluAq953eJcofvNWRkxO7
	3eKS3FX4L0LpOPTk2YEdLe/u8uBlimLbjTc4iM0ERc+/H2EnHwf/pNDt6Eag7ynSeqNyE4M9krBtd
	OvuoydjF5KQ9RqsDh10lFICQstypOMy7JSDTCDkx+ama+NwtV911xsWHs2htNbKpX4AmKHMJfSqix
	m0WabIwrJeRE8MdARCEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2X2u-00000006nKF-2TCk;
	Tue, 17 Mar 2026 16:13:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2X2s-00000006nJu-1UPg
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 16:13:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00E8640C53;
	Tue, 17 Mar 2026 16:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC07C4CEF7;
	Tue, 17 Mar 2026 16:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773764005;
	bh=TJ/uBwGyyuhsKdxBpk0aU+86Leo1zCjq0Xh5N0XwMvM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TD+dBaznSVwHJS3rEwvZFG2utKJDd1RbmxwRmsorxR+RnU6rPrAY/+0ndFWzSFKrb
	 hNfFxPDy0tHPEw6T5NfM/Nnv7fpdFTppJds+5AKIfNgW98WvrVIPLddMEOxTk5q2WS
	 xHDgCQUbFaKt/kAbKkQ9ahccSU/CfZk0VaU5/SxAnIkzg96DpQr96j8GL2dgEkP2J3
	 hZSjwKkAZNZv91xLBXOOqog3aDtu4J+zh5iLQVnWBjwBOkR/R12TiCd/S2m488Mgsj
	 8rAe00z/p/1KCimoAdwhQ8jjSleRmvYp7NdCx0Q9zgaQYPTmjmWAX937v33Eg8Wj33
	 1tMSspHPNngpQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Michael Walle
 <michael@walle.cc>,  <linux-mtd@lists.infradead.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Rename spi_nor_spimem_check_op()
In-Reply-To: <87bjgmegmz.fsf@bootlin.com> (Miquel Raynal's message of "Tue, 17
	Mar 2026 14:21:08 +0100")
References: <20260317102115.321807-1-miquel.raynal@bootlin.com>
	<2vxzjyvad97q.fsf@kernel.org> <87bjgmegmz.fsf@bootlin.com>
Date: Tue, 17 Mar 2026 16:13:22 +0000
Message-ID: <2vxzbjgmcu3h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_091326_435877_24E3DD00 
X-CRM114-Status: GOOD (  12.20  )
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

On Tue, Mar 17 2026, Miquel Raynal wrote:

> On 17/03/2026 at 10:46:49 GMT, Pratyush Yadav <pratyush@kernel.org> wrote:
>
>> On Tue, Mar 17 2026, Miquel Raynal wrote:
>>
>>> This helper really is just a little helper for internal purposes, and is
>>> I/O operation oriented, despite its name. It has already been misused
>>> in commit 5008c3ec3f89 ("mtd: spi-nor: core: Check read CR support"), so
>>> rename it to clarify its purpose: it is only useful for reads and page
>>> programs.
>>>
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>
>> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>>
>> This one is tricky. It won't compile without "mtd: spi-nor: Fix RDCR
>> controller capability core check". So to take it through spi-nor/next, I
>> would need to rebase the branch on the -rc in which the RDCR patch [0]
>> lands.
>
> I forgot it was only applicable after the other patch. In general, you
> are welcome to directly merge the relevant -rc in spi-nor/next, no need
> for mtd/next to be based on it too. But for this specific case, if you
> agree I will take it through the fixes branch directly. They are related
> anyway (after renaming it _read_pp_op() as suggested by Tudor).

Sure, fine by me. Makes life easier for the both of us.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
