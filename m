Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B0jos-00084A-FQ
	for linux-mtd@lists.infradead.org; Tue, 09 Mar 2004 16:11:02 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Simon Haynes <simon@baydel.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 9 Mar 2004 15:33:09 +0000
References: <403C6FC3.1941.DDC08@localhost>
	<1078327901.4619.21.camel@hades.cambridge.redhat.com>
	<AC8EC7070E8A@baydel.com>
In-Reply-To: <AC8EC7070E8A@baydel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <B1CA6BCA5B0C@baydel.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 08 Mar 2004 3:10 pm, Simon Haynes wrote:
> On Wednesday 03 Mar 2004 3:31 pm, David Woodhouse wrote:
> > On Thu, 2004-02-26 at 11:08 +0000, Simon Haynes wrote:
> > > Beyond that I don't really know what I am looking for in the log. I can
> ofs 0x00c00400 has already been seen. Skipping
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00c00408:
> 0x273c instead

Since lunch interrupted our converstation yesterday I have tried a few 
things. The SMC partition I was using was 64 Mb and contained a bad block. I 
modified the kernel to make this partition 48Mb. I booted root over nfs and 
tried to rebuild root on the SMC. I can no longer mount the original SMC so I 
tried a new one which worked OK.

-bash-2.05b# /mtd/eraseall /dev/mtd1 > /dev/null
nand_erase: attempt to erase a bad block at page 0x0001ee60

/mtd/eraseall: /dev/mtd1: MTD Erase failure: Input/output error
-bash-2.05b# mount -t jffs2 /dev/ram1 /smc
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 2047, bad_blocks 0, c->nr_blocks 2048
mount: wrong fs type, bad option, bad superblock on /dev/ram1,
       or too many mounted file systems
-bash-2.05b# /mtd/eraseall /dev/mtd1 > /dev/null
-bash-2.05b# mount -t jffs2 /dev/ram1 /smc
-bash-2.05b#

After 5 reboots the new SMC gave this magic bitmask failure.

jffs2: Erase block size too small (16KiB). Using virtual blocks size (32KiB) 
instead
ofs 0x000a8400 has already been seen. Skipping, jeb 0xa8000, sector size 
0x8000
saved ofs 0x000a8000, previous 0xa7fff, buf_len 0x7c00, scanned 0x0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a8408: 0x273c 
instead, 0x0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a841c: 0x000b 
instead, 0x0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a8420: 0x404d 
.
.
.

It would appear that the first buffer location does not contain 0xFFFFFFFF 
and cleanmarkerfound is set but I don't know what this means to JFFS2.

I then switched the partition back to 64Mb, set the kernel to use the read 
only block device and hacked the MAJOR number for JFFS2 to be the same as 
/dev/ram. I have rebooted the system at least 20 times and as yet I have not 
seen any errors. 

I am unsure as where to go next besides trying more reboots.

Any ideas ?


Cheers

Simon.
