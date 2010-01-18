Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NWmUl-0005Wm-UO
	for linux-mtd@lists.infradead.org; Mon, 18 Jan 2010 07:58:00 +0000
In-Reply-To: <cb9ecdfa1001172304q132d5324qa963d0d5cdfb7806@mail.gmail.com>
References: <cb9ecdfa1001172304q132d5324qa963d0d5cdfb7806@mail.gmail.com>
Subject: Re: jffs2_gcd_mtdx thread and umount problem.
To: Johnny Hung <johnny.hacking@gmail.com>
Message-ID: <OF593A1F75.3C3C7D18-ONC12576AF.002B1239-C12576AF.002BB30A@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Mon, 18 Jan 2010 08:57:18 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org,
	linux-embedded@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> Hi All,
>
> I have a customized MPC8313 (ppc arch) board with SPANSION 64MB NOR
> flash, everything works fine but I found a abnormal about JFFS2 flahs
> filesystem.
>
> The system will mount JFFS2 to /mnt/mtd when system boot up. I try to
> execute umount /mnt/mtd or sync or reboot right away after login then
> these commands hangs. Use ps command to check process status and is D
> (Uninterruptible sleep, usually IO). I try to kill jffs2_gcd_mtd4 and
> umount/reboot/syc commands execute successfully. I think
> jffs2_gcd_mtd4 (mount /dev/mtd4) do something in the background so I
> wait for 10 minutes after login and execute the same commands and it
> doesn't hangs.
>
> The following procedure is I to make jffs2 file system and write to
> flash then mount to /mnt/mtd.
>
> 1. mkfs.jffs2 -d mtd -e 0x20000 --pad 0x3080000 -o mtd.jffs2 (erase
> block size is 128KB and jffs2 partition size is 48.5MB)
>
> 2. write jffs2 file system to flash in uboot.
>       tftpboot 200000 mtd.jffs2;                (load mtd.jffs2 to memory)
>       protect off f8f80000 fbffffff;
>       erase f8f80000 fbffffff;                       (erase all 48.5MB)
>       cp.b 200000 f8f80000 $filesize;     (program mtd.jffs2 to flash)
>       protect on f8f80000 fbffffff;
>       cmp.b 200000 f8f80000 $filesize
>
> 3. Add below in /etc/fstab file to mount to /mnt/mtd
>       /dev/mtdblock4  /mnt/mtd        jffs2   defaults        1       1
>
> Does anyone knows what purpose for jffs2_gcd_mtdx thread and why it
> cause umount/sync/reboot commands hangs it is reasonable or  something
> I did wrong?

I guess this is the first reboot after mounting a new JFFS2 FS?
Then JFFS2 is reerasing empty blocks and you will have to wait
until it is done.

I posted a patch long ago for this, but it was racy w.r.t JFSS2 module unload so
it didn't make it into the repo. Search the list for
"[JFFS2] Stop erasing blocks when rebooting." to find my old patch

  Jocke
