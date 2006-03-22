Received: from smtp.seznam.cz ([212.80.76.43])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FM9Jl-0001mV-TW
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 14:48:43 -0500
Received: from ladis by orphique with local (Exim 3.36 #1 (Debian))
	id 1FM9Kt-0002e0-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 Mar 2006 20:49:39 +0100
Date: Wed, 22 Mar 2006 20:49:39 +0100
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20060322194939.GA10058@orphique>
References: <20060322115409.GA2242@orphique>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060322115409.GA2242@orphique>
Sender: Ladislav Michl <Ladislav.Michl@seznam.cz>
Subject: Re: jffs2 Oops on mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 22, 2006 at 12:54:09PM +0100, Ladislav Michl wrote:
> Checked all inodes but still 0x13364c bytes of unchecked space?
> Unable to handle kernel NULL pointer dereference at virtual address 00000000
Well, this is harmless (caused by BUG() defined as (*(int *)0 = 0))

With more debugs enabled it ends like this:
Skipping ino #228 already checked
Skipping ino #229 already checked
Skipping ino #270 already checked
Skipping check of ino #273 with nlink zero
[lots of skipping check of ino #xxx with nlink zero]
Skipping check of ino #800 with nlink zero
Skipping check of ino #801 with nlink zero
Skipping ino #802 already checked
Skipping check of ino #803 with nlink zero
Checked all inodes but still 0x13364c bytes of unchecked space?

Where checked_ino is 804 and highest_ino 803. ino 802 is already checked
because userspace requested read meanwhile.

Ideas?

Thanks,
	ladis
