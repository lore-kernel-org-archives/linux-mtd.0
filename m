Received: from 228-216.205.122.dellhost.com ([216.205.122.228] helo=lakeshoremicro.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17MVd2-0007Kv-00
	for <linux-mtd@lists.infradead.org>; Mon, 24 Jun 2002 16:19:45 +0100
Message-ID: <000b01c21b92$8eebabe0$0201a8c0@dellc800>
From: "Mark Meade" <mark@lakeshoremicro.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: GRUB on DoC Millennium/2000 - Instructions
Date: Mon, 24 Jun 2002 11:19:10 -0400
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

Peter Keel wrote:
> I'd love to. Of course, for some reason my grub can't read the
> filesystem on the disk. The Question now is:
>
> "If grub can't read the filesystem, how do I tell grub where the
> kernel resides, and how do I find this out where it is?".

Peter,

What type of filesystem is on your hard drive?  If it's ext2, GRUB should recognize the
filesystem -- if you just type "kernel (hd0,0)/" and then hit TAB, the auto-completion
feature should give you a list of possibilities.

If the hard drive you are trying to boot from has a filesystem other than ext2, you would
need to rebuild GRUB to support it -- the "./configure" script used in the instructions
explicitly disabled all other types of filesystems.

Mark
