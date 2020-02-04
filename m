Return-Path: <SRS0=FaK6=3Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4DAC3524B
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2020 16:07:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83D8F20730
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2020 16:07:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BWyTB2+e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83D8F20730
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xxO7q8j76kaMk3s2MZzcVfC0cbFXJpqCDCk+8Z5izU=; b=BWyTB2+eg9Mccd
	Fs2tzGbHKnLXDv81Qr/SRg0MGjttEaYbiODTvSkUJQhQEEq/7LTeGJjHs9zhr4eYF0SUPcuPJY7Qi
	+7zmYlDFil0AIUIM62QVIdT88+JTBbLkHzkpXEn4YKZxroWYp++5ZpLOPyDVrh7ll0eLowjx4NB1o
	YbYTzP0/d5JCXKFmubWxex4gYrw2QgKVgaJKAwoi0tgZERtK5Lz/e2FZi5loT/+3TCfOmCn5MyhdV
	zVctG3Mbs4W1DVgH3EzhAfFsmv4gXngPipvNNb8ujbyY7AES8lHnIBncSjZaDEjtBdrN7dphPnSId
	TYIU0fCf6HOC8am9FprQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iz0jL-0002Ab-CD; Tue, 04 Feb 2020 16:07:15 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iz0jI-00029x-OJ
 for linux-mtd@lists.infradead.org; Tue, 04 Feb 2020 16:07:14 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B4A04AC65;
 Tue,  4 Feb 2020 16:07:09 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id A66E31E0BAA; Tue,  4 Feb 2020 17:07:03 +0100 (CET)
Date: Tue, 4 Feb 2020 17:07:03 +0100
From: Jan Kara <jack@suse.cz>
To: "Mainz, Roland" <R.Mainz@eckelmann.de>
Subject: Re: Implementing quota support on Linux without block device as
 backing store ? / was: RE: [PATCH 1/8] quota: Allow to pass mount path to
 quotactl
Message-ID: <20200204160703.GG2388@quack2.suse.cz>
References: <db98497119d542b88e0cfc76d9b0921b@eckelmann.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db98497119d542b88e0cfc76d9b0921b@eckelmann.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200204_080712_935242_A0983880 
X-CRM114-Status: GOOD (  15.55  )
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
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, Jan Kara <jack@suse.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue 04-02-20 15:07:31, Mainz, Roland wrote:
> Sascha Hauer wrote:
> > This patch introduces the Q_PATH flag to the quotactl cmd argument.
> > When given, the path given in the special argument to quotactl will be the
> > mount path where the filesystem is mounted, instead of a path to the block
> > device.
> > This is necessary for filesystems which do not have a block device as backing
> > store. Particularly this is done for upcoming UBIFS support.
> 
> Just curious: Did you check how NFSv4 (also a filesystem without block
> device as backing store...)  implemented quota support ? Maybe there is
> already a solution...

Well, NFS does not really implement quota support. It relies on the server
(i.e., a local filesystem on the server) for quota tracking and enforcement
and the NFS client just gets the EDQUOT error the server got from the
filesystem. And for quota querrying (e.g. quota(1) command) there is a
special sideband rpc protocol handled by the quota tools. With NFSv4 there
is some support in the protocol itself for quota reporting but in Linux
this is not really supported because it does not map well to how Linux does
quotas.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
