Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 134fVC-0001VL-00
	for mtd-list@infradead.org; Wed, 21 Jun 2000 09:04:50 +0100
Message-ID: <3950776D.30AC4B13@auriga.ru>
Date: Wed, 21 Jun 2000 12:06:05 +0400
From: Nick Ivanter <nick@auriga.ru>
MIME-Version: 1.0
To: dwmw2@infradead.org
CC: mtd@infradead.org, jffs-dev@axis.com
Subject: Re: garbage collect
References: <Pine.LNX.4.10.10006201614120.7301-100000@impact-pc01.gnk.internal>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

dwmw2@infradead.org wrote:

> On Tue, 20 Jun 2000, Nick Ivanter wrote:
>
> > I've compiled JFFS and MTD into the kernel and tried to play with it on
> > the mtdram device. It seems to work, but when I tried to mount device
> > without manually specifying a filesystem type, I got error: "Unable to
> > handle kernel NULL pointer dereference at virtual address ...........
> > Process mount........... Segmentation fault". When specifying -t jffs,
> > everything seems to be ok.
> > Does anyone have ideas about what may cause that?
>
> Probably the mtdblock device falling over when a 'real' filesystem
> actually causes a block read request, which jffs will never do because it
> goes straight to the underlying MTD device.
>
> What kernel version? Can you give me a backtrace of the oops?

Kernel 2.2.12. The exact error message is as following:
bash# mount /dev/mtd0 /mnt
Unable to handle kernel NULL pointer dereference at virtual address 0000000c

current->tss.cr3 = 01676000, %cr3 = 01676000
*pde = 00000000
Oops: 0002
CPU:    0
EIP:    0010:[<c014cd43>]
EFLAGS: 00010092
eax: c019549c   ebx: 00000000   ecx: 00000000   edx: 00000003
esi: 00000000   edi: 00000001   ebp: c15ba000   esp: c15bbcc8
ds: 0018   es: 0018   ss: 0018
Process mount (pid: 10, process nr: 7, stackpage=c15bb000)
Stack: 00000001 c0131c62 00000000 00000001 c0174880 c01b252c c0131f3f
00000001
       c01b252c 00000001 00000246 c15bbd28 c168f4d0 00000400 c014c190
00000000
       c012165a c01bb02c 00000001 c168f4d0 c168f4d0 c15bbe9c c15bbd28
c15bbd28
Call Trace: [<c0131c62>] [<c0174880>] [<c0131f3f>] [<c014c190>] [<c012165a>]
[<c01255ea>] [<c0121e2b>]
       [<c012208b>] [<c013ad74>] [<c0121e2b>] [<c012208b>] [<c013ad74>]
[<c0121e2b>] [<c012208b>] [<c012768c>]
       [<c01748a0>] [<c0111fa9>] [<c0131d0b>] [<c017489b>] [<c012126d>]
[<c01206e0>] [<c0120935>] [<c01079c8>]
Code: c7 46 0c 00 00 00 00 85 ff 75 44 ff 76 10 ff 74 24 1c 0f b7
Segmentation fault


Nick.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
