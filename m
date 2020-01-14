Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20BFC33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 22:00:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C55A24658
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 22:00:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ey4I8RS2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mY5ghWc3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C55A24658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+cIAVoudUD92PlKPp+KbtYLahD8m+t52RizrGqvAcY8=; b=Ey4I8RS2T+tPRO
	6YYaWE6kPXKzIa4pRpwRBbndiLm8R6yAjWP469OR0jZoXjo9ZYgPjIZL0RIds3nHXJYCJH/4IgelU
	ESEcLk1RO7xTiEXtOyJxjMEcD+sP5tH5UxC1ILYyYHgN1wHCrHdHGVSLEEaZ7P85jYABt9A824VML
	kYNA8Y2CYWBs0pLbUEI3g/GiY4JqedZYEu+vGvNqait8zv72QIh5K6U52+S2ffHEUrbRdhn5Ooe+i
	EWZU+BIraKBo8WPSPIBKORuZbgepOS1ph3Ckph+Uh2iH3FMiwolPH+cYGrasbBagJwz2fZBSs2PL1
	vPf7w1itOSR1vC+Elyeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irUEe-0004vt-D7; Tue, 14 Jan 2020 22:00:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irUEV-0004uX-JK
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 22:00:27 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C103824658;
 Tue, 14 Jan 2020 22:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579039218;
 bh=myv1tZujatarOxhWpe/ZDoVHrCY2/KGzo+86dr3TQf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mY5ghWc3WrHee+LAlkopBFawq4UUIwj9d8PLPhe10NkZZbmGxUnmycyP+VhlCjVNy
 ZnfDP+GBNlUWp5B8rLyHLpyevvZS8V9LIZuY+ZpKzn4ccAE6Xy8LuXTjcOPMrxlomE
 j0W+k3yzIGYzJD58KTjLs3Wza0el1kKf+3V5QjSg=
Date: Tue, 14 Jan 2020 14:00:17 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 0/2] ubifs: fixes for FS_IOC_GETFLAGS and FS_IOC_SETFLAGS
Message-ID: <20200114220016.GL41220@gmail.com>
References: <20191209222325.95656-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209222325.95656-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_140019_657641_E724D332 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Dec 09, 2019 at 02:23:23PM -0800, Eric Biggers wrote:
> On ubifs, fix FS_IOC_SETFLAGS to not clear the encrypt flag, and update
> FS_IOC_GETFLAGS to return the encrypt flag like ext4 and f2fs do.
> 
> Eric Biggers (2):
>   ubifs: fix FS_IOC_SETFLAGS unexpectedly clearing encrypt flag
>   ubifs: add support for FS_ENCRYPT_FL
> 
>  fs/ubifs/ioctl.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Richard, have you had a chance to review these?  I'm intending that these be
taken through the UBIFS tree too.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
