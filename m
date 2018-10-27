Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gGVKO-00054V-Lr
 for linux-mtd@lists.infradead.org; Sat, 27 Oct 2018 20:37:02 +0000
Received: by mail-wm1-x344.google.com with SMTP id q12-v6so1645427wmq.0
 for <linux-mtd@lists.infradead.org>; Sat, 27 Oct 2018 13:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <14ebdb35-43e6-47b6-e947-2d9f9cee100b@candelatech.com>
In-Reply-To: <14ebdb35-43e6-47b6-e947-2d9f9cee100b@candelatech.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 27 Oct 2018 22:36:36 +0200
Message-ID: <CAFLxGvzhaXFo8B6F9=MxXfs6kq3BH-buRZQAT8nz=mqSOOGBRA@mail.gmail.com>
Subject: Re: read-only FS with error -2
To: greearb@candelatech.com
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ben,

On Fri, Oct 26, 2018 at 8:39 PM Ben Greear <greearb@candelatech.com> wrote:
>
> Hello,
>
> I did something to my OpenWRT system (running 4.14.78 + 4.19 backports kernel),

What did you do? :)

> and it went read-only.  Upon reboot, it is still read-only.  Is there something
> I can to do debug and/or fix this?
>
> root@LF-R7800-6ab8:/home/lanforge# dmesg|grep -i ubif
> [   11.595662] UBIFS (ubi0:1): background thread "ubifs_bgt0_1" started, PID 143
> [   11.674298] UBIFS (ubi0:1): recovery needed
> [   12.028518] UBIFS (ubi0:1): recovery completed
> [   12.028598] UBIFS (ubi0:1): UBIFS: mounted UBI device 0, volume 1, name "rootfs_data"
> [   12.031847] UBIFS (ubi0:1): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
> [   12.039815] UBIFS (ubi0:1): FS size: 83042304 bytes (79 MiB, 654 LEBs), journal size 4190208 bytes (3 MiB, 33 LEBs)
> [   12.049711] UBIFS (ubi0:1): reserved for root: 3922293 bytes (3830 KiB)
> [   12.059957] UBIFS (ubi0:1): media format: w4/r0 (latest is w5/r0), UUID 036CCB1F-5608-4069-B5A0-D22544398634, small LPT model
> [   12.085050] mount_root: switching to ubifs overlay
> [   31.942522] UBIFS error (ubi0:1 pid 570): ubifs_iget: failed to read inode 1623, error -2

Hmm, UBIFS is unable to find a inode on your MTD.
Can you please mount UBIFS again with "/sys/kernel/debug/ubifs/chk_fs" set to 1?
This will run a self-check and give us maybe more details.

Did you see in the past odd logs? ECC errors or such?

-- 
Thanks,
//richard
