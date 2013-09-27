Received: from mail-la0-x235.google.com ([2a00:1450:4010:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPXv1-00032t-6q
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2013 13:17:17 +0000
Received: by mail-la0-f53.google.com with SMTP id el20so2165984lab.12
 for <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2013 06:16:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <52458377.7040100@nod.at>
References: <1380286316-29911-1-git-send-email-richard.genoud@gmail.com>
 <52458377.7040100@nod.at>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 27 Sep 2013 15:16:32 +0200
Message-ID: <CACQ1gAjcoW=mKS97t0HPYP6NXy92Cwm5YFriydPcke3N6LoB_A@mail.gmail.com>
Subject: Re: [PATCH] UBI: fastmap: fix backward compatibility with image_seq
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/9/27 Richard Weinberger <richard@nod.at>:
> Am 27.09.2013 14:51, schrieb Richard Genoud:
>> Some old UBI implementations (e.g. U-Boot) have not implemented the image
>> sequence feature.
>> So, when erase blocks are written, the image sequence in the ec header
>> is lost (set to zero).
>> UBI scan_all() takes this case into account (commits
>> 32bc4820287a1a03982979515949e8ea56eac641 and
>> 2eadaad67b2b6bd132eda105128d2d466298b8e3)
>>
>> But fastmap scan functions (ubi_scan_fastmap() and scan_pool()) didn't.
>>
>> This patch fixes the issue.
>>
>> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
>> ---
>
> W00t! Good catch!
>
> Acked-by: Richard Weinberger <richard@nod.at>
Thanks :)


There's still an error when the image sequence is bad:
[   35.632812] UBI error: scan_pool: bad image seq: 0x0, expected: 0x6e452f03
[   35.640625] UBI error: ubi_scan_fastmap: Attach by fastmap failed,
doing a full scan!
[   35.648437] kmem_cache_destroy ubi_ainf_peb_slab: Slab cache still
has objects  <- the destroy_ai in line 1415
[   35.656250] CPU: 0 PID: 486 Comm: ubiattach Not tainted 3.11.1 #38
[   35.656250] [<c001283c>] (unwind_backtrace+0x0/0xe0) from
[<c0010a24>] (show_stack+0x10/0x14)
[   35.671875] [<c0010a24>] (show_stack+0x10/0x14) from [<c019b9e4>]
(destroy_ai+0x230/0x244)
[   35.679687] [<c019b9e4>] (destroy_ai+0x230/0x244) from [<c019d334>]
(ubi_attach+0x1f8/0x390)
[   35.687500] [<c019d334>] (ubi_attach+0x1f8/0x390) from [<c0191a18>]
(ubi_attach_mtd_dev+0x2b8/0x86c)
[   35.695312] [<c0191a18>] (ubi_attach_mtd_dev+0x2b8/0x86c) from
[<c0192208>] (ctrl_cdev_ioctl+0xd0/0x184)
[   35.703125] [<c0192208>] (ctrl_cdev_ioctl+0xd0/0x184) from
[<c007ef4c>] (vfs_ioctl+0x28/0x3c)
[   35.710937] [<c007ef4c>] (vfs_ioctl+0x28/0x3c) from [<c007f974>]
(do_vfs_ioctl+0x4e8/0x54c)
[   35.718750] [<c007f974>] (do_vfs_ioctl+0x4e8/0x54c) from
[<c007fa0c>] (SyS_ioctl+0x34/0x58)
[   35.726562] [<c007fa0c>] (SyS_ioctl+0x34/0x58) from [<c000e3c0>]
(ret_fast_syscall+0x0/0x2c)

I'll look into that

Richard
