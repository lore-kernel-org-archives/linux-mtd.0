Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19cJTm-00005v-HA
	for <linux-mtd@lists.infradead.org>; Tue, 15 Jul 2003 07:40:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Cristiano Parzani <c.parzani@tattile.com>
In-Reply-To: <000001c34a20$09186b30$1d00a8c0@cristianop>
References: <000001c34a20$09186b30$1d00a8c0@cristianop>
Message-Id: <1058251209.2262.118.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 15 Jul 2003 07:40:09 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: FAT16 reserved sector determination
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-07-14 at 16:53, Cristiano Parzani wrote:
> Hi to all,
> 
> i have a nice question for anyone expert with FAT. I have bought a
> Secure Digital and I want to write my own code for FAT16 on it. 

But we already _have_ FAT support. We don't have support for "FAT16 on
SD", or "FAT16 on floppy" or "FAT16 on hard drive" or "FAT16 on MMC" or
anything so specific -- we have generic FAT support which works on any
block device.

You just need an appropriate block device driver; ignore FAT totally. 

> I have reached to dump the SD boot sector and a particular thing I have
> noticed:
> 
> number of reserved sector typically = 1 for FAT 16 is 8, and the SD was
> formatted by Windows XP. This is very strange, I have read Windows white
> paper on FAT and it tell that normally for FAT16 this value is 1. 

Perhaps it's done so that the root directory starts in the first sector
of a physical eraseblock? I don't think you need to worry about it too
much, certainly.

-- 
dwmw2
