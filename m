Return-Path: <SRS0=SIcx=WK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250EFC32753
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 23:36:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9DC02084D
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 23:36:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eyxZOx9/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9DC02084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDbcJk1J7h6+ZvcvRCAQVY3AEVLpGQVM/U+gzOI/MhQ=; b=eyxZOx9/qas7sM
	IwfDON0oaKZum/JYVAQT2dnrzEK53dm4HKJtkvxJU0R0VzKTfYze/dY46jyVdLgo968F1QB3Tl3A+
	PDX2Cg8LX7t8LY8YY/5kgyr21mGMltwxUFQnM7ZxeI//YUPjR4M0dMYdO6K5azYqfEvpnH7btuFRg
	NBG5JLLV2In0JmFfOqWNwv3dFG3uGAVBun3tHKOi9Bm07OpDn1gbeyFsc1/Un/rN59tNcw+7ycHYG
	yqv3Yqvx7ynnhTG71BvtPPmgnHswhek+Hcu8SBLBVQp6suALIzV9kmxydFIdebn904Bh6rZv+ezaT
	gmd2Faw7ohq6qd94J27A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hy2on-0001Zp-9C; Wed, 14 Aug 2019 23:36:37 +0000
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hy2ok-0001ZF-FH
 for linux-mtd@lists.infradead.org; Wed, 14 Aug 2019 23:36:35 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hy2oi-0001fi-CO; Wed, 14 Aug 2019 23:36:32 +0000
Date: Thu, 15 Aug 2019 00:36:32 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 05/11] quota: Allow to pass quotactl a mountpoint
Message-ID: <20190814233632.GW1131@ZenIV.linux.org.uk>
References: <20190814121834.13983-1-s.hauer@pengutronix.de>
 <20190814121834.13983-6-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814121834.13983-6-s.hauer@pengutronix.de>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_163634_507363_2FFCAC03 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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

On Wed, Aug 14, 2019 at 02:18:28PM +0200, Sascha Hauer wrote:
> +/**
> + * reference_super - get a reference to a given superblock
> + * @sb: superblock to get the reference from
> + *
> + * Takes a reference to a superblock. Can be used as when the superblock
> + * is known and leaves it in a state as if get_super had been called.
> + */
> +void reference_super(struct super_block *sb)
> +{
> +	spin_lock(&sb_lock);
> +	sb->s_count++;
> +	spin_unlock(&sb_lock);
> +
> +	down_read(&sb->s_umount);
> +}
> +EXPORT_SYMBOL_GPL(reference_super);

NAK, for a plenty of reasons

1) introduction of EXPORT_SYMBOL_GPL garbage
2) aforementioned garbage on something that doesn't need to be exported
3) *way* too easily abused - get_super() is, at least, not tempting to
play with in random code.  This one is, and it's too low-level to
allow.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
