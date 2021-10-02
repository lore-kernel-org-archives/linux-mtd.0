Return-Path: <SRS0=Xs+q=OW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5F6C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Oct 2021 21:13:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B68B961B26
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Oct 2021 21:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B68B961B26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	References:Subject:In-reply-to:CC:To:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JeLenuZefJCdCF2KzcYl89ztz3Hn8MYCkGDp1hIH13I=; b=vjbu1MHFRJDzeA
	wTCGouJwzLcEgBu6TP76mY28Uj7WMsvh5hcFL7fHa0iHIdWMrWyu8hXX9J6QdnWXasYD4ue9akved
	neqVq1m6YKuO85NaSSe4uKGSLKxvj4Mj2sy5G02FLJCMILF1bXtfOTfksT5Wbie8XBP2NbSCwWa+a
	pQOt5OIfR2LNtb6DzAjlMdE/PPm2OdsujWNOonOrjOiLKG+hE+TpxbTFood+TeaV0AhEMh09VblKs
	/EayVwnVWR1nw+NdHZUqtKPE2mL0gHJYhFvBoh7No+bDyajQSZwCjXHUvM1rsZJriApsRUn1k+/qE
	/f09liiCaJdgHrwU4NfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWmJS-002lhy-RH; Sat, 02 Oct 2021 21:12:54 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWmJP-002lhP-To
 for linux-mtd@lists.infradead.org; Sat, 02 Oct 2021 21:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633209159;
 bh=yxMgNzarObbpsQDZSpvaMKY0E67LlRv3HMOpH2GLwpw=;
 h=X-UI-Sender-Class:From:To:CC:In-reply-to:Subject:Reply-to:
 References:Date;
 b=GZ8lvrhhxnbOdthB46NN5c0wvqBLCXsm+1acLFQc7yIY60DbDxPvBlgK06Mdkd3l/
 Sk0/5gIgHqfMkSLJCq42UfGmT+duVTkIUuDqZJnZlyau9VSirGKe2zHoHKaykmsfO1
 el+e9Qbq1mB0OPP1CTFQA/vgkLxAjSAhex1j36c0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from corona.crabdance.com ([173.228.106.131]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MEFvj-1mgzSM0qM1-00AIH5; Sat, 02 Oct 2021 23:12:39 +0200
Received: by corona.crabdance.com (Postfix, from userid 1000)
 id C8546899763; Sat,  2 Oct 2021 14:12:34 -0700 (PDT)
From: Stefan Schaeckeler <schaecsn@gmx.net>
To: richard@nod.at
CC: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-reply-to: <160773399.91203.1632175069460.JavaMail.zimbra@nod.at> (message
 from Richard Weinberger on Mon, 20 Sep 2021 23:57:49 +0200 (CEST))
Subject: Re: [PATCH 0/1] ubifs: ubifs to export filesystem error counters
References: <20210907214034.11676-1-schaecsn@gmx.net>
 <20210920024824.9E053899858@corona.crabdance.com>
 <160773399.91203.1632175069460.JavaMail.zimbra@nod.at>
Message-Id: <20211002211234.C8546899763@corona.crabdance.com>
Date: Sat,  2 Oct 2021 14:12:34 -0700 (PDT)
X-Provags-ID: V03:K1:MCTHo0Wi5ZVuZV+KppndXsSykkDLji6uoywLoQOeoirDVs+SAGl
 0eAEqG8eHUt4400kwgqyW0vEB7qeei+DTuVgkIC+Sz2PPGtmz09J83bi22EkrWWyOTqkPno
 lpm8EK5LhFdj/0wi/dNX9GnEht8giL52uKFbncVORHS0L7RL0qz1BlkD25jssq9csj0CbSS
 wM+SVhyGrtaMwDmKulYPA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k1mpkITKCeU=:hG3I8YuqG0vFlb4+tRvmnL
 bxPzYWNB+tNeUct7FPRl1xkglGCYapvK6YQWY3vqsnQvUeYYyYaNYJrkNJePdWd15ZoAP0Vzo
 oBInBSVnt3/cEjQojQRKP2m3AMk+eyzyNAMklFIE7EwzFi3Q1ppOeV/JlTKiT8v4BOpryTJOU
 kAemnqpTw/MBeoSmbkLJcSvGx4430zor/do+rfSfUq4v/O0IeYxVKAJIjfDwgeAK8+6ImqbAi
 t7uuOyOzqZ4O2dtovvWxo4psULGySVEOKNg87nXPKZYbXKwWzvbucVdmdV89RYRSpges5O28c
 9ouMxXFEmUTCxKjUR0YNX0n3JcoPtaLgIFO7PU8oa+JFtvksh+5rLzp5QYSv5Hq5v01tV5I4x
 XUIK941R2XHqlwA2zZG+5OyjV79pflbeRKGtRN7cPyLczC62LbugSEYI1VpFwFBgLKB67dkXB
 XQr2v5vlYt4athjeARtqPR9D/wr5MdqOAIpDnkB5mFppQkS8hmlBX30z+aEz+/HdR8cBn2KdM
 L9iO/H24zbBATQSHU+CX9DaJzpJPu9mCB0ihdq1D/oFNM71zk8gJ3ZZ4XNd+M9Scr25R6t/rs
 ud6xKWDYZS2wJUcWjck6BvtcUuKb+MuBooiY3IrVybkc4fqeJWh8BJuFDardBu4V9yftDe8PS
 CpxEP2p4d7sF7Cw5xPMjHPYORfMonDHWvOfla/ALoSye73horjLq7DGZ0UbTUmHhm59IlJbiD
 g0LhyHqPMTg9p//iLxDhIoZIU+qJWPYYPS0nhv2Ve4k0NJ1NwEK4QUqd/30hlNPuVF6KHKoPq
 7qsp2hCFWlSX1ioe0HtQnHNXzkOr2B96fCkLvJlUA9MoOvESVvr9i5v9oUswR6U6Cj7W/vcP0
 gmRevF61CMqsB5fMTEygJDs+cNFuwV0GgjyMsKkAMvBeWZ8t/nRd6Xu1EZzW1HFsksw5BVGGY
 SBduN3d7y9eMfOg6cI/Q9XNKCjQx6dZgYsVb+dNa+BSF34xhy3uPsraobiGZs19VDBQyaUDUt
 K+a7qGV35cYYS+O+iSZ4HBzMoHLGtW4Rmgd0n7xbdwqoHFJkhU0ukS9eZtoE//ej7SYytxgZ4
 81dPIbteUnm4aw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211002_141252_343291_91858559 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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
Reply-To: schaecsn@gmx.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Richard,

> > Hello mtd/ubifs,
> >
> > I just want to check back on what you think about having a sysfs for ubifs and
> > starting with these three callbacks
> >
> > /sys/fs/ubifs/ubiX_Y/errors_magic
> > /sys/fs/ubifs/ubiX_Y/errors_node
> > /sys/fs/ubifs/ubiX_Y/errors_crc
>
> I didn't have a chance to review your changes to far but in general I like the idea
> if exposing such an interface.
> Sorry for being a slow maintainer.

I just wonder if you still like the idea of a sysfs for ubifs. At one point we
should then move forward.

 Stefan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
