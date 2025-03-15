Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09D4C28B2F
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 00:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBV8nMh3UlqzwFT6DwumbkzZ9v+7utgynlOdtif/Qyc=; b=ATz1s6+XTNmu5U
	GmDd7KJay+4HXXUMD9Fumrme52WF+kfIWpq++1H72ooreayOg93ZWJrYFygEA32gk+fCzGu7QAL0T
	UMfmw+vpa9BMtMNrqyt+aIa6Ofytx+yU5STYUj2fer8cwu7pyOh+c1fBrjw3MNc6e2p4KrhaQCnPN
	f4N0cQ4SKkfckfvGDd7L/g9NtrDv+q5r/MoF1r7tjaQhINHMhudjRKvrs5ITbV0+5uKuvy193SnVp
	EFbKR0dao/3B8gM0ukgAxTTpejCp24aOb9ynpw+nw+YKsdhmTWFefTmugZkLRrQu/wBGAT4c2uVlJ
	OQkp6bTwcFFmKdu241YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFF9-0000000FZMZ-29Uo;
	Sat, 15 Mar 2025 00:19:11 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFF7-0000000FZLw-0uRv
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 00:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=iUpCgk4UUaTWvFMQFZJJjWtALQkDE/pM1JIi7Yr1Tos=; b=Ea++hkR8STGZzKJwM++v0vZpuT
	fcILeOVKGxWDYM6Yj+xJ1bVwaSvdKNH+m+YqTTh//BKBUyuSlZEn7LKDctphgQqMeZvRjiMa5aT6P
	OHRFlOJurouAclErhVO9a4FjC50c2nvnRnJv4M4Ido0m/+hlhJo20WAbUTWJTU5wu7Hi37ftAfn6c
	qZNLjT0eghopQwpYzrgXnDmCx4pAa390Csmog/2vK9aE+RjEIM4QHKXvUGMNLu9CgVOf1TNoY3G4I
	JPqK+MbXrG4zYowhVm4zV3bMEzLTVQWnf0bEJhPR2KiDWrKdNjB/Au3+SxSm0cQfDcwOvv8M2fCEQ
	7hyIeCiQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttFEp-006k7n-24;
	Sat, 15 Mar 2025 08:18:52 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 08:18:51 +0800
Date: Sat, 15 Mar 2025 08:18:51 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "Cabiddu, Giovanni" <giovanni.cabiddu@intel.com>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	netdev@vger.kernel.org
Subject: Re: [v4 PATCH 03/13] crypto: iaa - Remove dst_null support
Message-ID: <Z9THa4q8Y_Ucg5nJ@gondor.apana.org.au>
References: <cover.1741954320.git.herbert@gondor.apana.org.au>
 <11128811057de7bb7e8d9ce9fe56bf9ee64ad143.1741954320.git.herbert@gondor.apana.org.au>
 <Z9QwrUqA0eaYxZaA@gcabiddu-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z9QwrUqA0eaYxZaA@gcabiddu-mobl.ger.corp.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_171909_252797_9C3B5527 
X-CRM114-Status: UNSURE (   7.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Mar 14, 2025 at 01:35:41PM +0000, Cabiddu, Giovanni wrote:
>
> Something weird happened when you submit the set :-).

Sorry, I changed the order of the first three patches but forgot
to delete the original patch-set before sending.

This orphaned thread is part of the original and should be ignored.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
