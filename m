Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F119C54E58
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 08:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/9JqK/DzmnNDfplDz3yVeKiB9u90Nbj2uYlKk4Ldtno=; b=bIA/zVuHyDohB3
	2g3vG2IPeyXAfCf1C+ykE35ht8qyAweRuyGjYT1ZfKBxn1Qzuaigku2L9OvkTjdhXtojBPdg0KGXm
	+QDcf9O6jKCVGUT7tcZoz/Qv5XY6N6QBB7uuHJmkfTxOOZAb3fG6+TNro/vCVR7IFDPsQv+Oj/PKB
	JQ52FO/3LMJut2ANdEjxTHBwtvzgE2AJVJ532x1AZIPObS+1nGYitlvGD4QBYD1ixlr6pmyQPHaPj
	AYJoltd0Nwkx9PhdNG16SXCo99cpNGK5k/eMWYUHqfUV/BIgTksbDekbPJS+32EG829K246cleAbJ
	n48kkdRpNjm3WzpoziGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofvL-0000000GE0C-2Vv9;
	Mon, 25 Mar 2024 08:43:19 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofvH-0000000GDxB-30v7
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 08:43:17 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4V35wx4MzVzwQ9k;
	Mon, 25 Mar 2024 16:40:33 +0800 (CST)
Received: from dggpemd200001.china.huawei.com (unknown [7.185.36.224])
	by mail.maildlp.com (Postfix) with ESMTPS id 982F018007C;
	Mon, 25 Mar 2024 16:43:11 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 dggpemd200001.china.huawei.com (7.185.36.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 25 Mar 2024 16:43:10 +0800
Message-ID: <bee6e666-8616-517d-8dbd-d62d9b8a2894@huawei.com>
Date: Mon, 25 Mar 2024 16:43:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] ubifs: fix incorrect UBIFS_DFS_DIR_LEN macro definition
To: Zhihao Cheng <chengzhihao1@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>, <ada@thorsis.com>,
	<error27@gmail.com>, <Artem.Bityutskiy@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20240324120333.3837837-1-wangzhaolong1@huawei.com>
 <f14013a4-80f1-4796-9f68-92a032dfdb13@huawei.com>
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
In-Reply-To: <f14013a4-80f1-4796-9f68-92a032dfdb13@huawei.com>
X-Originating-IP: [10.174.178.209]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemd200001.china.huawei.com (7.185.36.224)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_014316_020372_6EED996F 
X-CRM114-Status: GOOD (  13.55  )
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


Thank you very much for your comments and suggestions.

 >> A previous attempt to fix this issue in commit be076fdf8369 ("ubifs: fix
 >> snprintf() checking") by modifying the snprintf return value check 
range is
 >> insufficient. It avoids the premature function return but does not 
address
 >> the root cause of the problem. If the buffer length is inadequate, 
snprintf
 >> will truncate the output string, resulting in incorrect directory names
 >> during filesystem debugging.
 >>
 >
 > I don't think 'snprintf' ever truncated the output string in 
dbg_debugfs_init_fs(), even before be076fdf8369 ("ubifs: fix snprintf() 
checking"). The 'UBIFS_DFS_DIR_LEN' contains trailing zero byte 
according to the comments, but actually all callers treat it as real 
string length without '\0' terminated(eg. dbg_debugfs_init_fs, 
ubifs_sysfs_register).
 > So there are no actual problems here. The only problem is that the 
comment of 'UBIFS_DFS_DIR_LEN' is not consistent with its' usage, the 
simpliest way is modifying comments. If you still want to cleanup the 
code, please remove the wrong fixing tags.

Regarding my original commit message, I realize that the statement "If 
the buffer length is inadequate, snprintf will truncate the output 
string, resulting in incorrect directory names during filesystem 
debugging." is inaccurate.

`snprintf` does indeed stop writing when it reaches the specified buffer 
size and appends a null character (`'\0'`) after the last character. 
However, since the buffer size passed to `snprintf` is sufficiently 
large, the directory names are not actually truncated in the buffer.

 > If you want to clean up code, modifying sysfs related 
code(ubifs_sysfs_register) is needed too.

That's a good suggestion, I'll go through that part of the code and make
the necessary changes for consistency.

Thanks again for your valuable feedback. I'll take all your suggestions
into consideration and adjust my patch accordingly. I'll resend the
patch once I have an updated version ready.

Best regards,
ZhaoLong Wang

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
