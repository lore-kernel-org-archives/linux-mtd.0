Return-Path: <SRS0=SIcx=WK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284F4C433FF
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 23:51:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED1B0205F4
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 23:51:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ktfehjMh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED1B0205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgpR4LxD7g7V+MdzwDF1vvqNiAIkjXER4muIdTpUSzc=; b=ktfehjMhGqs2Av
	/3h0819awtG0cNGKK1Xc0BjoP2DpSZqQRNM1RQoFgCyRxEfFC15hJSV/lk5oQmpxwt72N+7JdDGkZ
	zmpRzfSaJ+9it8NenH4QtrOIapmk5g7CXt2ORwFRy5tGSFPaZTKc/p6ulhhUMKpM5iDLqI1jiVOQ4
	DdvCvO5jgmpDXqNOo81nkC1nU7vBgMvn8JCjJDDtFYzM2Jsio6JBpWCfWnxkxrOUMI9jg+RefLqi9
	e/ARM1joX1JwZ9pyOkcUVvh41NeQCppgAvgTiVs2ZvlvMzcEG6qwmNtkhyMtScpqKpT9IwsOndKhE
	FlL4YEEnADdXpg3pK9xQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hy33D-00051P-UF; Wed, 14 Aug 2019 23:51:31 +0000
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hy339-0004zS-Dl
 for linux-mtd@lists.infradead.org; Wed, 14 Aug 2019 23:51:30 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hy336-0001xE-6O; Wed, 14 Aug 2019 23:51:24 +0000
Date: Thu, 15 Aug 2019 00:51:24 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 05/11] quota: Allow to pass quotactl a mountpoint
Message-ID: <20190814235124.GY1131@ZenIV.linux.org.uk>
References: <20190814121834.13983-1-s.hauer@pengutronix.de>
 <20190814121834.13983-6-s.hauer@pengutronix.de>
 <20190814233632.GW1131@ZenIV.linux.org.uk>
 <20190814233946.GX1131@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814233946.GX1131@ZenIV.linux.org.uk>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_165127_459301_57063F1C 
X-CRM114-Status: GOOD (  10.11  )
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

On Thu, Aug 15, 2019 at 12:39:46AM +0100, Al Viro wrote:
> > 1) introduction of EXPORT_SYMBOL_GPL garbage
> > 2) aforementioned garbage on something that doesn't need to be exported
> > 3) *way* too easily abused - get_super() is, at least, not tempting to
> > play with in random code.  This one is, and it's too low-level to
> > allow.
> 
> ... and this is a crap userland API.
> 
> *IF* you want mountpoint-based variants of quotactl() commands, by all means,
> add those.  Do not overload the old ones.  And for path-based you don't
> need to mess with superblock references - just keep the struct path until
> the end.  That will keep the superblock alive and active just fine.

	To clarify: I suggest something like #define Q_PATH     0x400000
with users passing something like QCMD(Q_QUOTAON | Q_PATH, ...) instead
of QCMD(Q_QUOTAON, ...) to get a path-based behaviour.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
