Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gGj57-00077w-Dk
 for linux-mtd@lists.infradead.org; Sun, 28 Oct 2018 11:18:11 +0000
From: Richard Weinberger <richard@nod.at>
To: Ben Greear <greearb@candelatech.com>, linux-mtd@lists.infradead.org
Subject: Re: read-only FS with error -2
Date: Sun, 28 Oct 2018 12:17:54 +0100
Message-ID: <1802789.Q3TFOnfEdj@blindfold>
In-Reply-To: <5400505c-8f52-da00-e607-cf0b68a1f93f@candelatech.com>
References: <14ebdb35-43e6-47b6-e947-2d9f9cee100b@candelatech.com>
 <CAFLxGvzhaXFo8B6F9=MxXfs6kq3BH-buRZQAT8nz=mqSOOGBRA@mail.gmail.com>
 <5400505c-8f52-da00-e607-cf0b68a1f93f@candelatech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ben,

Am Sonntag, 28. Oktober 2018, 00:37:33 CET schrieb Ben Greear:
> > What did you do? :)
> 
> Well, I created 64 station vdevs on an ath10k NIC, which if nothing else, was hitting a zillion
> WARN_ON bugs in the mac80211 stack.  That flooded dmesg so I don't know if there
> were any more serious bugs earlier on.

Hmm, a WARN_ON itself is no problem but maybe the driver corrupted kernel memory and confused UBIFS.
I saw such issues more than once.
Linux is not a microkernel. :-)
 
> >> and it went read-only.  Upon reboot, it is still read-only.  Is there something
> >> I can to do debug and/or fix this?
> >>
> >> root@LF-R7800-6ab8:/home/lanforge# dmesg|grep -i ubif
> >> [   11.595662] UBIFS (ubi0:1): background thread "ubifs_bgt0_1" started, PID 143
> >> [   11.674298] UBIFS (ubi0:1): recovery needed
> >> [   12.028518] UBIFS (ubi0:1): recovery completed
> >> [   12.028598] UBIFS (ubi0:1): UBIFS: mounted UBI device 0, volume 1, name "rootfs_data"
> >> [   12.031847] UBIFS (ubi0:1): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
> >> [   12.039815] UBIFS (ubi0:1): FS size: 83042304 bytes (79 MiB, 654 LEBs), journal size 4190208 bytes (3 MiB, 33 LEBs)
> >> [   12.049711] UBIFS (ubi0:1): reserved for root: 3922293 bytes (3830 KiB)
> >> [   12.059957] UBIFS (ubi0:1): media format: w4/r0 (latest is w5/r0), UUID 036CCB1F-5608-4069-B5A0-D22544398634, small LPT model
> >> [   12.085050] mount_root: switching to ubifs overlay
> >> [   31.942522] UBIFS error (ubi0:1 pid 570): ubifs_iget: failed to read inode 1623, error -2
> >
> > Hmm, UBIFS is unable to find a inode on your MTD.
> > Can you please mount UBIFS again with "/sys/kernel/debug/ubifs/chk_fs" set to 1?
> > This will run a self-check and give us maybe more details.
> >
> > Did you see in the past odd logs? ECC errors or such?
> 
> I reinstalled already, and the problem went away.  How exactly would I
> do that test above?  The root file system is RO on bootup in the problem
> case...would I remount root after twiddling the debugfs flag?

You need to set the flag before mounting UBIFS.
If UBIFS is the rootfs, boot from somewhere else. e.g. NFS.
Or do it in an initramfs.

Thanks,
//richard
