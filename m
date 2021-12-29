Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1205AC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Dec 2021 15:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8FdmeTSSt3TNUJWm3C0iz6nN+DdHRxJOezT/1la8JoQ=; b=15EhIcmBjC6YUP
	tlWwdQ/9HAo9ej5eobv0Fl54Qy3fzZbiW7vu4zZxgvh8SMqvJrWNJp2ZF765b+BBxXxAx0JS7vGq1
	dW/egv2kIa0suG7EtOKeJt15cO7zfwiu5VqpMjvtSCSiJNslGwswuFDqb+3Dnk8qrRQZ+izqXLj42
	c1YvxkHB8aaAtJDR4qrDp6NDaxGqYU2GVVVPCx1oYaDSLTLQwC9qR9CC1olAleOoTmsEpxHoXTnUj
	Fc6hxjrXluD9ilbZd1mVjiPSb2PCOA7IAt4/clbPwB1zuo5G1gLgIvAwfPqNWofB1RNplPmLr+rtj
	8QXdC6keYKs8OJZx1toA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2bLN-00354N-1O; Wed, 29 Dec 2021 15:58:25 +0000
Received: from mail1.systemli.org ([212.103.72.247])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2bLJ-00353h-Id
 for linux-mtd@lists.infradead.org; Wed, 29 Dec 2021 15:58:23 +0000
Message-ID: <5be0bd36-f135-f474-293d-75824c118e7c@systemli.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
 s=default; t=1640793495;
 bh=IzE+UG962teV2+lVQ+UExyaDeleNFORUIguVtBcefCw=;
 h=Date:To:From:Subject:From;
 b=a5v7JLIpNDeGmZywZ7U8tWznd8jdwQyWXw58ZsGjqfgh2bdtYNGLuh7jifKiua1FH
 EdhUg50f8gRzjnv5gFCFSflyS9IN9A9f1Myb8381WxFO2q4i6n3FAFUMkSj6wlCBG8
 5GDd7uWBFlHLrE3rOFfZ3YTMCIPuEiVU2W/p/Df4/1DD/J4eyhFuokTL5OzXrGbub0
 rltciWnq3mg07+Oz9GGdxHCEIaZnQILBzhAj3LQs4YpETaoIGUmY/ZZ/xN1GSUQ670
 K0HyUlU0xzVv1P6bkGZHqYnkGya7rfj3NMngcBBSk9fJDuW3GuIk0yKeiklbKeapq6
 N517/HBBekTrA==
Date: Wed, 29 Dec 2021 16:58:13 +0100
MIME-Version: 1.0
Content-Language: en-US
To: linux-mtd@lists.infradead.org
From: Nick <vincent@systemli.org>
Subject: mtd-utils-2.1.3.tar.bz2 missing jffs2.h file?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_075821_959099_A9F28F1D 
X-CRM114-Status: UNSURE (   1.90  )
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

In "mtd-utils-2.1.3.tar.bz2" the file "include/linux/jffs2.h" is 
missing. In "mtd-utils-2.1.2.tar.bz2" it is contained and also in the 
git. Is that intended?


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
