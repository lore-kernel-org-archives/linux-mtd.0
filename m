Return-Path: <SRS0=I5Ka=MI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB5EC07E95
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 15:42:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA2C0613F9
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 15:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA2C0613F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qKLmL8LGDe0drcbVeS1qumvbDDACKu/f6/hkK5WdCw=; b=1SDJ3zTndemnp6
	EQHL4mqAroX8pKqnr+jXx4+zRdYBvtqPH/sjlXc2zRuuNRTY3lshZonoTbN57sWNIsjwdi0GL1woT
	wEz7X3hB9eC0hWEjN9HPQTakRs+BjW6nVyx2yLjPQ7yjpXdJZsCaWVNhuluIEcz1+jeZ7CcagK/oA
	tvsyRPRkERYNuMbmSGv4ypNNV+gVGAeUGqlW4upJJPnC4FYql6QCyzb+ULmmxiXDlD8kvOxWjvZ7K
	EWPgSbCtD2tOkwzG6yexBb7DTQf3j9aEvOt2LnyAjqvF23XYAHHh4YXCUvcbGR5rJyEfKft0DwQPQ
	e5ehjF+8oMaAGzo8WaFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4Pxk-004lB4-8o; Fri, 16 Jul 2021 15:41:16 +0000
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4Pxh-004l9n-9j
 for linux-mtd@lists.infradead.org; Fri, 16 Jul 2021 15:41:14 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id DED222B0114C;
 Fri, 16 Jul 2021 11:41:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 16 Jul 2021 11:41:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=7rpQy7cK945KPDHB9fAMedItGO9
 DCvVgGKwgFBhRTL4=; b=z07LD/Sc4IjJInG0ZyddT+NeYXZ3dZ5loRDMB8xK6rL
 f7qz7CzY4Pd9sswoWVUHkUlKW0EX6cssYVlGoIibTduzKhNdXJ035iw3rZRDEwm0
 7W2BxC7IqhSBWm7d5zMmOCTo1isIpBpgQWIrJOPkTenOd11pIizYfbS+kXlk3TKT
 PHSKNm6beOOfJwK3NetjCnrotG1KkmdrEbsea4j+qIwGO/f/guHM7wgvuYEr0JFz
 phrWqYM0BH5lwq/AuDM3L9e0P35em97uoxHsUUEA9O95VKArBvrOal2Plt8iW0ss
 hX/F/wp3+z9gF0BTsSdG35GwcyQ6D9FYXrnDRkzCGuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7rpQy7
 cK945KPDHB9fAMedItGO9DCvVgGKwgFBhRTL4=; b=QrO/klS2mTNqNvRJpuNlv5
 dDuJdqQxAtU65IHyoz7w53LnDHC+JJwTwYlFIXffXNKIHjY5xq/Ltuz/Bfw1MHte
 Wf1NELZyGydfhbR/o4O/SiesuSHN9OcwnRccItPh3zs/HInoVSAAuC18OUCgAsWR
 2VEzErNdHfuiI9h04TgwBQXhV8PdfTG/yIxatVITm8+P6/cZOOqGYrzRR5VwHJqw
 duvCgiLZRiWvPLLVdnmFQBwvETwBnYPDJfTzDbaklxW+ar2x8g/uTZa4213O6lhZ
 vrbufqyDMTMBvgMtzhIOi+BV7bkJJyg3LZE6Htpk1MemhmxsPeg0Ne8BcbtYtMzw
 ==
X-ME-Sender: <xms:kajxYDs766EKkCxP-7JskpPHTCXyKR1N48CwlkWqk5KZrwbtXtrbNA>
 <xme:kajxYEdWuVTBmU_cIMh2Y7EV23hjL5yIm7Cxh97J5jQrMUWHWw_ehzIToUh-FkxmZ
 df6yOpsJJ3RbA>
X-ME-Received: <xmr:kajxYGzeQakP04serziomrliNRZt9Jy0IQXcbrNe5_WQPDd5QoqufKIiG1X2zCHj6czpWLWCJ75hfRy64Cb9IkrrJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
 jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
 ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
 gtohhm
X-ME-Proxy: <xmx:kajxYCMoVDcKLse0a0_nUhhpd6EyYt1RF_hvc9IywyeEMspbMP_Ivg>
 <xmx:kajxYD9NbMEdwqZNO_ErI4moQ1BYFozPEZE9XmF8xCtyEW3e8yDt8Q>
 <xmx:kajxYCUafgG2ypTbNTje2bQKvcXqsipX8PgNWxJjB5vOMpAJQi9etQ>
 <xmx:kqjxYHW4lakU7lhVITm1gXR-DB3gNvmwV-K4Ix-tlixXyK_jP6wqRGCZEkY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Jul 2021 11:41:04 -0400 (EDT)
Date: Fri, 16 Jul 2021 17:41:01 +0200
From: Greg KH <greg@kroah.com>
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: open list <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>, Sean Nyekjaer <sean@geanix.com>,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>,
 Richard Weinberger <richard@nod.at>
Subject: Re: MTD: How to get actual image size from MTD partition
Message-ID: <YPGojf7hX//Wn5su@kroah.com>
References: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_084113_405731_AE49E51C 
X-CRM114-Status: UNSURE (   8.54  )
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

On Fri, Jul 16, 2021 at 12:12:41PM +0530, Pintu Agarwal wrote:
> Hi,
> 
> Our ARM32 Linux embedded system consists of these:
> * Linux Kernel: 4.14
> * Processor: Qualcomm Arm32 Cortex-A7
> * Storage: NAND 512MB
> * Platform: Simple busybox
> * Filesystem: UBIFS, Squashfs
> * Consists of nand raw partitions, squashfs ubi volumes.
> 
> My requirement:
> To find the checksum of a real image in runtime which is flashed in an
> MTD partition.

Try using the dm-verity module for ensuring that a block device really
is properly signed before mounting it.  That's what it was designed for
and is independent of the block device type.

good luck!

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
