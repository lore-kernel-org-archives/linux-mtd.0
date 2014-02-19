Received: from mail2.lawo.de ([80.149.95.33] helo=ExchangeEdge1.lawo.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG52T-0004Ck-Nv
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2014 11:10:07 +0000
From: "Ziegler, Emanuel (Lawo AG)" <Emanuel.Ziegler@lawo.com>
To: Richard Weinberger <richard@nod.at>, Bill Pringlemeir
 <bpringlemeir@nbsps.com>, "Wiedemer, Thorsten (Lawo AG)"
 <Thorsten.Wiedemer@lawo.com>
Date: Wed, 19 Feb 2014 12:09:35 +0100
Subject: RE: UBI leb_write_unlock NULL pointer Oops (continuation)
Message-ID: <D7B1B5F4F3F27A4CB073BF422331203F2A1EDFA433@Exchange1.lawo.de>
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
 <52EF772D.8080207@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>
 <52EF9FFE.4020405@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
 <52F1F658.9080701@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCF6AE@Exchange1.lawo.de>
 <87zjlxy8lj.fsf@nbsps.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCFB51@Exchange1.lawo.de>
 <87txc4w698.fsf@nbsps.com>
 <87ppmsw5sw.fsf@nbsps.com>, <52FBDE01.9030207@nod.at>,
 <D7B1B5F4F3F27A4CB073BF422331203F2A1EDFA41B@Exchange1.lawo.de>
In-Reply-To: <D7B1B5F4F3F27A4CB073BF422331203F2A1EDFA41B@Exchange1.lawo.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

We were able to reproduce the error with function trace enabled, and got th=
e following output.
If was too big for pastebin, so i split it into different pastes.

Function Trace Part 1
http://pastebin.com/ugBsJH83
Function Trace Part 2
http://pastebin.com/tBCjLXLj
Function Trace Part 3
http://pastebin.com/FgUZcN4e
Function Trace Part 4
http://pastebin.com/nebyz4XU


>We also were able to reproduce the error with the activated DEBUG_LOCK_ALL=
OC flag, with the following results.
>
>UBIFS error (pid 7625): ubifs_readdir: cannot find next direntry, error -2=
2
>UBIFS assert failed in ubifs_tnc_next_ent at 2776 (pid 7625)
>[<c001795c>] (unwind_backtrace+0x0/0xf0) from [<c01e0318>] (ubifs_tnc_next=
_ent+0x18c/0x19c)
>[<c01e0318>] (ubifs_tnc_next_ent+0x18c/0x19c) from [<c01d22d4>] (ubifs_rea=
ddir+0x308/0x508)
>[<c01d22d4>] (ubifs_readdir+0x308/0x508) from [<c00d5914>] (vfs_readdir+0x=
80/0xa4)
>[<c00d5914>] (vfs_readdir+0x80/0xa4) from [<c00d5ad0>] (sys_getdents64+0x6=
4/0xc8)
>[<c00d5ad0>] (sys_getdents64+0x64/0xc8) from [<c0012a20>] (ret_fast_syscal=
l+0x0/0x2c)
>UBIFS error (pid 7625): ubifs_validate_entry: bad extended attribute entry=
 node
>[<c001795c>] (unwind_backtrace+0x0/0xf0) from [<c01dce80>] (lnc_add_direct=
ly+0x78/0xc4)
>[<c01dce80>] (lnc_add_directly+0x78/0xc4) from [<c01dcf80>] (matches_name+=
0xb4/0xcc)
>[<c01dcf80>] (matches_name+0xb4/0xcc) from [<c01dcfd4>] (resolve_collision=
+0x3c/0x2ec)
>[<c01dcfd4>] (resolve_collision+0x3c/0x2ec) from [<c01e02cc>] (ubifs_tnc_n=
ext_ent+0x140/0x19c)
>[<c01e02cc>] (ubifs_tnc_next_ent+0x140/0x19c) from [<c01d22d4>] (ubifs_rea=
ddir+0x308/0x508)
>[<c01d22d4>] (ubifs_readdir+0x308/0x508) from [<c00d5914>] (vfs_readdir+0x=
80/0xa4)
>[<c00d5914>] (vfs_readdir+0x80/0xa4) from [<c00d5ad0>] (sys_getdents64+0x6=
4/0xc8)
>[<c00d5ad0>] (sys_getdents64+0x64/0xc8) from [<c0012a20>] (ret_fast_syscal=
l+0x0/0x2c)
>        magic          0x6101831
>        crc            0x8ae44db2
>        node_type      0 (inode node)
>        group_type     0 (no node group)
>        sqnum          20716
>        len            160
>        key            (954, inode)
>        creat_sqnum    20501
>        size           288
I think the error we seen in the case is related to the following patch and=
 is not related
http://lists.infradead.org/pipermail/linux-mtd/2013-June/047359.html

We port the patches to our Kernel and will try to reproduce it again.


Best Regards
Emanuel
