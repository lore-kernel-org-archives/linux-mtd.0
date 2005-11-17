Received: from zproxy.gmail.com ([64.233.162.194])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EcpFD-0005A1-So
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2005 14:16:37 -0500
Received: by zproxy.gmail.com with SMTP id m22so2035686nzf
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Nov 2005 11:16:27 -0800 (PST)
Message-ID: <6934efce0511171116t337193d1g57d52c3afe6d688d@mail.gmail.com>
Date: Thu, 17 Nov 2005 11:16:26 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: Achin Gupta <achin.gupta@conexant.com>
In-Reply-To: <4D6E93075B31154298572E6B73CA849D02DBC3B8@noida-mail.bbnet.ad>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <4D6E93075B31154298572E6B73CA849D02DBC3B8@noida-mail.bbnet.ad>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Kernel crashes during bootup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/15/05, Achin Gupta <achin.gupta@conexant.com> wrote:
> Hi,
> I am trying to add support for an Intel NOR flash device on my ARM
> 1026EJ-S board. I am using Linux version 2.6.11.12. As mentioned in the
> "mtd-jffs-HOWTO.txt", I was able to patch my kernel with the latest MTD
> code (I checked it out today). However during kernel bootup, I get the
> following crash :-
>
> >>>>>>>>>.
> physmap flash device: 1000000 at 38000000
> phys_mapped_flash: Found 1 x16 devices at 0x0 in 8-bit bank
>  Intel/Sharp Extended Query Table at 0x0031
> Using buffer write method
> cfi_cmdset_0001: Erase suspend on write enabled
> cmdlinepart partition parsing not available
> RedBoot partition parsing not available
> mtd: Giving out device 0 to phys_mapped_flash
> Unable to handle kernel NULL pointer dereference at virtual address
> 00000000
> pgd =3D c0014000
> [00000000] *pgd=3D00000000
> Internal error: Oops: 5 [#1]
> Modules linked in:
> CPU: 0
> PC is at vsnprintf+0x7c/0x578
> LR is at class_simple_device_add+0x7c/0xd0
> pc : [<c00cb554>]    lr : [<c00e5b28>]    Not tainted
> sp : c09cff08  ip : c09cff4c  fp : c09cff48
> r10: c09af9a7  r9 : c09af994  r8 : 00000000
> r7 : fffffff4  r6 : c09cff78  r5 : c09af94c  r4 : c09af940
> r3 : c09af993  r2 : 00000000  r1 : 00000014  r0 : c09af994
> Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
> Control: 5397F  Table: 00014000  DAC: 00000017
> Process swapper (pid: 1, stack limit =3D 0xc09ce194)
> Stack: (0xc09cff08 to 0xc09d0000)
> ff00:                   c09cff14 c00c7fa8 c00c7e28 00000000 00000014
> 00000000
> ff20: c09af940 c09af94c c09da380 fffffff4 00000000 00000000 05a00000
> c09cff70
> ff40: c09cff4c c00e5b28 c00cb4e4 c0bf0800 c01b423c c017ffc4 c017ffd4
> 00000000
> ff60: 00000000 c09cff94 c09cff78 c00f7670 c00e5abc 00000000 c0164f5c
> 00000000
> ff80: c017fff4 c0bf0800 c09cffb4 c09cff98 c00f5c1c c00f763c 00000000
> c01b4284
> ffa0: 00000000 c01b4290 c09cffd4 c09cffb8 c0025c98 c00f5ba0 c00292e8
> c09ce000
> ffc0: 00000000 c0029308 c09cfff4 c09cffd8 c002b0e0 c0025b6c 00000000
> 00000000
> ffe0: 00000000 00000000 00000000 c09cfff8 c0040db0 c002b060 00000000
> 00000000
> Backtrace:
> [<c00cb4d8>] (vsnprintf+0x0/0x578) from [<c00e5b28>]
> (class_simple_device_add+0x7c/0xd0)
> [<c00e5ab0>] (class_simple_device_add+0x4/0xd0) from [<c00f7670>]
> (mtd_notify_add+0x40/0x7c
> )
> [<c00f7630>] (mtd_notify_add+0x0/0x7c) from [<c00f5c1c>]
> (add_mtd_device+0x88/0x104)
>  r5 =3D C0BF0800  r4 =3D C017FFF4
> [<c00f5b94>] (add_mtd_device+0x0/0x104) from [<c0025c98>]
> (init_physmap+0x138/0x180)
>  r7 =3D C01B4290  r6 =3D 00000000  r5 =3D C01B4284  r4 =3D 00000000
> [<c0025b60>] (init_physmap+0x0/0x180) from [<c002b0e0>]
> (init+0x8c/0x1c8)
>  r7 =3D C0029308  r6 =3D 00000000  r5 =3D C09CE000  r4 =3D C00292E8
> [<c002b054>] (init+0x0/0x1c8) from [<c0040db0>] (do_exit+0x0/0x9ec)
>  r7 =3D 00000000  r6 =3D 00000000  r5 =3D 00000000  r4 =3D 00000000
> Code: e2403001 e15a0003 32603000 350b3030 (e5d23000)
>  <0>Kernel panic - not syncing: Attempted to kill init!
> >>>>>>>>>>>>>>>.
>
> I am getting this problem consistently. Can someone please tell me where
> I could be going worng!
>
> Warm regards,
> Achin
>
>
>
>
> ********************** Legal Disclaimer ****************************
> "This email may contain confidential and privileged material for the sole=
 use of the intended recipient.  Any unauthorized review, use or distributi=
on by others is strictly prohibited.  If you have received the message in e=
rror, please advise the sender by reply email and delete the message. Thank=
 you."
> **********************************************************************
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

Are you running an xipImage?
