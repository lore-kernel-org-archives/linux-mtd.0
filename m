Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9179CC54E58
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 08:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJ7TJODLX6Tzs7GClSXuiGSRkIEgJik+QEkNzyvXfm8=; b=d0e+IXWB3rOGhx
	3z95e91JXq4rKG/ZOjT8TmN1aGZVkBtGnM2jsp+e9IilwhuYXJ8bNBUGaJ2gGiiUGf810Y0danu9g
	QnLv6zdagV6C3acHEO+FHqHcd43bphrbMxMEOjA5utS4OPr39ez6HaAxOVJxBfBY0r4lM+Z3aVXZm
	aeoOg0pEuXYM3Yecbt5L/RPF62NaqSXe9E+23xD38yldUpEuIJdmmw+wOGP4p6IJu609aSbVAiDS7
	DP3Ke0BWizRYdW8N9JMGGKEync45kD5VK6x+4Y6DBgsxVDJYlL8oAbSAgUbfXK9S0HPPtxXDooYnO
	GyLlNlpW7PhoCP9wPT5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofuW-0000000GDkN-2oxG;
	Mon, 25 Mar 2024 08:42:28 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofuR-0000000GDia-41mk
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 08:42:26 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V35vt2zF2z1h3Zl;
	Mon, 25 Mar 2024 16:39:38 +0800 (CST)
Received: from dggpemd200001.china.huawei.com (unknown [7.185.36.224])
	by mail.maildlp.com (Postfix) with ESMTPS id EA34E1402CA;
	Mon, 25 Mar 2024 16:42:15 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 dggpemd200001.china.huawei.com (7.185.36.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 25 Mar 2024 16:42:15 +0800
Message-ID: <60aef4db-27f4-8be3-74bb-3efaee92b7d5@huawei.com>
Date: Mon, 25 Mar 2024 16:42:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] ubifs: fix incorrect UBIFS_DFS_DIR_LEN macro definition
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<ada@thorsis.com>, <error27@gmail.com>, <Artem.Bityutskiy@nokia.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20240324120333.3837837-1-wangzhaolong1@huawei.com>
 <bade7524-2b8f-449a-a29e-cafd11359504@moroto.mountain>
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
In-Reply-To: <bade7524-2b8f-449a-a29e-cafd11359504@moroto.mountain>
X-Originating-IP: [10.174.178.209]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemd200001.china.huawei.com (7.185.36.224)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_014224_485951_BC213ECC 
X-CRM114-Status: GOOD (  29.13  )
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


Thank you for your detailed comments and suggestions.

 > On Sun, Mar 24, 2024 at 08:03:33PM +0800, ZhaoLong Wang wrote:
 >> The UBIFS_DFS_DIR_LEN macro, which defines the maximum length of the 
UBIFS
 >> debugfs directory name, is incorrectly calculated. The current 
formula is
 >> (3 + 1 + 2*2 + 1), which assumes that both UBI device number and 
volume ID
 >> are limited to 2 characters. However, UBI device number ranges from 0 to
 >> 37 (2 characters), and volume ID ranges from 0 to 127 (up to 3 
characters).
 >>
 >> This incorrect definition leads to a buffer overflow issue when the 
device
 >> number is 31 and volume ID is 127, causing the dbg_debugfs_init_fs() 
function
 >> to return prematurely without creating debugfs directory in the 
stable branch
 >> linux-5.10.y.
 >
 > This commit message is very confusing because you are talking about
 > 5.10 and the current kernel.  Only talk about the issues in the current
 > kernel.  Later when we're backporting patches then we can discuss
 > issues in the old kernels.  (You will need to re-write the commit
 > message and resend).
 >

You're right, I shouldn't have mentioned the 5.10 kernel issue in the
commit message. I'll rewrite the commit message to focus only on code
improvements for the current kernel.

 >>
 >> A previous attempt to fix this issue in commit be076fdf8369 ("ubifs: fix
 >> snprintf() checking") by modifying the snprintf return value check 
range is
 >> insufficient. It avoids the premature function return but does not 
address
 >> the root cause of the problem. If the buffer length is inadequate, 
snprintf
 >> will truncate the output string, resulting in incorrect directory names
 >> during filesystem debugging.
 >
 > Heh, my commit message said that my patch did not affect runtime but I
 > don't know what I was thinking when I wrote that. :P  I guess I saw
 > UBI_DFS_DIR_NAME but didn't notice it had some %d format strings in it.
 >
 > I think the calculations were wrong, yes, and the comments that explain
 > them were wrong, yes.  However, I think that the original code worked.
 >
 > -    n = snprintf(d->dfs_dir_name, UBI_DFS_DIR_LEN + 1, UBI_DFS_DIR_NAME,
 >                                        ^^^^^^^^^^^^^^^^^^^
 > The + 1 was added by mistake, however, 9 + 1 = 10, so in the end the
 > math errors cancel each other out.
 >
 > +    n = snprintf(d->dfs_dir_name, UBI_DFS_DIR_LEN, UBI_DFS_DIR_NAME,
 >                                        ^^^^^^^^^^^^^^^
 > This is also 10.
 >
 >                ubi->ubi_num);
 > -    if (n > UBI_DFS_DIR_LEN) {
 > +    if (n >= UBI_DFS_DIR_LEN) {
 >
 > n > 9 and n >= 10 are the same.
 >
 > So I think this is a nice clean up, but I don't think it changes
 > runtime.  We should backport my patch to 5.10.

I also agree with you that the original code, while having incorrect
calculations and comments, still works due to the mathematical errors
canceling out. I'll acknowledge this in the revised commit message.

As for the suggestion to backport your patch to 5.10, I'm all for it.
This will help fix the problem in the old kernel.

Thanks again for the feedback. I'll prepare an updated patch and resend
it as soon as possible.

Best regards,
ZhaoLong Wang

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
