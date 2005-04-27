Received: from mail.avantwave.com ([210.17.210.210])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DQgmO-0007cs-Cm
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2005 03:16:17 -0400
Received: from [172.16.11.198] ([172.16.11.198])
	by mail.avantwave.com (8.12.10/8.12.10) with ESMTP id j3R77nXb023119
	for <linux-mtd@lists.infradead.org>; Wed, 27 Apr 2005 15:07:49 +0800
Message-ID: <426F3C2F.7040503@avantwave.com>
Date: Wed, 27 Apr 2005 15:15:59 +0800
From: mike lee <mikelee@avantwave.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: no wait queue init in cfi_cmd0002
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all
    I have added a line to cfi_cmdset_0002.c to solve kernel oops of my mapping driver. Actually, i can not find any init wait queue in cmdset_0002, when i add it back , the problem solved. I get mess because there is no problem when i port another amdflash. Please correct me if i am wrong.
    I am using unpatched linux-2.6.10

struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
............
    for (i=0; i< cfi->numchips; i++) {
        cfi->chips[i].word_write_time = 1<<cfi->cfiq->WordWriteTimeoutTyp;
        cfi->chips[i].buffer_write_time = 1<<cfi->cfiq->BufWriteTimeoutTyp;
        cfi->chips[i].erase_time = 1<<cfi->cfiq->BlockEraseTimeoutTyp;
        init_waitqueue_head(&cfi->chips[i].wq);  //line added by mike,11/apr/2005
    }       

best regard
Mike,Lee
