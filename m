Received: from rproxy.gmail.com ([64.233.170.193] helo=mproxy.gmail.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkEGT-0001t4-BJ
	for linux-mtd@lists.infradead.org; Mon, 12 Jul 2004 23:47:34 -0400
Received: by mproxy.gmail.com with SMTP id d15so304443rng
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jul 2004 20:47:32 -0700 (PDT)
Message-ID: <f88313bd04071220474c906cc5@mail.gmail.com>
Date: Mon, 12 Jul 2004 23:47:32 -0400
From: Paul Hodson <starchart@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Unable to load DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I found a similar problem to mine in the archives, but unfortunately I
wasn't able to get my system working with its suggestions.  I would
very much appreciate some guidance for what I think/hope is likely a
simple problem on my end.

Here's the story.  I have a Tri-M TMZ104 with a 128MB DiskOnChip 2000.
 I'm using their "Linux-MZ" distribution, but I need a kernel newer
than the 2.4.18 included with it.  I set up and compiled 2.4.26 with
MTD according to all of the tips posted online.  Actually booting is
my problem now.  I should note that the existing kernel is built with
M-Systems' TrueFFS driver, whereas mine is not.

I set up LILO for both kernels, as shown in my lilo.conf:
==== begin lilo.conf
boot = /dev/doca
disk = /dev/doca
bios = 0x80
prompt
timeout = 10
vga = normal
serial = 0,9600n8
#append="console=tty0 console=ttyS0,19200 ide0=nodma"
#append="console=ttyS0,9600 console=tty1"

image = /boot/vmlinuz-2.4.18-doc514-allmod
#image = /boot/vmlinuz-2.4.18-ext3+allmod
  initrd = /boot/initrd-2.4.18-ext3+allmodc.gz
  root = /dev/doca1
  label = Linux-2.4.18
  read-only

image = /boot/bzImage-2.4.26
  root = /dev/nftla1
  label = Linux-2.4.26
  read-only
==== end lilo.conf

I also ran "rdev bzImage-2.4.26 /dev/ntfla1" on the kernel since I
compiled it on a separate machine.

Upon booting, I get the following error message:
==== begin error
VFS: Cannot open root device "5a00" or 5a:00
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 5a:00
==== end error

I'm not sure if by this point the kernel has detected the DiskOnChip,
since I don't have a means of logging the kernel message output.

My guess is that the problem is related to the overall boot point of
/dev/doca, which perhaps doesn't exist upon loading the new kernel
because it doesn't use TrueFFS?

Would anyone be able to offer me any ideas?

Cheers,

    Paul
