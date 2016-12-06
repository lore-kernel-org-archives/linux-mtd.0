Received: from mail-yb0-x232.google.com ([2607:f8b0:4002:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEAjD-0001oK-MK
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 08:03:59 +0000
Received: by mail-yb0-x232.google.com with SMTP id d59so65004034ybi.1
 for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2016 00:03:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <HE1PR0602MB29722B3E65F95691ECA2175A83820@HE1PR0602MB2972.eurprd06.prod.outlook.com>
References: <CAL-1w2vQHnuDmo-5bsE=Lc-uPpVy4vPU7tNmwkcEasB9uvAZ3A@mail.gmail.com>
 <HE1PR0602MB29722B3E65F95691ECA2175A83820@HE1PR0602MB2972.eurprd06.prod.outlook.com>
From: Rock Lee <rockdotlee@gmail.com>
Date: Tue, 6 Dec 2016 16:03:34 +0800
Message-ID: <CAL-1w2vea-85d4g6SC1xJ1CKLy2CksfudDm-aXhezFbMND5x_Q@mail.gmail.com>
Subject: Re: UBIFS crash in power cutting test
To: "Zhang, Fan (F.)" <fzhang14@yfve.com.cn>
Cc: linux-mtd@lists.infradead.org
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

On Tue, Dec 6, 2016 at 3:37 PM, Zhang, Fan (F.) <fzhang14@yfve.com.cn> wrot=
e:
> Hi lilei
>                 It seems that the ubifs nodes are broken, can you show us=
 more detail about your test? For example your mount option,etc...
>
> ------------------------------------------------------------------------
> Best regards,
> Zhang,fan
> -----------------------------------------------------------------------
>
> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf =
Of =E6=9D=8E=E7=A3=8A
> Sent: 2016=E5=B9=B412=E6=9C=886=E6=97=A5 15:13
> To: linux-mtd@lists.infradead.org
> Subject: UBIFS crash in power cutting test
>
> Hi, there:
>     I'm doing a random power cutting test(just copy and delete files), bu=
t got ubifs crash frequently, the rate is about 20%, is anyone has any hint=
 about this? BTW, the kernel is 3.18.31, here is the log.
>
> [   25.854498] UBIFS DBG lp (pid 349): LEB 50, free 0, dirty 238488, flag=
s 1
> [   25.861248] UBIFS DBG lp (pid 349): LEB 50, free -2147483647, dirty
> 238568, flags 1
> [   25.868868] UBIFS DBG lp (pid 349): LEB 50, free 0, dirty 238488, flag=
s 1
> [   25.875661] UBIFS DBG tnc (pid 349): ino 75997
> [   25.880082] UBIFS DBG tnc (pid 349): (lowest) (75997, xentry, 0x000000=
)
> [   25.886576] UBIFS DBG tnc (pid 349): search key (75997, xentry, 0x0000=
00)
> [   25.893281] UBIFS DBG tnc (pid 349): found 0, lvl 0, n 0
> [   25.898559] UBIFS DBG io (pid 349): LEB 50:196608, xentry node,
> length 73, jhead 1 (base)
> [   25.906734] UBIFS DBG io (pid 349): LEB 50:196608, xentry node, length=
 73
> [   25.919996] UBIFS error (ubi3:0 pid 349): ubifs_read_node: bad node
> type (2 but expected 3)
> [   25.928350] UBIFS error (ubi3:0 pid 349): ubifs_read_node: bad node
> at LEB 50:196608, LEB mapping status 1
> [   25.937979] magic          0x6101831
> [   25.941625] crc            0xc1c19beb
> [   25.945341] node_type      2 (direntry node)
> [   25.949681] group_type     1 (in node group)
> [   25.954041] sqnum          676362
> [   25.957406] len            75
> [   25.960465] key            (75729, direntry, 0x1feecdb6)
> [   25.965826] inum           0
> [   25.968777] type           2
> [   25.971758] nlen           18
> [   25.974765] name           SecureTrust_CA.peR
> [   25.979334] CPU: 0 PID: 349 Comm: mount Not tainted 3.18.31 #2
> [   25.985403] [<c0014b68>] (unwind_backtrace) from [<c0012014>]
> (show_stack+0x10/0x14)
> [   25.992856] [<c0012014>] (show_stack) from [<c02015d8>]
> (ubifs_read_node+0x2c0/0x2f8)
> [   26.000672] [<c02015d8>] (ubifs_read_node) from [<c021d744>]
> (ubifs_tnc_read_node+0x58/0x1c0)
> [   26.009151] [<c021d744>] (ubifs_tnc_read_node) from [<c0202448>]
> (tnc_read_node_nm+0xb4/0x1b8)
> [   26.017767] [<c0202448>] (tnc_read_node_nm) from [<c02057ec>]
> (ubifs_tnc_next_ent+0x1b4/0x220)
> [   26.026361] [<c02057ec>] (ubifs_tnc_next_ent) from [<c02058c4>]
> (ubifs_tnc_remove_ino+0x6c/0x17c)
> [   26.035216] [<c02058c4>] (ubifs_tnc_remove_ino) from [<c020854c>]
> (ubifs_replay_journal+0xe74/0x1540)
> [   26.044532] [<c020854c>] (ubifs_replay_journal) from [<c01fd794>]
> (ubifs_mount+0xbe8/0x15dc)
> [   26.052840] [<c01fd794>] (ubifs_mount) from [<c00fa410>]
> (mount_fs+0x6c/0x164)
> [   26.060018] [<c00fa410>] (mount_fs) from [<c010ff90>]
> (vfs_kern_mount+0x4c/0xe0)
> [   26.067437] [<c010ff90>] (vfs_kern_mount) from [<c0112f34>]
> (do_mount+0x934/0xa38)
> [   26.074910] [<c0112f34>] (do_mount) from [<c0113258>] (SyS_mount+0x70/=
0x9c)
> [   26.081826] [<c0113258>] (SyS_mount) from [<c000e740>]
> (ret_fast_syscall+0x0/0x38)
> [   26.089541] UBIFS DBG tnc (pid 349): key (75997, xentry, 0x5edc87e)
> [   26.096045] UBIFS (ubi3:0): background thread "ubifs_bgt3_0" stops
> mount: mounting /dev/ubi3_0 on /mnt/flash failed: Invalid argument
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Hi, Zhang Fan:
     Here is my mount command:
     "mount -t ubifs /dev/ubi3_0 /mnt/flash -osync,smackfsdef=3D'_',rw"

    Test script:
    #!/bin/bash
     do_test() {
     i=3D0
     while [ 1 =3D=3D 1 ]; do
     echo "count $i"
     i=3D$((i + 1))

     rm -rf /mnt/flash/ufs/test
     sync

     mkdir -p /mnt/flash/ufs/test
     cp /etc/* -rf /mnt/flash/ufs/test && cp /firmware/image/mba* -rf
/mnt/flash/ufs/test || rm -rf /mnt/flash/ufs/test
     sync
    done
    }

    do_test &

    Here was what happened before power cutting(I have turned on ubifs debu=
g):
[ 2820.298090] UBIFS DBG lp (pid 6236): LEB 50, free -2147483647,
dirty 220703, flags 16
[ 2820.306062] UBIFS DBG lp (pid 6236): LEB 50, free 32768, dirty
220632, flags 16
[ 2820.313239] UBIFS DBG tnc (pid 6236): 50:217160, len 160, key (75165, in=
ode)
[ 2820.320302] UBIFS DBG tnc (pid 6236): search and dirty key (75165, inode=
)
[ 2820.326824] UBIFS DBG lp (pid 6236): LEB 26, free 163840, dirty
62992, flags 48
[ 2820.334294] UBIFS DBG lp (pid 6236): LEB 26, free -2147483647,
dirty 63100, flags 48
[ 2820.341933] UBIFS DBG lp (pid 6236): LEB 26, free 163840, dirty
62992, flags 48
[ 2820.349282] UBIFS DBG lp (pid 6236): LEB 22, free 0, dirty 210760, flags=
 34
[ 2820.356455] UBIFS DBG lp (pid 6236): LEB 22, free -2147483647,
dirty 210868, flags 34
[ 2820.364463] UBIFS DBG lp (pid 6236): LEB 22, free 0, dirty 210760, flags=
 34
[ 2820.371143] UBIFS DBG tnc (pid 6236): found 1, lvl 0, n 2
[ 2820.376310] UBIFS DBG lp (pid 6236): LEB 49, free 0, dirty 245832, flags=
 1
[ 2820.383349] UBIFS DBG lp (pid 6236): LEB 49, free -2147483647,
dirty 245992, flags 1
[ 2820.390938] UBIFS DBG lp (pid 6236): LEB 49, free 0, dirty 245832, flags=
 1
[ 2820.397743] UBIFS DBG tnc (pid 6236): 50:217320, len 160, key (75159, in=
ode)
[ 2820.404920] UBIFS DBG tnc (pid 6236): search and dirty key (75159, inode=
)
[ 2820.411418] UBIFS DBG tnc (pid 6236): found 1, lvl 0, n 1
[ 2820.416762] UBIFS DBG lp (pid 6236): LEB 49, free 0, dirty 245992, flags=
 1
[ 2820.423856] UBIFS DBG lp (pid 6236): LEB 49, free -2147483647,
dirty 246152, flags 1
[ 2820.431385] UBIFS DBG lp (pid 6236): LEB 49, free 0, dirty 245992, flags=
 1
[ 2820.438223] UBIFS DBG gen (pid 6236): inode 75165, mode 0x81ed
[ 2820.444253] UBIFS DBG tnc (pid 6236): ino 75165
[ 2820.448436] UBIFS DBG tnc (pid 6236): (lowest) (75165, xentry, 0x000000)
[ 2820.455269] UBIFS DBG tnc (pid 6236): search key (75165, xentry, 0x00000=
0)
[ 2820.461857] UBIFS DBG tnc (pid 6236): found 0, lvl 0, n 0
[ 2820.467188] UBIFS DBG tnc (pid 6236): xent 'security.SMACK64', ino 75166
[ 2820.474125] UBIFS DBG tnc (pid 6236): security.SMACK64, key (75165,
xentry, 0x000000)
[ 2820.481623] UBIFS DBG tnc (pid 6236): search and dirty key (75165,
xentry, 0x000000)
[ 2820.489238] UBIFS DBG lp (pid 6236): LEB 22, free 0, dirty 210872, flags=
 34
[ 2820.496410] UBIFS DBG lp (pid 6236): LEB 22, free -2147483647,
dirty 210980, flags 34
[ 2820.504019] UBIFS DBG lp (pid 6236): LEB 22, free 0, dirty 210872, flags=
 34
[ 2820.511125] UBIFS DBG lp (pid 6236): LEB 22, free 0, dirty 210984, flags=
 34
[ 2820.517880] UBIFS DBG lp (pid 6236): LEB 22, free -2147483647,
dirty 211092, flags 34
[ 2820.525864] UBIFS DBG lp (pid 6236): LEB 22, free 0, dirty 210984, flags=
 34
[ 2820.532682] UBIFS DBG tnc (pid 6236): found 0, lvl 0, n 0
[ 2820.538020] UBIFS DBG tnc (pid 6236): search key (75166, inode)
[ 2820.544040] UBIFS DBG tnc (pid 6236): found 1, lvl 0, n 2
[ 2820.549218] UBIFS DBG tnc (pid 6236): deleting key (75166, inode)
[ 2820.555395] UBIFS DBG lp (pid 6236): LEB 49, free 0, dirty 246152, flags=
 1
[ 2820.562090] UBIFS DBG lp (pid 6236): LEB =C3=B4
