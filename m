Received: from bolna.monet.no ([195.139.82.18])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gOBt-00059t-00
	for <linux-mtd@lists.infradead.org>; Mon, 10 Sep 2001 11:21:21 +0100
Message-ID: <003a01c139e4$28e04e40$c801a8c0@starticon>
Reply-To: "Yunus Shaikh" <yshaikh@start-icon.com>
From: "Yunus Shaikh" <yshaikh@start-icon.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <002201c139d7$0c1948a0$c801a8c0@starticon>  <30336.1000112243@redhat.com>
Subject: Re: Kernel 2.4.0 and Doc2000 
Date: Mon, 10 Sep 2001 12:34:24 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

>
> Is it a DiskOnChip 2000 or a DiskOnChip Millennium?

it is Diskonchip 2000 version 1.23 16MB
>
> > Unable to handle kernel NULL Pointer dereference at virtual adress
00000000
> > code: Bad EIP value
>
> You need to feed the whole of that through ksymoops or it's useless to us.

Unable to handle kernel NULL pointer dereference at virtual address 00000000
 printing eip:
00000000
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<00000000>]
EFLAGS: 00010012
eax: c30c7e5c   ebx: c028a474   ecx: 00005d01   edx: c028a46c
esi: c028a45c   edi: 00000001   ebp: c30e2440   esp: c30c7e24
ds: 0018   es: 0018   ss: 0018
Process umount (pid: 507, stackpage=c30c7000)
Stack: c015ec49 c028a45c c30c7e5c c30e2440 00000001 c30c7e60 c30c7e64
001e8480
       c028a474 c028a46c 00000000 00000000 00000002 00000008 00000000
000000fe
       000000fe c3193660 c31415a0 c3d42d00 c011f65c c31b1e20 c3d42d00
c31b1be0
Call Trace: [<c015ec49>] [<c011f65c>] [<c011f70f>] [<c015f2ba>] [<c012ffb3>]
[<c015f329>] [<c015f4f7>]
       [<c012f034>] [<c01389cc>] [<c012f153>] [<c01337d1>] [<c013395b>]
[<c012df13>] [<c012077b>] [<c013399c>]
       [<c0108fb3>]

Code:  Bad EIP value.
Segmentation fault

this is what i get but i tried doing Nand flash device drivers ->
[*]    Enable Nand device support
[*]   Enable ECC correction algorithm
[*]   Verify Nand pages

with the above the error had reduced i mean i cud do some wirting but now it
has again started

Kindly help

regards and sorry for the long mail
