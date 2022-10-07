Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2D6C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 15:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgvnHq8VqhghFrBvKZGm0sPjIX6G3PI8MIdLEtn6mqA=; b=NHeUV+C8Rgl7Lq
	Ay23mszQtQ4ouATxIEr82uil1uoMQ66vyF4DyDS7QsqoPOpBfemb8N3YNOfZQOVIC8JZUJ5nkWhC8
	8evaxLq8u9FrJD0vNB1m99punCtIlLKKJBAu+yzU8hyt4XAqRIrltX09V9d9oJMqbnx3/FvAgnVsC
	JmU67n2pOUByoQt8pAka+0Q85uN/fyU7J8kZYTwWVsXAuQ1jxnJfwHr7jycgVRqRuF+uE8LCnBdv3
	KxfVQu8qCudk/tJmw0KPv3n6w7W6IZ3kybp53BlPXwGtuqSD2nUnhdhn/VMOou8JYyE0lf3EHKwUc
	P1a/vPbt7FPKG6b/uw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogpf6-009cMH-7J; Fri, 07 Oct 2022 15:53:20 +0000
Received: from smtprelay0014.hostedemail.com ([216.40.44.14] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogpf2-009cK7-Qr
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2022 15:53:18 +0000
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 13EF712131A;
	Fri,  7 Oct 2022 15:43:43 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id 8BFEC20012;
	Fri,  7 Oct 2022 15:43:20 +0000 (UTC)
Message-ID: <62acd27e418ff202ef2ffedd2474ae7f53f93368.camel@perches.com>
Subject: Re: [PATCH v2 1/3] mtd: mtdoops: change printk() to counterpart pr_
 functions
From: Joe Perches <joe@perches.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Ray Zhang <sgzhang@google.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Fri, 07 Oct 2022 08:43:39 -0700
In-Reply-To: <20221007095236.37113034@xps-13>
References: <20221007065042.700761-1-sgzhang@google.com>
	 <20221007065042.700761-2-sgzhang@google.com>
	 <070d253e718c1a6d72fb52c1d2f02ec461d825a1.camel@perches.com>
	 <20221007095236.37113034@xps-13>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 8BFEC20012
X-Stat-Signature: za138si87dtfybssdp7nwo3qnip19zdb
X-Rspamd-Server: rspamout04
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18P8E5dDtrUnR65WTaWOg4rMOxd5qzw2vI=
X-HE-Tag: 1665157400-298926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_085316_934198_24AC3ED6 
X-CRM114-Status: GOOD (  12.56  )
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

On Fri, 2022-10-07 at 09:52 +0200, Miquel Raynal wrote:
> Hi Joe, Ray,
> 
> joe@perches.com wrote on Fri, 07 Oct 2022 00:09:26 -0700:
> 
> > On Fri, 2022-10-07 at 06:50 +0000, Ray Zhang wrote:
> > > To comply with latest kernel code requirement, change printk() to
> > > counterpart pr_ functions in mtdoops driver:
> > > - change printk(INFO) to pr_info()
> > > - change printk(DEBUG) to pr_debug()  
> > 
> > There is a different behavior with printk(KERN_DEBUG to pr_debug(
> > as pr_debug is a no-op unless dynamic debugging is enabled or
> > DEBUG is defined.
> 
> I didn't know about this difference. I was expecting printk(KERN_DEBUG)
> to behave the same as pr_debug/dev_dbg.

No worries.  Most people do not know this trivia.

I just wanted to inform in case it matters here.
Likely it does not matter.

> But honestly in this driver I feel fine changing the printk(KERN_DEBUG)
> into pr_debug().

Your choice...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
