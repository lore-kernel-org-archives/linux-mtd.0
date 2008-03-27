Received: from ocean.emcraft.com ([213.221.7.182])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JerrU-0005nS-0G
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 13:09:44 +0000
Message-ID: <47EB9C93.4050004@emcraft.com>
Date: Thu, 27 Mar 2008 16:09:39 +0300
From: Sergei Poselenov <sposelenov@emcraft.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Compatatibility of the JFFS2 code in 2.4.26 vs 2.4.25
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

For our projects, we have two separate kernel trees
- 2.4.26 and 2.4.25. We have decided to unify the JFFS2
code by moving 2.4.25 to 2.4.26 (not otherwise, because
we made some bugfixes/enhancements in 2.4.25 JFFS2).

Are there any upward/downward compatibility issues?
Will the resultant code work with customers filesystems,
already created under 2.4.26?

Thanks a lot for any info.

Regards,
Sergei
