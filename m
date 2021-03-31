Return-Path: <SRS0=JW0y=I5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008B6C433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Mar 2021 14:46:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F24A60FF2
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Mar 2021 14:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F24A60FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S4m/08WMaeII8kuvJB6N9SkjOxJbIKh/fmfw4WmOm9Q=; b=Nc6NIJQa83GdqWzC4ayUAisZ5
	qYJcUtbd/Ua898zlixmerUxulVEL41hbDq6U0UacJxDg7TRc+WQpz16jVPuVQkP2oS/QyOKkqtLwc
	saOXeFP1cCfY3hxQE6u9Vh1TkuU0JtEklkt8Tn7MYycrx6RkkP7PsC6/Bf/y7Fd+ADY1FWknXelOI
	98vtJOrcCx2RpgxoSZLzVQg37v/WCYJj+zb1wDumSrIW8avPEtzLIEYViR1Lhxy1XWMVf4fLg4uSj
	AGYinWOCiaCBVX+8gLeLcAqU+YHOCRT2yPKGGW15wKpHTk93uFMLSPu0c5dz5c36F/sBAcJZvbdOS
	/Yg/ScA6A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRc5j-006pN4-MC; Wed, 31 Mar 2021 14:45:07 +0000
Received: from verein.lst.de ([213.95.11.211])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRc5f-006pM4-DL
 for linux-mtd@lists.infradead.org; Wed, 31 Mar 2021 14:45:05 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7AF7C68B05; Wed, 31 Mar 2021 16:44:53 +0200 (CEST)
Date: Wed, 31 Mar 2021 16:44:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christoph Hellwig <hch@lst.de>, Joel Stanley <joel@jms.id.au>,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 Kees Cook <keescook@chromium.org>,
 "William A . Kennington III" <wak@google.com>,
 Lei YU <mine260309@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] jffs2: Hook up splice_write callback
Message-ID: <20210331144453.GA9931@lst.de>
References: <20210330134537.423447-1-joel@jms.id.au>
 <20210330161715.GA12783@lst.de> <YGNuZMUkzH0tkce6@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YGNuZMUkzH0tkce6@zeniv-ca.linux.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_154503_558666_0C04EF35 
X-CRM114-Status: GOOD (  15.60  )
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

On Tue, Mar 30, 2021 at 06:31:00PM +0000, Al Viro wrote:
> The same goes for quite a few other filesystems, actually - at least
> adfs, affs, bfs, hfs, hfsplus, hostfs, hpfs, minix, omfs, sysv, ufs 
> and vboxsf are in the same boat, and I suspect that ecryptfs and ntfs
> might be too.
> 
> Christoph, do you see any problems with doing the same thing for that
> bunch as well?

Linus asked to only fix things up where we get reports, but I think his
intent there was more random procfs and debugfs files rather than file
systems.  So just doing the sweep should be fine.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
