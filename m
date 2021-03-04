Return-Path: <SRS0=6kki=IC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDA2C433E0
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Mar 2021 02:52:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E52A64E7C
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Mar 2021 02:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E52A64E7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5tAn5erWddzkKQKVi6F6i0XrvdrcVD1235F6rOR16CE=; b=bLOEx7FcseGnK8M/YRJ5sjKRN
	tdi7cx5ytFRbJCZguIzTWtUGuooe7eLkKU5xum7c+3fPvG7E8ljHbicjc4Gecxq9frzglQLbhit3X
	/vQOZPmwhttrGURmHWtlIEF8OQ1cp9uSqUnY/R4JxA18vBiM5I7Zpje25CpdHTZ+5JhDdL9Tfsoex
	ps6Vk5A3NVL51kRbamaXOU63Vjq8H/X7oys7x09VNJFLuocAPayLhngI0iScVthQtMmfQZTj4nBvX
	nFFsITy3XOLYWYvoECvRnzBfu/HypgZojBxL/IgNiy7+r3kFSyumthW/WdbzZYIhsk9mkrMbAsn36
	BOUvDDlWg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHe4d-007Xde-82; Thu, 04 Mar 2021 02:50:48 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHcqD-007KuE-DJ
 for linux-mtd@lists.infradead.org; Thu, 04 Mar 2021 01:31:52 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DrYFT44lTz16G9T;
 Thu,  4 Mar 2021 09:29:49 +0800 (CST)
Received: from DESKTOP-2DH7KI2.china.huawei.com (10.67.102.237) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Thu, 4 Mar 2021 09:31:25 +0800
From: Chengsong Ke <kechengsong@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <chengzhihao1@huawei.com>
Subject: Re: [v2] ubifs: Fix read out-of-bounds in ubifs_jnl_write_inode()
Date: Thu, 4 Mar 2021 09:31:25 +0800
Message-ID: <20210304013125.29308-1-kechengsong@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20201223121536.6244-1-kechengsong@huawei.com>
References: <20201223121536.6244-1-kechengsong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.102.237]
X-CFilter-Loop: Reflected
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

ping

>> Reproducer:
>> 0. config KASAN && apply print.patch
>> 1. mount ubifs on /root/temp
>> 2. run test.sh
> 
> What does test.sh do?
Go to Link: https://bugzilla.kernel.org/show_bug.cgi?id=210865.
test.sh creates a very long path file test_file, and then create a 
symbol link link_file for test_file, so ubifs inode for link_file will 
be assigned a big value for ui->data_len.
When we change atime for link_file, ubifs_jnl_write_inode will be 
executed by wb_writeback. By this way, write_len could be not aligned 
with 8 bytes.
> 
>> 3. cd /root/temp && ls // change atime for link_file
>> 4. wait 1~2 minutes
>>
>> In order to solve the read oob problem in ubifs_wbuf_write_nolock, just align
>> the write_len to
>> 8 bytes when alloc the memory. So that this patch will not affect the use of
>> write_len in other
>> functions, such as ubifs_jnl_write_inode->make_reservation and
>> ubifs_jnl_write_inode->ubifs_node_calc_hash.
> 
> I gave this a second thought and I'm not so sure anymore what exactly is going on.
> The problem is real, I fully agree with you but I need to dig deeper into
> the journal and wbuf code to double check that we really fix the right thing
> and not just paper other something.
> 
> Thanks,
> //richard
> .
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
