Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA292CAC583
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Sep 2025 17:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zkNOz1ybX/ZUt6PXHEpnftcyCHGsBFAMHjiZcnCLQUg=; b=wGsTrs0lU5Y4//
	U7DzgQs2Z8aThJw9Dwn/16xZRugGdFJXqIP62C590RNiuR84aVehQU2DH8kHImmjBEjF3mCVkc5Md
	SHV8rbKd69bAEzgQc1SSqpjH/7Hq+sMXg0qsL1eL8JQK+EFOI6toblhS1GK36BDZ6f+N9oOv9Ql2N
	NY5M2DXUffRPq/fMrob6fuibIJBhOVH6G0lOyATTwrVAEBdkcLgpYhTiRdar+u04sKcu3UGF3/NEA
	48g280YPcfXNiPcDByR80tMwUronbDH3vCYBdCEiaP4LS5BfTm8qJGfjxwjAqGWDHF+kTvdZH6+nX
	pTRO2haWQ/HkRynp8pOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1vH-00000008mnu-3LDU;
	Tue, 09 Sep 2025 17:14:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwVA-00000006ixu-13Z2
	for linux-mtd@lists.infradead.org;
	Tue, 09 Sep 2025 11:27:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EB6943689;
	Tue,  9 Sep 2025 11:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7FBFC4CEF4;
	Tue,  9 Sep 2025 11:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757417227;
	bh=KlBc/FLfWJ60Mnd+Xoq1/937+YN8YpF4GupEf7cemXY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hDWMtW5vK0RsQR8w+ZBzz3DyHkSKsRPSO909jJQcQBc38u5RPxYKorg5QL3MZ99C1
	 UCPeDEMnMBBZ2ht63eiMFXG+iGKQbFJ2lxGanfZ8ALZQN7feDUEfsUaftOetta4Iv3
	 1EHY67CfnlNxcAwSWzQS/53fk/XtNi4KlcaNSgRSjf55i/nU7dpOUn+DEmox/baUni
	 R9J56PQAFkXDolYsFpQaUNM9BBdGFbF2r9cLcDJLNubk+3Oq+aioIs0KaEKaqSIewu
	 EEVNC+6RNpkA2vcxAjZDeOnS8eR0K8/whBu3obvVKKdkn0uQ4MN+GW/blIXtYOc3RN
	 Tf8fEhx+QLVQw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Rahul Kumar <rk0006818@gmail.com>
Cc: miquel.raynal@bootlin.com,  richard@nod.at,  vigneshr@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-kernel-mentees@lists.linux.dev,  skhan@linuxfoundation.org,
  Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [PATCH v2] mtd: sm_ftl: replace strncpy with memcpy
In-Reply-To: <20250908070124.2647038-1-rk0006818@gmail.com>
References: <20250908070124.2647038-1-rk0006818@gmail.com>
Date: Tue, 09 Sep 2025 13:27:04 +0200
Message-ID: <mafs0cy7zn9x3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_042708_362090_109A38A2 
X-CRM114-Status: GOOD (  10.04  )
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

Hi Rahul,

On Mon, Sep 08 2025, Rahul Kumar wrote:

> Replace strncpy with memcpy in sm_attr_show and explicitly add a NUL
> terminator after the copy. Also update the return value to reflect the
> extra byte written for the terminator. This aligns with current kernel
> best practices as strncpy is deprecated for such use, as explained in
> Documentation/process/deprecated.rst.
>
> No functional change, only cleanup for consistency.
>
> Suggested-by: Pratyush Yadav <pratyush@kernel.org>

A Suggested-by tag indicates that the patch idea was suggested by that
person. In this case, I did not suggest this patch and merely reviewed
it. So a Suggested-by is slightly odd here. You can read more about the
tags here:
https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
