Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGiE9-0007iJ-CN
 for linux-mtd@lists.infradead.org; Sat, 25 Jun 2016 07:42:06 +0000
Received: by mail-oi0-x22a.google.com with SMTP id r2so143568269oih.2
 for <linux-mtd@lists.infradead.org>; Sat, 25 Jun 2016 00:41:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <C80AB6F618D91B4E8F391CB202C12DFD11218919BD@LGEVEXMBHQSVC1.LGE.NET>
References: <C80AB6F618D91B4E8F391CB202C12DFD11218919BD@LGEVEXMBHQSVC1.LGE.NET>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 25 Jun 2016 09:41:43 +0200
Message-ID: <CAFLxGvxRtxSSRL5VOEmy1udbnWBYcVf0JDVaMdca0Ww1HTK74w@mail.gmail.com>
Subject: Re: ubifs issue about ubifs_tnc_remove_ino when replay journal
To: =?UTF-8?B?7J206rCA656ML+yjvOyehOyXsOq1rOybkOOAiVNXIFBsYXRmb3JtKOyXsClBT1TtjIAoa2FyYW0u?=
 =?UTF-8?B?bGVlQGxnZS5jb20p?= <karam.lee@lge.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?67CV7Iq57Zi4?= <seungho1.park@lge.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 25, 2016 at 8:08 AM, =EC=9D=B4=EA=B0=80=EB=9E=8C/=EC=A3=BC=EC=
=9E=84=EC=97=B0=EA=B5=AC=EC=9B=90=E3=80=89SW
Platform(=EC=97=B0)AOT=ED=8C=80(karam.lee@lge.com) <karam.lee@lge.com> wrot=
e:
> hi mtd-list
>
> I've seen a problem on embedded board with UBIFS/UBI.
> My environment is as follows:
>
> kernel version : 3.10.49
> flash : 512MB nand, 128KB PEB
>
> If a power cut occurs when the system is operating
> a problem occur in a journal replay at reboot.
>
> ubifs_jnl_delete_inode or ubifs_jnl_delete_xattr remove
> all nodes belonging to the extended attribute inode from TNC.
> And it makes the journal to delete the information in flash.
> The journal is applied to flash on reboot.
> However, the GC delete the region before applying journal,
> I guess that the problem occurs.
>
> ------------------ kernel log -------------------------
> [    3.637490]   No soundcard=EF=A3=B7[    3.644631] UBIFS-0: background =
thread "ubifs_bgt0_0" started, PID 108
> [    3.675468] UBIFS-0: recovery needed
> [    4.323462] UBIFS-0 error (pid 1): ubifs_read_node: bad node type (192=
 but expected 3)
> [    4.330341] UBIFS-0 error (pid 1): ubifs_read_node: bad node at LEB 63=
5:58544, LEB mapping status 1
> [    4.339388] Not a node, first 24 bytes:
> [    4.343030] 00000000: 47 5f 49 44 45 4e 54 49 46 49 45 52 3d 6e 65 74 =
6d 67 72 64 c0 05 fd 04                          G_IDENTIFIER=3Dnetmgrd....
> [    4.356051] CPU: 0 PID: 1 Comm: swapper Tainted: G        W    3.10.49=
+ #1
> [    4.362923] [<c00143b8>] (unwind_backtrace+0x0/0xe0) from [<c00118a8>]=
 (show_stack+0x10/0x14)
> [    4.371419] [<c00118a8>] (show_stack+0x10/0x14) from [<c01ba514>] (ubi=
fs_read_node+0x240/0x27c)
> [    4.380089] [<c01ba514>] (ubifs_read_node+0x240/0x27c) from [<c01d41a4=
>] (ubifs_tnc_read_node+0x48/0x130)
> [    4.389651] [<c01d41a4>] (ubifs_tnc_read_node+0x48/0x130) from [<c01bb=
2d4>] (tnc_read_node_nm+0xb4/0x1b8)
> [    4.399196] [<c01bb2d4>] (tnc_read_node_nm+0xb4/0x1b8) from [<c01be624=
>] (ubifs_tnc_next_ent+0x144/0x18c)
> [    4.408744] [<c01be624>] (ubifs_tnc_next_ent+0x144/0x18c) from [<c01be=
6b0>] (ubifs_tnc_remove_ino+0x44/0x124)
> [    4.418641] [<c01be6b0>] (ubifs_tnc_remove_ino+0x44/0x124) from [<c01c=
0c9c>] (ubifs_replay_journal+0xbdc/0x1130)
> [    4.428796] [<c01c0c9c>] (ubifs_replay_journal+0xbdc/0x1130) from [<c0=
1b6a50>] (ubifs_mount+0xb80/0x1568)
> [    4.438352] [<c01b6a50>] (ubifs_mount+0xb80/0x1568) from [<c00d9a40>] =
(mount_fs+0x10/0xb4)
> [    4.446593] [<c00d9a40>] (mount_fs+0x10/0xb4) from [<c00f11dc>] (vfs_k=
ern_mount+0x48/0xc4)
> [    4.454838] [<c00f11dc>] (vfs_kern_mount+0x48/0xc4) from [<c00f35d4>] =
(do_mount+0x6a8/0x79c)
> [    4.463258] [<c00f35d4>] (do_mount+0x6a8/0x79c) from [<c00f374c>] (SyS=
_mount+0x84/0xb8)
> [    4.471245] [<c00f374c>] (SyS_mount+0x84/0xb8) from [<c09cedd4>] (moun=
t_block_root+0xf8/0x274)
> [    4.479824] [<c09cedd4>] (mount_block_root+0xf8/0x274) from [<c09cf124=
>] (prepare_namespace+0x88/0x1b8)
> [    4.489212] [<c09cf124>] (prepare_namespace+0x88/0x1b8) from [<c09ceb9=
0>] (kernel_init_freeable+0x170/0x1b4)
> [    4.499023] [<c09ceb90>] (kernel_init_freeable+0x170/0x1b4) from [<c06=
b9c1c>] (kernel_init+0x8/0xe4)
> [    4.508136] [<c06b9c1c>] (kernel_init+0x8/0xe4) from [<c000dc98>] (ret=
_from_fork+0x14/0x3c)
> [    4.517918] UBIFS-0: background thread "ubifs_bgt0_0" stops
> ------------------ kernel log -------------------------
>
> The following message has been reporting on the mailing list in the past.
> This message is similar to my problem.
>
> 2014 jul 12 ubifs issue about xattr node when replay journal :
> -------------------------------------------
> http://lists.infradead.org/pipermail/linux-mtd/2014-July/054620.html

The author of this thread never answered our question whether Fastmap
was in involved or not. Do you use Fastmap?
Just to rule that possibility out.

--=20
Thanks,
//richard
