Received: from rv-out-0708.google.com ([209.85.198.241])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M1eNq-0001oV-H6
	for linux-mtd@lists.infradead.org; Wed, 06 May 2009 10:29:57 +0000
Received: by rv-out-0708.google.com with SMTP id f25so2448531rvb.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 May 2009 03:29:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1241499737.3760.21.camel@localhost.localdomain>
References: <71103bce0904271851v4004cfadp465f8fee2519f836@mail.gmail.com>
	<1241499737.3760.21.camel@localhost.localdomain>
Date: Wed, 6 May 2009 18:29:48 +0800
Message-ID: <71103bce0905060329y21a701d4m7be9f566d786f485@mail.gmail.com>
Subject: Re: ubifs corrupt
From: jerry <jerrydreaming@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/5/5 Artem Bityutskiy <dedekind@infradead.org>:
> On Tue, 2009-04-28 at 09:51 +0800, jerry wrote:
>> > Do you have this patch?
>> >
>> >        http://git.infradead.org/ubifs-2.6.git?a=3Dcommitdiff;h=3Dde097=
5781a1a8bc92e07eb7681d10ef9bb5e6df9
>> >
>> 1.I have  this patch:
>>      http://git.infradead.org/ubifs-2.6.git?a=3Dcommitdiff;h=3Dde0975781=
a1a8bc92e07eb7681d10ef9bb5e6df9
>> 2.The ubifs is updated to 2.6.28.
>> 3. kernel version is 2.6.24.
>> 4.The information:
>> UBIFS error (pid 434): ubifs_read_node: bad node type (255 but expected =
2)
>> UBIFS error (pid 434): ubifs_read_node: bad node at LEB 16:512360
>> Call Trace:
>> [<8002057c>] dump_stack+0x8/0x34
>> [<80187028>] ubifs_read_node+0x3ac/0x404
>> [<801b2aa0>] ubifs_tnc_read_node+0x1c0/0x240
>> [<8018b5b4>] tnc_read_node_nm+0x88/0x28c
>> [<8018cf44>] ubifs_tnc_next_ent+0x1cc/0x300
>> [<8017ef58>] ubifs_readdir+0x210/0x674
>> [<800bf38c>] vfs_readdir+0xd0/0xfc
>> [<800bf424>] sys_getdents64+0x6c/0x100
>> [<800227b0>] stack_done+0x20/0x3c
>> UBIFS error (pid 434): ubifs_readdir: cannot find next direntry, error -=
22
>> UBIFS error (pid 434): ubifs_read_node: bad node type (255 but expected =
2)
>> UBIFS error (pid 434): ubifs_read_node: bad node at LEB 16:512360
>> Call Trace:
>> [<8002057c>] dump_stack+0x8/0x34
>> [<80187028>] ubifs_read_node+0x3ac/0x404
>> [<801b2aa0>] ubifs_tnc_read_node+0x1c0/0x240
>> [<8018b5b4>] tnc_read_node_nm+0x88/0x28c
>> [<8018cf44>] ubifs_tnc_next_ent+0x1cc/0x300
>> [<8017ef58>] ubifs_readdir+0x210/0x674
>> [<800bf38c>] vfs_readdir+0xd0/0xfc
>> [<800bf520>] sys_getdents+0x68/0xfc
>> [<800227b0>] stack_done+0x20/0x3c
>> UBIFS error (pid 434): ubifs_readdir: cannot find next direntry, error -=
22
>> # dmesg
>> ff ff ff                          ........................
>> Call Trace:
>> [<8002057c>] dump_stack+0x8/0x34
>> [<80187028>] ubifs_read_node+0x3ac/0x404
>> [<801b2aa0>] ubifs_tnc_read_node+0x1c0/0x240
>> [<8018b5b4>] tnc_read_node_nm+0x88/0x28c
>> [<8018e298>] ubifs_tnc_locate+0x1e0/0x22c
>> [<8018e32c>] ubifs_tnc_lookup_nm+0x48/0x2a0
>> [<8017fe90>] ubifs_lookup+0xf0/0x358
>> [<800b71fc>] do_lookup+0x1b0/0x1fc
>> [<800b95ec>] __link_path_walk+0x850/0x19a0
>> [<800ba914>] link_path_walk+0x1d8/0x3ac
>> [<800bb0c8>] do_path_lookup+0x188/0x6dc
>> [<800bc0f4>] __user_walk_fd+0x54/0x88
>> [<800a9fec>] sys_faccessat+0xe0/0x198
>> [<800227b0>] stack_done+0x20/0x3c
>> UBIFS error (pid 368): ubifs_read_node: bad node type (255 but expected =
2)
>> UBIFS error (pid 368): ubifs_read_node: bad node at LEB 16:512360
>> Not a node, first 24 bytes:<7>00000000: ff ff ff ff ff ff ff ff ff ff
>> ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>> ........................
>> 5.when I select the UBIFS_FS_DEBUG_CHKS =3D y,the file system is ok.But
>> it is very slow.
>
> Well, the error is that ubifs tries to read a directory entry,
> but finds empty space there. It might be related to the way you
> join you NAND chips.
>
> Could you try to reproduce this error on a simpler setup? E.g.,
> if you do not have multiple chips joined into one, or on nandsim?
>
> --
> Best regards,
> Artem Bityutskiy (=A7=A2=A7=DA=A7=E4=A7=F0=A7=E8=A7=DC=A7=DA=A7=DB =A7=A1=
=A7=E2=A7=E4=A7=D7=A7=DE)
>
>
Ok, I will test  one nandflash(K9GAG08U0M).Thank you for your help,I
will report the result as soon as I can.
If the error has happened,ubifs oughts to recover from it.
when I select the UBIFS_FS_DEBUG_CHKS =3D y,the ubifs file system is
recovered.I think it is recovered only in memory. Why it is not saved
on the nandflash=A3=BF
Thank you for your help again=A3=A1

Best regards=A3=AC
Jerry
