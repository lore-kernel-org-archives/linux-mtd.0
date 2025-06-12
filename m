Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62562C71135
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jun 2025 02:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5UXmAnHl896URJOVIq2TwZLVeGcTLalXE/6rWApzAfk=; b=Wp4H8f/ytNEtj6
	Akfe0LLKQd48f3yPe8H+f6I+ifucCfREjbNmMoGwrxavR7VRgDAYGYBCCRkoA8zGc1anrOSb6E8JV
	4566QMFilLdOkbBz+xJYdZFATIu1BMQUUxKFBuTn0NCxyH6quMnnLUc2BvswJm2OmoEsMz3G5CaPM
	GHfYX9oMjhQT5xBhB10kihPOC9HgaFHxRx8sTyFfm9hiAqfRoI3QaWmVrkQZGNjdVaQE90kIwpng6
	JGWLgEiXxGqw/zKDy/ba82RJoKSntZb4PEt6Wfbf3Zyqw7GXb8HlUe6RjCNOCJfAmqKjdM04nvMvZ
	1cXZILDfrUVkVoaGat4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXux-0000000BzgS-48AB;
	Thu, 12 Jun 2025 02:43:51 +0000
Received: from psionic.psi5.com ([185.187.169.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVhK-0000000BmI3-0mvs
	for linux-mtd@lists.infradead.org;
	Thu, 12 Jun 2025 00:21:40 +0000
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id 6EA343F1E0;
	Thu, 12 Jun 2025 02:21:29 +0200 (CEST)
Message-ID: <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
Date: Thu, 12 Jun 2025 09:21:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fscrypt: don't use hardware offload Crypto API drivers
To: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, ceph-devel@vger.kernel.org
References: <20250611205859.80819-1-ebiggers@kernel.org>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20250611205859.80819-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_172138_382053_C1D37BAF 
X-CRM114-Status: UNSURE (   6.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 6/12/25 05:58, Eric Biggers wrote:

> But
> otherwise this style of hardware offload is basically obsolete and has
> been superseded by hardware-accelerated crypto instructions directly on
> the CPU as well as inline storage encryption (UFS/eMMC).

For desktop, yes, but embedded still has quite a few of these, for 
example the STM32 crypto offload engine, and I expect quite a few FPGA 
based implementations exist, so this would require vendors to maintain a 
fork to keep their out-of-tree drivers functional when updating the kernel.

POWER also has an asynchronous offload engine with AES, SHA and gzip 
support, these are significantly faster than the CPU.

If a buggy engine passes self-test, can this simply be fixed by adding 
more tests? :>

    Simon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
