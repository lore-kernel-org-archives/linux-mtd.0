Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbSmu-0002EU-Ew
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 07:32:49 +0000
Received: by pwi3 with SMTP id 3so3951636pwi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2011 00:32:44 -0700 (PDT)
Subject: Re: [Ubifs] Reboot -> "recovery needed"?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gilles <gilles.ganault@free.fr>
Date: Tue, 28 Jun 2011 10:33:34 +0300
In-Reply-To: <1rhb079etc7nr1tasfal6eag1d6lmfhd73@4ax.com>
References: <1rhb079etc7nr1tasfal6eag1d6lmfhd73@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309246418.23597.31.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2011-06-25 at 13:34 +0200, Gilles wrote:
> Hello
> 
> 	The root filesystem lives in a partition on a NAND, and I noticed
> that after running "reboot", at the next boot, I get this message:
> 
> ===============
> ...
> UBIFS: recovery needed
> UBIFS: recovery completed
> UBIFS: mounted UBI device 0, volume 0, name "rootfs"
> UBIFS: file system size:   251596800 bytes (245700 KiB, 239 MiB, 1950
> LEBs)
> UBIFS: journal size:       9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
> UBIFS: media format:       w4/r0 (latest is w4/r0)
> UBIFS: default compressor: lzo
> UBIFS: reserved for root:  0 bytes (0 KiB)
> VFS: Mounted root (ubifs filesystem) on device 0:10.
> ===============
> 
> Is this the way Ubifs works, or should I run a command prior to
> "reboot"?

Your reboot command does not unmount the file-system, so from UBIFS's
point of view you do unclean reboot, and UBIFS needs to do recovery.

-- 
Best Regards,
Artem Bityutskiy
