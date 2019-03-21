Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E800C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 21:44:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B1B521916
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 21:44:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iGZngIAz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B1B521916
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4N072E8uOASs9glVNuD9PwG8xnI3Ek+DeOWjLueH0A=; b=iGZngIAzkz9FtJ
	ibFEjzl1iX9VpmuU6wjNPWlSMnOeEm0kjcO0wMFmS/Ud4cIKpx4ch2SN3KdEsIm09lXuuMpKZyGMy
	qfrmaAOd8xH4nILwyCgVde/fPKVk0AgGuPH+15B3LO/BlUTtMUJIZc1ZsuE6o5dUC8tI4v8qm263i
	iFI5gwmllO2JIN2h1zSJ8B9aZYGFPKvjEaV36RTJhO0kS1PBnQxP625nXF/nhhvvyKo39qY+urqTP
	mfbjJbAsqBhZnhZvPIIND9P+R/ElHsSonjrFSIa9j/UnFFUowjfjOCur25edlRjh5d6xz0UlXqImt
	Gzty1m2zq9m8xB8z5naQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h75Tv-0002pe-D9; Thu, 21 Mar 2019 21:44:11 +0000
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h75Tm-0002fY-4W; Thu, 21 Mar 2019 21:44:02 +0000
Date: Thu, 21 Mar 2019 14:44:01 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: 32-bit Amlogic (ARM) SoC: kernel BUG in kfree()
Message-ID: <20190321214401.GC19508@bombadil.infradead.org>
References: <CAFBinCBOX8HyY-UocsVQvsnTr4XWXyE9oU+f2xhO1=JU0i_9ow@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCBOX8HyY-UocsVQvsnTr4XWXyE9oU+f2xhO1=JU0i_9ow@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mhocko@suse.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 rppt@linux.ibm.com, linux-mm@kvack.org, liang.yang@amlogic.com,
 linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
 akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Mar 21, 2019 at 09:17:34PM +0100, Martin Blumenstingl wrote:
> Hello,
> 
> I am experiencing the following crash:
>   ------------[ cut here ]------------
>   kernel BUG at mm/slub.c:3950!

        if (unlikely(!PageSlab(page))) {
                BUG_ON(!PageCompound(page));

You called kfree() on the address of a page which wasn't allocated by slab.

> I have traced this crash to the kfree() in meson_nfc_read_buf().
> my observation is as follows:
> - meson_nfc_read_buf() is called 7 times without any crash, the
> kzalloc() call returns 0xe9e6c600 (virtual address) / 0x29e6c600
> (physical address)
> - the eight time meson_nfc_read_buf() is called kzalloc() call returns
> 0xee39a38b (virtual address) / 0x2e39a38b (physical address) and the
> final kfree() crashes
> - changing the size in the kzalloc() call from PER_INFO_BYTE (= 8) to
> PAGE_SIZE works around that crash

I suspect you're doing something which corrupts memory.  Overrunning
the end of your allocation or something similar.  Have you tried KASAN
or even the various slab debugging (eg redzones)?


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
