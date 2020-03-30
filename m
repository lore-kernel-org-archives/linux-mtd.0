Return-Path: <SRS0=se+M=5P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89117C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 13:52:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BC3F206CC
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 13:52:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZEMkBdaJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BC3F206CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jf2+upx1VrU6eIoeecR/7ZGSSfMh8PeE1fFUirLjl4Y=; b=ZEMkBdaJrpxJn7
	5ZO2QuqRYJK8pkYJdkvJD5d49OTlgAIr3bt1kdCweqJJMysleTvJTrc4YCdas0H3a1g7+sKMjvQgu
	2A/ShGZM0WqwPp9yCetD8ODmT3lynZo5+p366gFBsviiNjllscqfKZ7SfqGZSjrsBkkBOArVfw+4o
	Jfs506zln1QZPQN2hOSkXuJXau7vM2li1Z/qMgu+ilEDCamuVh+L1Xv9Z6iv287Zn7REqklaPOnLR
	VYwYtjtTeLqd9oz7jld3k+BbAfRLx3HLLNmIaR+LW50f0J4/9mvZx64J9y3vvxsOVbGNcCQZdK/CL
	WF6HkE5vYnjtAKy6yfJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIuq8-0004NW-3X; Mon, 30 Mar 2020 13:52:32 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIuq4-0004Mp-QH
 for linux-mtd@lists.infradead.org; Mon, 30 Mar 2020 13:52:30 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C14F520009;
 Mon, 30 Mar 2020 13:52:24 +0000 (UTC)
Date: Mon, 30 Mar 2020 15:52:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiaoming Ni <nixiaoming@huawei.com>
Subject: Re: [PATCH v3] mtd:fix cache_state to avoid writing to bad blocks
 repeatedly
Message-ID: <20200330155222.20359293@xps13>
In-Reply-To: <1585575925-84017-1-git-send-email-nixiaoming@huawei.com>
References: <1585575925-84017-1-git-send-email-nixiaoming@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_065228_987964_D3D8B269 
X-CRM114-Status: GOOD (  10.44  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: wangle6@huawei.com, vigneshr@ti.com, richard@nod.at, houtao1@huawei.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 zhangweimin12@huawei.com, gregkh@linuxfoundation.org, stable@kernel.org,
 yebin10@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Xiaoming,

Xiaoming Ni <nixiaoming@huawei.com> wrote on Mon, 30 Mar 2020 21:45:25
+0800:

> The function call process is as follows:
> 	mtd_blktrans_work()
> 	  while (1)
> 	    do_blktrans_request()
> 	      mtdblock_writesect()
> 	        do_cached_write()
> 	          write_cached_data() /*if cache_state is STATE_DIRTY*/
> 	            erase_write()
> 
> write_cached_data() returns failure without modifying cache_state
> and cache_offset. So when do_cached_write() is called again,
> write_cached_data() will be called again to perform erase_write()
> on the same cache_offset.
> 
> But if this cache_offset points to a bad block, erase_write() will
> always return -EIO. Writing to this mtdblk is equivalent to losing
> the current data, and repeatedly writing to the bad block.
> 
> Repeatedly writing a bad block has no real benefits,
> but brings some negative effects:
> 1 Lost subsequent data
> 2 Loss of flash device life
> 3 erase_write() bad blocks are very time-consuming. For example:
> 	the function do_erase_oneblock() in chips/cfi_cmdset_0020.c or
> 	chips/cfi_cmdset_0002.c may take more than 20 seconds to return
> 
> Therefore, when erase_write() returns -EIO in write_cached_data(),
> clear cache_state to avoid writing to bad blocks repeatedly.
> 
> Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: stable@vger.kernel.org

Still missing:
* Fixes: tag
* Wrong title prefix

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
