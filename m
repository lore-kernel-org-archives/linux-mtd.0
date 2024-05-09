Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F08C25B10
	for <linux-mtd@archiver.kernel.org>; Thu,  9 May 2024 10:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pp27hiXoVFeIyxCsQofhB1xHpqsX3oYIxt3xN0xBQbg=; b=j4EsJTUVuOyi3E
	qwnS1Rg6A3vRUqbaSnrhEJ79H3+T6YfOV5ZlZQ8ZfCRmvPqR+E1MHxFgnm7JHgDWckL8r0/bbvzBp
	9yGAx99O/leXM9WJj2WdD941ZzowBf2YvoxxFf0MuMuQbGsroHoLhUhjUIIHBWGUwDS82KldorEwu
	YE7FYmnFf2kj5AF+zwJNMg3/Ie9Ydu+pxqRxk4CXYq9y7ye+a8Agy5vKcAynardA4WDLFGWG9EES+
	C++GVjKryQ9/mj/HdXJJS+uouTJ09R1Tu/AFiHoLhTJ0EljQ5I0yJdNM71TowvTMdOtWamf4u96xg
	GX/oJIOt6OmVCfxHo0tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s50lt-000000015oi-0nB1;
	Thu, 09 May 2024 10:13:05 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s50lq-000000015mw-0yIj
	for linux-mtd@lists.infradead.org;
	Thu, 09 May 2024 10:13:03 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id C1FFD240101
	for <linux-mtd@lists.infradead.org>; Thu,  9 May 2024 12:12:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1715249577; bh=KQzNr7XaLzWEjLtKsd4y/6V19COESh87Er+cyQPFBr4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=TNNHA329Mk/UgoSwm7odrD0KB1BHILh9cDtM5zbjlX6T1avsBIEOFeUwzG4XWjCPn
	 A6hi/b2xEhsySg2g9oa3auvRoX6Y/iBd9+h84+95/GwGJmuJGYmYdaC64IwxQBz1fG
	 WpxYeG8uM5cfW1N2Yfb/CtTm0uE4YhfdgvdAjtMQwXNVV+9hatONFItiU+MqwP+Su1
	 ftOXI+mhk+V+RwBz2pdDZsbbutZdkapcxTSIQaaMMu8mWMEDpcnSPwupQGdkV4ocN1
	 QVJ3t/EEXkijABrZ26udiJGk7NoKD4p1gqrNQwfO+8eMb7ZSFpg8nE7u2kJZ3fq5rO
	 P+WVEmbXZ1J/w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4VZnrk5SYYz6tyF
	for <linux-mtd@lists.infradead.org>; Thu,  9 May 2024 12:12:54 +0200 (CEST)
Date: Thu,  9 May 2024 10:12:39 +0000
From: Daniil Stas <daniil.stas@posteo.net>
To: linux-mtd@lists.infradead.org
Subject: New bad blocks handling
Message-ID: <20240509131239.0cd206c8@g14>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_031302_467641_BED10ABE 
X-CRM114-Status: UNSURE (   9.40  )
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

Hi,
I have a question about handling of new bad blocks on a NAND flash that
may occur during it's lifetime.

As I understand, when writing new data to the flash I have to check for
erase or write operation errors and mark the blocks bad accordingly.

I see that nandwrite utility has -m option that does the marking of bad
blocks on write errors.
But on the spinand devices with bad blocks that I've seen personally,
the write operation doesn't return any errors when trying to write to
the bad block, only the erase operation does.
And flash_erase utility doesn't have an option similar to -m option of
nandwrite to automatically mark the bad blocks.

I also see that ubiformat utility does automatic bad block marking on
erase errors.

Shouldn't flash_erase utility has an option like this?
Or is there other way to make safe nand writes using mtd utils without
using UBI?

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
