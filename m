Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF3EC282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 23:07:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F4C021726
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 23:07:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sZu7mdBG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gkea2C5Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F4C021726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sw7ds6BJ+DZJI9kjAjMKmgKyToPABae3gHu1DChFLy0=; b=sZu7mdBGoACkl8
	e5G+ya0kOR0lDV5JADgj1GHd2Gf6vT/SJ4jBHGqxrj2HByDvy3DZy+sjEs9l3VVjHosJly1dLvlqq
	D4Ilbvq/ZEDIFYrEu0oJ6lZhe/rBfLwDXX8onEhU8dW7rOtt7YajEsbsx39uo5zsfopYR1H0OIvZY
	4NsYvpzqbJm2HLdEbimMVlVpNtKcjzCTZ6qG5sHmQA0qrAmIRMMBGKCO0mmOfbGOxGqPCXlrcaSsQ
	xCJeWwv8lCrFw8hHX57fsKnqaBdeVQ2T+GwRDheaPGEquZEnOYBKGSV4qk22m8D8DJeBtrp6C7vHq
	l3/87UDy63nZE15aworg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gm58o-0003PR-BT; Tue, 22 Jan 2019 23:07:34 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gm58g-0003Ol-Sa
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 23:07:28 +0000
Received: by mail-wm1-x343.google.com with SMTP id p6so236410wmc.1
 for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2019 15:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dgr9nKB2ggzdhcJYsf7bbonrKoS23TOX081W2mVZulA=;
 b=Gkea2C5Qh611fDjojh7Rmy/seUBxc1j+phR9mm9Ntx+5OQiark8sKFRVGQrvd6Q6mz
 nECDilhYywBuzGqE3ZAFqEowCDT1R0etWLFVHwMajNBxsWKvnARWMaKqyb2dm3H8N+/e
 fTftIwwgBOlil/IUbkNixbhWGWnUhXBxaARqL9fGUfn21WtETLNz+hSUUn9vtDob/e4e
 U59IdDFPyD8EvMEtqaJVW1FcNOhsxZ8Ik0koZz+zJCeKDk4WrdbMGiN02q5FZgoE6eIa
 hKlKb7AjlhMuV+rAIAs4aLiw2y7PZaqpnjqTqNUn+vCeeUovYlVudCEaNOIUYpGWDMO4
 L/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dgr9nKB2ggzdhcJYsf7bbonrKoS23TOX081W2mVZulA=;
 b=qzD0k78YTYk+A0RpzHSl8IDz3NN28gZnShj4DUGSY1QDHd6eb4lA40Gs7CsN0k3zpf
 mcHikSPBxQq6+AU6f6drigSWFjn5Cijbm3d1vYtxmSZzyC66/5IR0XAvpwZfM0Nn7ONN
 xZWwbjRgEdee54jtD0W0iHVfgNK0STkOJtkFn1c+KI3XTjh11UQDdhKdbor6b7umGyWO
 9o7iAzE3JRTUrRZL/9xw2K4b3ZtrQ4h0MvcFuN8lBlMMRpkJtArObuhxRxh3zIo9Fn+B
 vKhVqyf9/BMG6NQBbivS9QcTq2dRCeRugx+sKAaP7W4II2nz1UjYOaDnsleu0mGueWRO
 BZQg==
X-Gm-Message-State: AJcUukcJQVXMTM+9aeW2Oh5S9AvUTOrRHTY/K++JAgqwLGePn3aSd3n4
 xBZKmuyNvxCWpJnFVBJ+Wuwa/4IjdgdPIRzvLp0=
X-Google-Smtp-Source: ALg8bN4Iu+99oEFrjUNshJRc47VAgR1OZom3QObQYLYfxIIjZQo3IQvwYUgt5a5gzAI+Vas0alCwZ21AXqSXdCMYHOQ=
X-Received: by 2002:a7b:ce8e:: with SMTP id q14mr396410wmj.10.1548198444592;
 Tue, 22 Jan 2019 15:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20190110114448.vcx6w76ibmxwvlh3@pengutronix.de>
In-Reply-To: <20190110114448.vcx6w76ibmxwvlh3@pengutronix.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 23 Jan 2019 00:07:12 +0100
Message-ID: <CAFLxGvyrNaq6ya9TNr-tdEEbV=qsi8qEko6R7oJ-DtkxPJMk0g@mail.gmail.com>
Subject: Re: UBIFS quota support
To: Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_150726_925422_7F5AC976 
X-CRM114-Status: GOOD (  16.76  )
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
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jan 10, 2019 at 12:45 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> Hi all,
>
> I'm currently working on resurrecting the UBIFS quota patches posted back in
> 2015 by Dongsheng Yang, last posted here:
>
> http://lists.infradead.org/pipermail/linux-mtd/2015-September/061812.html
>
> First of all I think work stopped there, there is no newer UBIFS quota
> support I am missing, right?
>
> One problem with this series was that the quotactl systemcall expects a
> path to a block device. UBIFS doesn't work on a block device but on a
> character device instead.
> The solution in this series was to pass the path to the cdev in
> quotactl.  A struct cdev * member was added to struct super_block which
> was used to identify the superblock for a given cdev. This approach was
> rejected by Christoph ("I don't think the cdev has any business in core
> VFS code.").  Apart from that UBIFS can not only be mounted with a path
> to the character device (mount -t ubifs /dev/ubix_y /mnt) but also in
> the form ubix:volname (mount -t ubifs ubix:volname /mnt) in which case
> userspace doesn't have any valid path it could pass in quotactl.
>
> An idea out of this would be to allow to pass the mountpoint instead of
> the path to the block device in quotactl which would work with nfs or
> even tmpfs aswell. Would that be acceptable? Any other ideas?

*kind ping*

Jan, another thing Sascha and I are not sure about, what are the consistency
constraints of the quota file?
If I read the code correctly, quota just writes to the quota file and
assumes that
the file system makes sure about consistency. Either by fsck fixing the quota
file or having a data journal for the quota file.
In case of UBIFS where we have a data journal this should be doable.
Is it okay when the quota file has S_SYNC set?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
