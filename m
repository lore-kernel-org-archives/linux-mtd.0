From: David Woodhouse <dwmw2@infradead.org>
To: simon@baydel.com
In-Reply-To: <B1CA6BCA5B0C@baydel.com>
References: <403C6FC3.1941.DDC08@localhost>
	 <1078327901.4619.21.camel@hades.cambridge.redhat.com>
	 <AC8EC7070E8A@baydel.com>  <B1CA6BCA5B0C@baydel.com>
Content-Type: text/plain
Message-Id: <1079453688.16952.40.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 16 Mar 2004 16:14:48 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-03-09 at 15:33 +0000, Simon Haynes wrote:
> -bash-2.05b# mount -t jffs2 /dev/ram1 /smc
> Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
> empty_blocks 2047, bad_blocks 0, c->nr_blocks 2048
> mount: wrong fs type, bad option, bad superblock on /dev/ram1,
>        or too many mounted file systems

This I believe we put down to user error?

> After 5 reboots the new SMC gave this magic bitmask failure.
> 
> jffs2: Erase block size too small (16KiB). Using virtual blocks size (32KiB) 
> instead
> ofs 0x000a8400 has already been seen. Skipping, jeb 0xa8000, sector size 
> 0x8000
> saved ofs 0x000a8000, previous 0xa7fff, buf_len 0x7c00, scanned 0x0
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a8408: 0x273c 
> instead, 0x0

That was a bug in the scanning code. Should be fixed in v1.58 of scan.c
in CVS. Please could you try that and let me know if it works?

-- 
dwmw2
