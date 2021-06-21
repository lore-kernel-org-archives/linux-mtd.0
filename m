Return-Path: <SRS0=qKgU=LP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF13C48BE5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jun 2021 08:55:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1DD61164
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jun 2021 08:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC1DD61164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbIxbamsJVgBMqqMtUTI03oYH9FgScPkbdrL2uk/qB8=; b=RE/9Lxj4YSZj/8
	3YeAJkuZ0Qb5XU6nJga+G2YMl0mg9UiOMkBOHr1gS1UFpkzSbrj/oF/5jnFlW7f11SgF6u1VsSRUL
	gOlpb/QcMeSRBD2H5X3ASc00pNXp5nVm8wWVq8U1SWnlrV8DGK378Eu+0MaCM01ROAgy86XYZIO2A
	Lg+eVbW9wZfpPGuvPcEOYzqbNPP7vDkYO1cuVCbNKm/jYiWrFS78X3A3/crgL0RzwGG+vfp6TrnTB
	zeqObmWFcWA2/2dAh6IgRhIFFuZ3qMVrvTea4RG7j2U/K3KOOYpZAT1KIWLjVRmJFWcaXg1jc3unu
	2oooYKDMBRNzJZrLF+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvFhQ-002m0i-GO; Mon, 21 Jun 2021 08:54:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvFhN-002m00-TB
 for linux-mtd@lists.infradead.org; Mon, 21 Jun 2021 08:54:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2964060724;
 Mon, 21 Jun 2021 08:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1624265668;
 bh=VcbXkDe9DOW5t++lY6Mh89RpWsDOFcnF5LaCm5CLVu8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xmzMcAcftuSuGmVHxWPyg82c8VgqbVJWe/R2fZFNNlpRxtGwcDY9wLgnE+F1a0iWQ
 ygf32c0yBJb1/3S4EYAXdGCCAmYhbrV0VZ+x59xsXGZsjoBsiR/He9x4b9V+/nMvbN
 JX2eRKEvBqPPPBp+I/qA1cmpLoQAu7q4l4PxgwKw=
Date: Mon, 21 Jun 2021 10:54:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Hillf Danton <hdanton@sina.com>, hch@infradead.org, axboe@kernel.dk,
 desmondcheongzx@gmail.com, linux-block@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, richard@nod.at,
 Shuah Khan <skhan@linuxfoundation.org>,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com, vigneshr@ti.com
Subject: Re: [PATCH v2] block: genhd: don't call probe function with
 major_names_lock held
Message-ID: <YNBTwhbJ/uiE8iZe@kroah.com>
References: <f790f8fb-5758-ea4e-a527-0ee4af82dd44@i-love.sakura.ne.jp>
 <YM2STfTN5AupWlSa@kroah.com>
 <20210620024403.820-1-hdanton@sina.com>
 <24b7c3a9-e10a-f983-9fde-1ae66b0bc6b0@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24b7c3a9-e10a-f983-9fde-1ae66b0bc6b0@i-love.sakura.ne.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_015430_000665_2D6A9BA8 
X-CRM114-Status: GOOD (  17.83  )
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

On Sun, Jun 20, 2021 at 10:54:20PM +0900, Tetsuo Handa wrote:
> On 2021/06/20 11:44, Hillf Danton wrote:
> > Good craft in regard to triggering the ABBA deadlock, but curious why not
> > move unregister_blkdev out of and before loop_ctl_mutex, given it will also
> > serialise with the prober.
> > 
> 
> Well, something like this untested diff?
> 
> Call unregister_blkdev() as soon as __exit function starts, for calling
> probe function after cleanup started will be unexpected for __exit function.
> 
> Keep probe function no-op until __init function ends, for probe function
> might be called as soon as __register_blkdev() succeeded but calling probe
> function before setup completes will be unexpected for __init function.
> 
>  drivers/block/ataflop.c |    6 +++++-
>  drivers/block/brd.c     |    8 ++++++--
>  drivers/block/floppy.c  |    4 ++++
>  drivers/block/loop.c    |    4 ++--
>  drivers/ide/ide-probe.c |    8 +++++++-
>  drivers/md/md.c         |    5 +++++
>  drivers/scsi/sd.c       |   10 +---------
>  7 files changed, 30 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/block/ataflop.c b/drivers/block/ataflop.c
> index d601e49f80e0..3681e8c493b1 100644
> --- a/drivers/block/ataflop.c
> +++ b/drivers/block/ataflop.c
> @@ -1995,6 +1995,7 @@ static int ataflop_alloc_disk(unsigned int drive, unsigned int type)
>  }
>  
>  static DEFINE_MUTEX(ataflop_probe_lock);
> +static bool module_initialize_completed;

This is almost always wrong.

>  
>  static void ataflop_probe(dev_t dev)
>  {
> @@ -2006,6 +2007,8 @@ static void ataflop_probe(dev_t dev)
>  
>  	if (drive >= FD_MAX_UNITS || type >= NUM_DISK_MINORS)
>  		return;
> +	if (!module_initialize_completed)
> +		return;

This is not correct, when you register a callback structure, it can be
instantly called.  Do not expect it to be delayed until later.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
