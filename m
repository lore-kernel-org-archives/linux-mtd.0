Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEoAI-0003oL-VT
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 15:57:27 +0000
Date: Tue, 15 Jan 2008 16:48:31 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: "Lin, Bin (Bin)" <Bin.Lin@lsi.com>
Subject: Re: Slow mount of JFFS2 root file system
Message-ID: <20080115154831.GB22338@lazybastard.org>
References: <BBF94D674CC54C48B62BD0667061E8490199FA73@PAUMAILU02.ags.agere.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BBF94D674CC54C48B62BD0667061E8490199FA73@PAUMAILU02.ags.agere.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 January 2008 09:22:04 -0500, Lin, Bin (Bin) wrote:
> 
> I have ARM9 systems with JFFS2 root file system. For some reasons, e.g.
> system crash or power failure, when system boots up next time, it takes
> much longer time than usual to mount jffs2 root file system. It can hang
> at following message for 3-10 min. Once this happens, the mount will
> take the same long time in every reboot later on. Even though it take
> long time to mount root file system, the system can still come up and
> function well. This problem occurred in less than 10% of boards in the
> field, but can not be reproduced in the lab. I have been struggling with
> this is issue for weeks.

What stops you from retrieving one such board from the field?  Should be
easy to debug once you have it on your desk.

Jörn

-- 
Prosperity makes friends, adversity tries them.
-- Publilius Syrus
