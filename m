Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EFwlI-0007xh-Rj
	for linux-mtd@lists.infradead.org; Thu, 15 Sep 2005 12:39:08 -0400
Message-ID: <4329A39B.3090503@mvista.com>
Date: Thu, 15 Sep 2005 09:38:51 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Konstantin Kletschke <lists@ku-gbr.de>
References: <87ek7qpgfm.wl%kletschke@synertronixx.de>
In-Reply-To: <87ek7qpgfm.wl%kletschke@synertronixx.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to cope with locked flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Konstantin Kletschke wrote:
> How do you people cope with flash devices that power up locked?
> 
> I have intel K3 devices which are unlocked by flash_unlocke in the /etc/inittab
> while booting the system.
> However, if the fs was never mounted before the jffs2 hangs with this
> in an endless loop:
> 
> jffs2_write_dirent in garbage_collect_dirent failed: -30
> Write of 43 bytes at 0x00363928 failed. returned -30, retlen 0
> Not marking the space at 0x00363928 as dirty because the flash driver returned retlen zero
> 
> Is there any help to avoid this situation?

Sounds like your root fs is jffs2; if so I'd suggest using a read-only 
partition for root (using fs such as cramfs), unlock writeable jffs2 
partition from rc script, then mount jffs2.  (It's probably a good thing 
to allow access to system files while the writeable partition is being 
erased/written anyhow, assuming there are multiple chips or the chips 
handle concurrent reads/writes from different chip partitions.)

Some people hack the kernel to unlock writeable partitions during the 
boot sequence.  One of these days should look at adding flags to jffs2 
to unlock the flash at mount time.

Hope that helps,

-- 
Todd
