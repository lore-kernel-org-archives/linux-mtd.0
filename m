Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AhEkQ-0006da-Nn
	for linux-mtd@lists.infradead.org; Thu, 15 Jan 2004 21:09:50 +0000
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <opr1sbhsh3g2gz5f@smtp.cbnco.com>
References: <opr1sbhsh3g2gz5f@smtp.cbnco.com>
Content-Type: text/plain
Message-Id: <1074200046.17219.1.camel@tubarao>
Mime-Version: 1.0
Date: 15 Jan 2004 13:54:06 -0700
Content-Transfer-Encoding: 7bit
Subject: Re: Problem with mtd-snapshot-20031211.tar
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-01-14 at 14:33, VD wrote:
> Hi Thomas,
> 
> I'm just wondering if you have this problem fixed:
> 	Problem 1 (Fail to mount JFFS2 file system)
> 	Chip not ready after erase suspended: status = 0x1985
> 
> I have the same problem running latest MTD with 2.4.23 on Hitachi SH-4 
> processor.

Is this using cfi_cmdset_0002?  There's a similar known problem:

http://lists.infradead.org/pipermail/linux-mtd/2003-December/009001.html
http://lists.infradead.org/pipermail/linux-mtd/2003-December/009009.html

You might search the list archives for info.

Then again, it might be a different problem.

-- 
Thayne Harbaugh
Linux Networx
