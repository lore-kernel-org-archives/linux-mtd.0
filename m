Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DBFC7EE2A
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Jun 2025 02:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vtqxDVX9jscwmFoETQgbb40G7Ia852IzKNTkUYUFiAQ=; b=zj7/OjcUiIDQHF
	TP+5mQc0RMq9+skXoYfGcBTmWydvHjXHRb718WILUAQBz/hHohPKolzSj5XCK2JFQqidV5u1ecQJ9
	0c7fDiK5dAhVG+ZXy+x+ewl/BV4dquPnTroRrTSp+sEptZW4I20BxE690INvUv628I4+QFKrXNiE/
	rZbyzCJYv+tC6DsV5V+XytNiTsLmtyp2hYEjuC6T7BmBJN7i6ldTIKev+vk7HbyMwIceovkBNz8it
	FkIwI1uYKFXznhVDK7+6bwp9ePL5FizjUjJPk3MWRW7eDGqpHHZK6lyS8rSfLb3Xj7Vvf6iCfBN+1
	zXIEzJ58N26ZVYNyNEgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcU7-0000000ASIh-3lWa;
	Thu, 26 Jun 2025 02:37:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcU5-0000000ASHe-3bzN
	for linux-mtd@lists.infradead.org;
	Thu, 26 Jun 2025 02:37:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DBB4A617F2;
	Thu, 26 Jun 2025 02:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54BE1C4CEEA;
	Thu, 26 Jun 2025 02:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750905424;
	bh=3JMG6iB8TJvIJcGTwj3LS7AOTxOpDIfMUVTPuJlJB1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q5khl0MZs0YrWvdZchwUX1U8I1eBplhj+0tYpxr8rentRjTAoVs7bPlp+FAbfTRvL
	 JhCVPANA5DFDFgLXppQGBuXsjHW7Xz7xWcK709Ocg2i1mh1rJyUgd601mvbHuidnOs
	 J988JDLYvhXyk48jfkHfr9MRohCkHot3o8lP0zemiipe4KzF9cFFy42mBjU+DsGfHq
	 O69fJjbacyWap17eWJ+Grp8TQ/miRrSE6LaMds95gGAynho5fbgUfqKzSvfhd6EExi
	 uvpSKAP/X3v6eXj9pxZTQA2xDOoqO19oLIYkdNjy7/Ij3KwUmEdHlwUSHVxEc19mOf
	 p7iABbX9Eblrw==
Date: Wed, 25 Jun 2025 19:36:29 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Maxime MERE <maxime.mere@foss.st.com>
Cc: linux-fscrypt@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	ceph-devel@vger.kernel.org
Subject: Re: [PATCH] fscrypt: don't use hardware offload Crypto API drivers
Message-ID: <20250626023629.GA4797@sol>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <8f4c2f36-71af-4c84-bcee-2554cea991d0@foss.st.com>
 <20250613144239.GA1287@sol>
 <c1671c5e-d824-4131-861e-470d09371e05@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1671c5e-d824-4131-861e-470d09371e05@foss.st.com>
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

On Wed, Jun 25, 2025 at 06:29:17PM +0200, Maxime MERE wrote:
> Regarding robustness and maintenance, ST ensures regular updates of its
> drivers and can fix any reported bugs. We have conducted internal tests with
> dm-crypt that demonstrate the proper functioning of these drivers for this
> type of application.

In addition to the bug I mentioned earlier where the STM32 crypto driver
produced incorrect ciphertext (https://github.com/google/fscryptctl/issues/32),
the following fix shows that the STM32 crypto driver computed incorrect hash
values for years (2017 through 2023):

    https://git.kernel.org/linus/e6af5c0c4d32a27e

While these bugs may be fixed now, they show a serious lack of testing.  They
also show that these sorts of drivers are really hard to get right.

I absolutely do not want fscrypt using anything like this.  I want the crypto to
be done correctly.

(And also efficiently, which clearly these offloads don't actually do either.)

BTW, it seems all the hardware offload crypto drivers have quality issues like
this.  I gave other examples in the thread, for example the Intel QAT driver
causing data corruption.  So my intent isn't to single out the STM32 driver per
se.  (And of course this patch applies to all drivers.)  I'm just responding to
STM32 because of the people pushing it in this thread for some reason.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
