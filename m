Received: from mx5.zte.com.cn ([63.217.80.70] helo=zte.com.cn)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UfhZI-0003I0-9f
 for linux-mtd@lists.infradead.org; Fri, 24 May 2013 02:17:22 +0000
Received: from mse02.zte.com.cn (unknown [10.30.3.21])
 by Websense Email Security Gateway with ESMTPS id 4F8AB1271159
 for <linux-mtd@lists.infradead.org>; Fri, 24 May 2013 10:16:30 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse02.zte.com.cn with ESMTP id r4O2GVMG059857
 for <linux-mtd@lists.infradead.org>; Fri, 24 May 2013 10:16:31 +0800 (GMT-8)
 (envelope-from wang.bo116@zte.com.cn)
To: linux-mtd@lists.infradead.org
Subject: UBI attach in NOR flash may fail
MIME-Version: 1.0
Message-ID: <OF8E7E906E.982713CF-ON48257B75.000B6C54-48257B75.000C808D@zte.com.cn>
From: wang.bo116@zte.com.cn
Date: Fri, 24 May 2013 10:16:14 +0800
Content-Type: text/plain; charset="US-ASCII"
Cc: wang.bo116@zte.com.cn, cui.yunfeng@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello:
        Use UBI in nor flash, the mtd device's erase region may be 1,not 
0. In function io_init() when "ubi->mtd->numeraseregions != 0" will return 
EINVAL, i think chang the condition to "ubi->mtd->numeraseregions > 1" 
will better.
