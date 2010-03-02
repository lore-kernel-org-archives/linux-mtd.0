Received: from mail-pz0-f184.google.com ([209.85.222.184])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NmHQ7-0003Ml-Og
	for linux-mtd@lists.infradead.org; Tue, 02 Mar 2010 02:01:16 +0000
Received: by pzk14 with SMTP id 14so4189389pzk.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 01 Mar 2010 18:01:09 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 1 Mar 2010 18:01:08 -0800
Message-ID: <cf70f0211003011801r33027ec8s78c9326f9d058c46@mail.gmail.com>
Subject: Disadvantage of using yaffs checkpointing ?
From: Shivdas Gujare <shivdas.tech@gmail.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I am very new to mtd & yaffs and working on boottime optimization and
found that yaffs checkpointing helps to mount
yaffs2 very quickly. I tried it, and was able to save almost 4sec for
128MB partitioned nand.

Since everything looks very good If I use yaffs checkpointing feature
but have a doubt, are there any disadvantage of using check-pointing
by default in final product?

I understood that, check-pointing only disables boot time nand block
scanning & marking it bad if found,
and takes "system snapshot" while using "umount /dev/mtdblockN" which
it use in next boot.
So, If I decided to use "checkpointing" with "umount" while powering
off the device in final product,
are there going to be any problems I will face avoiding block scanning?

Thanks lot for any help.

Thanks and Regards,
Shivdas Gujare
