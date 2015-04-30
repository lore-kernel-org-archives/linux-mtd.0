Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnfmA-0003qH-D0
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 04:08:39 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 91A0A806BF
 for <linux-mtd@lists.infradead.org>; Thu, 30 Apr 2015 15:58:39 +1200 (NZST)
Received: from markto-dl.ws.atlnz.lc (markto-dl.ws.atlnz.lc [10.33.24.11])
 by smtp (Postfix) with ESMTP id A976F13EC0D
 for <linux-mtd@lists.infradead.org>; Thu, 30 Apr 2015 15:56:58 +1200 (NZST)
From: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/1] Improve speed of JFFS2 at startup
Date: Thu, 30 Apr 2015 15:57:51 +1200
Message-Id: <1430366272-6956-1-git-send-email-mark.tomlinson@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch is an attempt to improve the speed of JFFS2 at startup. Our
particular problem is that we have a 30MB file on NOR flash which takes
about five seconds to read and test the data CRCs. During this time access
to other files in the same directory is blocked, due to
parent->d_inode->i_mutex being locked.

This patch attempts to solve this problem, and appears to work. For our
embedded environment, we see a five second improvement in boot time.
However, given that I do not have experience at Linux filesystem code, I
can't be sure that this is a correct solution, or that there isn't a better
way of achieving what I'm trying to do. I feel there must be a way to do
this without creating a new inode function call.

I'm not expecting that this patch will get applied as-is, but please let me
know if there is any merit to it, whether it should work, and what could be
done to if this is to be made part of the kernel.

This patch is against 4.1.0-rc1, but will apply easily enough to other
recent kernel versions.
