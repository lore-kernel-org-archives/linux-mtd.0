Received: from mail-bw0-f160.google.com ([209.85.218.160])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LycU7-0007CD-MC
	for linux-mtd@lists.infradead.org; Tue, 28 Apr 2009 01:51:54 +0000
Received: by bwz4 with SMTP id 4so295266bwz.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Apr 2009 18:51:46 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 28 Apr 2009 09:51:46 +0800
Message-ID: <71103bce0904271851v4004cfadp465f8fee2519f836@mail.gmail.com>
Subject: ubifs corrupt
From: jerry <jerrydreaming@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> jerry wrote:
>>
>> Hi Adrian,
>>
>> I'm getting some problem with UBIFS when the power is switched off abrup=
tly
>>=A0 during a write to flash(nandflash 2k/page). In the next boot the cont=
ents of
>>=A0 the file is not found and prints the following information.
>>
>> UBIFS error (pid 358): ubifs_check_node: bad magic 0xffffffff,
>> expected 0x6101831
>> UBIFS error (pid 358): ubifs_check_node: bad node at LEB 27:251264
>> UBIFS error (pid 358): ubifs_read_node: expected node type 2
>> UBIFS error (pid 358): ubifs_check_node: bad magic 0xffffffff,
>> expected 0x6101831
>> UBIFS error (pid 358): ubifs_check_node: bad node at LEB 27:251264
>> UBIFS error (pid 358): ubifs_read_node: expected node type 2
>> problem renaming the file /Settings/qpe.conf.new to /Settings/qpe.conf
>> UBIFS error (pid 358): ubifs_check_node: bad magic 0xffffffff,
>> expected 0x6101831
>> UBIFS error (pid 358): ubifs_check_node: bad node at LEB 27:251264
>> UBIFS error (pid 358): ubifs_read_node: expected node type 2
>>
>> I think the qpe.conf is writting when the power is off and The problem
>> is reproducable.
>>
>> Please could you tell me if this is a known issue.
>
> Do you have this patch?
>
>=A0=A0=A0=A0=A0=A0=A0 http://git.infradead.org/ubifs-2.6.git?a=3Dcommitdif=
f;h=3Dde0975781a1a8bc92e07eb7681d10ef9bb5e6df9
>
1.I have=A0 this patch:
=A0=A0=A0=A0 http://git.infradead.org/ubifs-2.6.git?a=3Dcommitdiff;h=3Dde09=
75781a1a8bc92e07eb7681d10ef9bb5e6df9
2.The ubifs is updated to 2.6.28.
3. kernel version is 2.6.24.
4.The information:
UBIFS error (pid 434): ubifs_read_node: bad node type (255 but expected 2)
UBIFS error (pid 434): ubifs_read_node: bad node at LEB 16:512360
Call Trace:
[<8002057c>] dump_stack+0x8/0x34
[<80187028>] ubifs_read_node+0x3ac/0x404
[<801b2aa0>] ubifs_tnc_read_node+0x1c0/0x240
[<8018b5b4>] tnc_read_node_nm+0x88/0x28c
[<8018cf44>] ubifs_tnc_next_ent+0x1cc/0x300
[<8017ef58>] ubifs_readdir+0x210/0x674
[<800bf38c>] vfs_readdir+0xd0/0xfc
[<800bf424>] sys_getdents64+0x6c/0x100
[<800227b0>] stack_done+0x20/0x3c
UBIFS error (pid 434): ubifs_readdir: cannot find next direntry, error -22
UBIFS error (pid 434): ubifs_read_node: bad node type (255 but expected 2)
UBIFS error (pid 434): ubifs_read_node: bad node at LEB 16:512360
Call Trace:
[<8002057c>] dump_stack+0x8/0x34
[<80187028>] ubifs_read_node+0x3ac/0x404
[<801b2aa0>] ubifs_tnc_read_node+0x1c0/0x240
[<8018b5b4>] tnc_read_node_nm+0x88/0x28c
[<8018cf44>] ubifs_tnc_next_ent+0x1cc/0x300
[<8017ef58>] ubifs_readdir+0x210/0x674
[<800bf38c>] vfs_readdir+0xd0/0xfc
[<800bf520>] sys_getdents+0x68/0xfc
[<800227b0>] stack_done+0x20/0x3c
UBIFS error (pid 434): ubifs_readdir: cannot find next direntry, error -22
# dmesg
ff ff ff=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 ........................
Call Trace:
[<8002057c>] dump_stack+0x8/0x34
[<80187028>] ubifs_read_node+0x3ac/0x404
[<801b2aa0>] ubifs_tnc_read_node+0x1c0/0x240
[<8018b5b4>] tnc_read_node_nm+0x88/0x28c
[<8018e298>] ubifs_tnc_locate+0x1e0/0x22c
[<8018e32c>] ubifs_tnc_lookup_nm+0x48/0x2a0
[<8017fe90>] ubifs_lookup+0xf0/0x358
[<800b71fc>] do_lookup+0x1b0/0x1fc
[<800b95ec>] __link_path_walk+0x850/0x19a0
[<800ba914>] link_path_walk+0x1d8/0x3ac
[<800bb0c8>] do_path_lookup+0x188/0x6dc
[<800bc0f4>] __user_walk_fd+0x54/0x88
[<800a9fec>] sys_faccessat+0xe0/0x198
[<800227b0>] stack_done+0x20/0x3c
UBIFS error (pid 368): ubifs_read_node: bad node type (255 but expected 2)
UBIFS error (pid 368): ubifs_read_node: bad node at LEB 16:512360
Not a node, first 24 bytes:<7>00000000: ff ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff ff ff ff ff ff ff ff
........................
5.when I select the UBIFS_FS_DEBUG_CHKS =3D y,the file system is ok.But
it is very slow.
Thanks for your help !
Regards,
jerry
