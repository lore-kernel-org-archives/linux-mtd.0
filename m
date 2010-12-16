Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTGfJ-0007K8-42
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2010 16:26:49 +0000
Received: by bwz14 with SMTP id 14so3666598bwz.30
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Dec 2010 08:26:47 -0800 (PST)
Subject: Re: Static UBI volumes and ubiupdatevol ?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1012151129250.7024@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1012150855090.6187@lnxricardw.se.axis.com>
	<Pine.LNX.4.64.1012151129250.7024@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Dec 2010 18:26:15 +0200
Message-ID: <1292516775.2364.108.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-12-15 at 11:43 +0100, Ricard Wanderlof wrote:
> I'm also wondering if anyone has any thoughts on upgrading a 'live' 
> system, when the flash is managed by UBI.
> 
> With a system based on mtd+jffs2 it is actually possible to reflash the 
> partition with the [read only] root file system on it without unmounting, 
> as long as no accesses are made to the physical flash during the rewrite 
> or afterwards. In other words, immediately after reflashing the system 
> must be rebooted.

Hmm, I presume you can do this with UBIFS, but you need to make sure all
the backgound stuff like moving and eraseing eraseblocs is done before
doing this by doing fsync() on your /dev/ubiX_Y device (UBI volume
character device), see the 'vol_cdev_fsync()' function. Ah, and of
course you need to sync UBIFS before this.

Then if you can guarantee that no one is reading writing to it, you can
change the flash.

Another option is to remount R/O, if you can make sure there are no
processes keeping files open in R/W mode.

> However, with UBI, given that there are background threads which might be 
> doing garbage collection etc I'm suspecting such a solution might not be 
> as suitable when the flash is managed by UBI. Or is there a some solution 
> that someone has tried with any level of success?

Just call sync(), then fsync on the UBI volume, and you won't have
background processes if there is not I/O.

Be beware, even reading from UBIFS can cause scrubbing in UBI.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
