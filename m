Received: from mta04-svc.ntlworld.com ([62.253.162.44])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CMSgg-0000No-8q
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2004 10:52:40 -0400
From: Ian Campbell <ijc@hellion.org.uk>
To: Raghav K <raghavk@myw.ltindia.com>
In-Reply-To: <s17eb105.052@EMAIL>
References: <s17eb105.052@EMAIL>
Content-Type: text/plain
Message-Id: <1098802353.22403.143.camel@icampbell-debian>
Mime-Version: 1.0
Date: Tue, 26 Oct 2004 15:52:33 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Protecting Sectoring
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


On Tue, 2004-10-26 at 15:47, Raghav K wrote:
> Is there any mechanism by which one could protect and unprotect 
> certain sectors of flash through an application.

There are some ioctls you can issue on the /dev/mtdX devices. There are
examples in mtd cvs in the util subdirectory (lock.c and unlock.c)

Ian.
-- 
Ian Campbell
Current Noise: Vintersorg - Blindsight Complexity

Wedding rings are the world's smallest handcuffs.
