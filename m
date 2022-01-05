Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EB4C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jan 2022 10:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:From:To:Date:Cc:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYxNkEfpRBPnVPNHobRDG7vOpoMSQB4ulh4sEU+tHpY=; b=0JeGlYaR2cU1VJ
	bgJNhSlR5OVYLDD0azQCFkxA+WYCdMV81NoqYW7s8d6mYJoRx1OgHWyHxxoMVjtYB4KjTYYm9jbgX
	2Odda6Amtn1bHxRqLtpKUn7SVaoaX8PhLWXaUwYSfWLZkyWddA4aXDm+o5RqhC14uK+92p0BbGYNg
	E5AZpWb7CfusmV3xnGXHqDJ5jf1A0aLk1IFspOHSM5vRm7NdeVZdXbq3TzLSLmS7UXzoGKdR0BgMN
	NSPC4oNRY4p+tp0WXMhus6w06MaYqM4/4nxknkyjdwpzs4Zj8UXzkaWSdPACiM+sSRwf5VkiMVGgm
	nhJxGIcx3fzCbBZsL9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n539V-00ESEA-Rx; Wed, 05 Jan 2022 10:04:17 +0000
Received: from mail-4317.proton.ch ([185.70.43.17])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n539R-00ESDQ-Sq
 for linux-mtd@lists.infradead.org; Wed, 05 Jan 2022 10:04:15 +0000
Date: Wed, 05 Jan 2022 10:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-star.at;
 s=protonmail; t=1641377049;
 bh=vgz5VIWw3NRCbiel8HiCtW9gzbs/Xn3rlyPwh5ytWj4=;
 h=Date:To:From:Reply-To:Subject:Message-ID:In-Reply-To:References:
 From:To:Cc;
 b=LGvH+hnFXUqlnX2EJLoGW1yIGUvVMu7qKgWqTqSnjo8v6KoOD0EvHn5D1T+HeB/bo
 pSaUbfDEZBXt/rNISwhZ2AiPQg8YV5o9ju+fSFBELLEj9b2ml9xHGAKE43hARZ9Nx6
 Hjv01mOk3wHV27h61508WiwOKLWLo0oNRVppnwMMT5+5igMqqmzcpOwalf5AjMNqwQ
 T5g0zTSFfzg1cg0NawTQkKq0Oc1OHeTr+Ab0eZMZYsNHC5eXBfyrYEksejvrK+9mcc
 v7Mh5SqzB4c2/vyu7+T56Vg3SI8AG7cRpi+yPsguKFJpZTDF7lj7Oxu7/iHFrFJaYl
 9AzG8L5UQ7+Pw==
To: Nick <vincent@systemli.org>, linux-mtd@lists.infradead.org
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: Re: mtd-utils-2.1.3.tar.bz2 missing jffs2.h file?
Message-ID: <185b8146-4b92-a015-dc63-7b47c74f4095@sigma-star.at>
In-Reply-To: <5be0bd36-f135-f474-293d-75824c118e7c@systemli.org>
References: <5be0bd36-f135-f474-293d-75824c118e7c@systemli.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_020414_730330_28D4AB92 
X-CRM114-Status: UNSURE (   8.24  )
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
Reply-To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 12/29/21 16:58, Nick wrote:
> In "mtd-utils-2.1.3.tar.bz2" the file "include/linux/jffs2.h" is
> missing. In "mtd-utils-2.1.2.tar.bz2" it is contained and also in the
> git. Is that intended?
>

that is not intended. I just investigated this and can confirm, that the
recent release tarball misses the header.

It appears this was caused by commit a888044525. The source file list was
reshuffled and a missing escape character caused the file to be omitted
from the source list.

The problem apparently went unnoticed, as the system on which the release
tarball was built, as well as a test VM, had the same header installed in
the system include directory, so a `make distcheck` didn't fail and the
build/test from the tarball on the VM also succeeded.

This should now be fixed in commit c3a92d6bdc. Although there were only a
hand full of fixes on master, but 2.1.3 is already 6 months old, so I would
simply follow that up later with a new release from the current master.

Greetings,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
