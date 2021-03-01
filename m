Return-Path: <SRS0=zfSv=H7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F27C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 12:14:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB26D64E31
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 12:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB26D64E31
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W01NNO6iZcjPPQccsQfhd5Yor2A3ibgtUd5lLy67SYo=; b=FJ37NfvUnZsE+ns14yZpJMl5h
	WUq8+YqBaqhKP/7AR8cE9zzZpiV+6yWFO7wa8kPiuTM0lC8cFBsfA27bCg02dZ9j8BMFLVwCprB4w
	fy9OidlHzC/jzkBDQu7HbYw263XKAWx5HYLG2g+hZnY/jLX3s2pxY1C08o4cNBSESy5gwDGjnHfoB
	PCDRzFyg9nE20T+eYfpwVQua8QnV4uny7frXM9/LxTSxOUFkVleR1URUY9hYV5cm1HR6NmHTdCB7Y
	KKwkm3uiC1LW9e24amQ270LHO7IsoECWgHRyStti0xigPJ2enlFn3cu+LF4h07LqMQY4pnfIVL1+G
	kUuNu/r/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGhQX-0002WL-9b; Mon, 01 Mar 2021 12:13:29 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGhQV-0002Vy-D3
 for linux-mtd@lists.infradead.org; Mon, 01 Mar 2021 12:13:28 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614600803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LWX81NIq8f0HTlR41F5ulW5ntyY1umPX6Os1jeLcYFM=;
 b=gc7eXgRA/Xx5chcA0AF7OhdTuhhQSZOlXMDwi64gv4faa+qK6VmoTL261F9SMvxlIAeKrw
 dNTT2UM1I3EwF8Z53er9Q3dLXo4UgBlrF9mW7FMazfDGE9CCF+qFe53tGa/526leU//SCT
 5EdgRfsqvfqwPkp5urITZeZfz/8qr9w=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 659CEADCA;
 Mon,  1 Mar 2021 12:13:23 +0000 (UTC)
Date: Mon, 1 Mar 2021 13:13:22 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH next v3 02/15] mtd: mtdoops: synchronize kmsg_dumper
Message-ID: <YDzaYqrk3Dv37uDa@alley>
References: <20210225202438.28985-1-john.ogness@linutronix.de>
 <20210225202438.28985-3-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210225202438.28985-3-john.ogness@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_071327_556334_88EA305B 
X-CRM114-Status: GOOD (  14.30  )
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
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu 2021-02-25 21:24:25, John Ogness wrote:
> The kmsg_dumper can be called from any context and CPU, possibly
> from multiple CPUs simultaneously. Since the writing of the buffer
> can occur from a later scheduled work queue, the oops buffer must
> be protected against simultaneous dumping.
> 
> Use an atomic bit to mark when the buffer is protected. Release the
> protection in between setting the buffer and the actual writing in
> order for a possible panic (immediate write) to be written during
> the scheduling of a previous oops (delayed write).

Just to be sure. You did not use spin lock to prevent problems
with eventual double unlock in panic(). Do I get it correctly,
please?

> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Anyway, it looks good to me.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
