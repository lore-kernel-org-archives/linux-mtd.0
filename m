From: David Woodhouse <dwmw2@infradead.org>
To: Philippe <philippe@accuitee.com>
In-Reply-To: <000001c3e427$947bbaa0$247dfea9@jennifer>
References: <000001c3e427$947bbaa0$247dfea9@jennifer>
Content-Type: text/plain
Message-Id: <1075133878.27507.15.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 26 Jan 2004 16:17:59 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: RE : DOC2k booting speed ...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-01-26 at 17:15 +0100, Philippe wrote:
> Is there another way to 
>  1) boot from the DOC, 
>  2) build up the OS filesystem 
>  3) umount the DOC ? -> protect filesystem in case of unexpected powerdown

Perhaps you could use a read-only file system on the DiskOnChip, and use
a ramfs for those areas of the file system which you need to be
writable?

If you mount a ramfs on /mnt/ramfs, you can make symlinks into it from
the 'real' file system.

-- 
dwmw2
