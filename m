Return-Path: <SRS0=ENrU=G5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59826C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jan 2021 16:19:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F264720735
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jan 2021 16:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F264720735
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wXBU98OJ5rta6Ay4Qslfzxvi1bPV9Ff/YBP1lSS3d0Q=; b=2QEihpPA3SeMeVWPrhi3wuFqB
	l/EhuixuRjZAXeX49Hz6lMv+m/HNU5451TM2TAOqLBFxDkOyVMOn4By+2ikLJLHY2ARCzJ9GaqtUg
	ZwyCW4jbO3e53y+oQnduICPz8ZWYEbk+WyODaX7xEowACTgbTlpnlSi9DL9OGsxbO5y98t6E/a8Aj
	EEuhqwMO6mbeoPOFyVvhCN8tIsFtQ0JVPKhtABghkxJqtafXK+La7V2U3/L0lI9ptxsZ71duddwFn
	UvPEwwsAfBw5sRCKinBUAUVX2LSRrIJNycPeDclWRDgwiqVJ+1jcQyIOxay5MC0HIVcr8WYz8rVDM
	YnzbvHnCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4R35-0000jr-VR; Tue, 26 Jan 2021 16:18:36 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4R32-0000jD-Ne
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2021 16:18:33 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2EEAFACF5;
 Tue, 26 Jan 2021 16:18:30 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id A22FF1E0879; Tue, 26 Jan 2021 17:18:29 +0100 (CET)
Date: Tue, 26 Jan 2021 17:18:29 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Message-ID: <20210126161829.GG10966@quack2.suse.cz>
References: <20210122151536.7982-1-s.hauer@pengutronix.de>
 <20210122151536.7982-2-s.hauer@pengutronix.de>
 <20210122171658.GA237653@infradead.org>
 <20210125083854.GB31738@pengutronix.de>
 <20210125154507.GH1175@quack2.suse.cz>
 <20210125204249.GA1103662@infradead.org>
 <20210126131752.GB10966@quack2.suse.cz>
 <20210126133406.GA1346375@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126133406.GA1346375@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_111832_892597_5A7B5EA2 
X-CRM114-Status: GOOD (  17.59  )
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
Cc: Jan Kara <jack@suse.cz>, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue 26-01-21 13:34:06, Christoph Hellwig wrote:
> On Tue, Jan 26, 2021 at 02:17:52PM +0100, Jan Kara wrote:
> > Well, I don't think that "wait until unfrozen" is that strange e.g. for
> > Q_SETQUOTA - it behaves like setxattr() or any other filesystem
> > modification operation. And IMO it is desirable that filesystem freezing is
> > transparent for operations like these. For stuff like Q_QUOTAON, I agree
> > that returning EBUSY makes sense but then I'm not convinced it's really
> > simpler or more useful behavior...
> 
> If we want it to behave like other syscalls we'll just need to throw in
> a mnt_want_write/mnt_drop_write pair.  Than it behaves exactly like other
> syscalls.

Right, we could do that. I'd just note that the "wait until unfrozen" and
holding of sb->s_umount semaphore is equivalent to
mnt_want_write/mnt_drop_write pair. But I agree
mnt_want_write/mnt_drop_write is easier to understand and there's no reason
not to use it. So I'm for that simplification in the new syscall.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
