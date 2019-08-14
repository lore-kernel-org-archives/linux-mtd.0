Return-Path: <SRS0=SIcx=WK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA89C433FF
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 23:36:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0A0F208C2
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 23:36:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NnETTmDV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0A0F208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+PfrvYYDlUYKqCoeNs3O6ccvzZhQv3wQneLvXf8Waw=; b=NnETTmDVhd1+Qp
	QArVborAMxW66UoqCssOQIq1WNmhHYzLwEOQKP+Gv7eDXtjC4KzKOdx3/Os8vU4I0yLuBkSgA0yYU
	vJ3wlh2YEyQkEbLw7Y3FqNuA58/rGGvd4XvmDpiXniMX6xrNbAcG7gifocbSi0Ydrel8H4imyaMCb
	cQY+Zn0p0rP9U6UZ6Nny/YQfxKllYM7fWg8SnahpSOLP/IRklyDr4suwPVJSAutrXKKypBSf6zUOv
	suMJi2huHQExmQjsk7tbCo+qPkPngBDzAqYzlojcP16tvTff4OEhht5utiHYF1cngxxY01podboVq
	ZdprkoOzHupNPWVxsVUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hy2oD-0001LU-48; Wed, 14 Aug 2019 23:36:01 +0000
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hy2oA-0001Ku-Cz
 for linux-mtd@lists.infradead.org; Wed, 14 Aug 2019 23:35:59 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hy2o8-0001eY-8P; Wed, 14 Aug 2019 23:35:56 +0000
Date: Thu, 15 Aug 2019 00:35:56 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 04/11] fs, quota: introduce wait_super_thawed() to wait
 until a superblock is thawed
Message-ID: <20190814233556.GV1131@ZenIV.linux.org.uk>
References: <20190814121834.13983-1-s.hauer@pengutronix.de>
 <20190814121834.13983-5-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814121834.13983-5-s.hauer@pengutronix.de>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_163558_436638_3308BEB8 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Aug 14, 2019 at 02:18:27PM +0200, Sascha Hauer wrote:
> quota uses three different functions to get a superblock from a
> block_device. Instead, retrieve the superblock always with get_super()
> and introduce wait_super_thawed() which is then used to wait until the
> superblock is thawed. This way the code can better be shared with the
> code introduced in the next step: We want to add quota support for
> filesystems without a block_device, so here functions around a
> block_device can't be used.

> + *	wait_super_thawed - wait for a superblock being thawed
> + *	@sb: superblock to wait for
> + *	@excl: if true, get s_umount semaphore exclusively
> + *
> + * Wait until the superblock is thawed. s_umount semaphore must be released on
> + * entry and will be held when returning.
> + */

Never expose anything like that - if locking rules depend upon the flags,
it MUST NOT be anything beyond a static helper.  I'm serious - that kind
of stuff ends up with trouble again and again.  Just don't.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
