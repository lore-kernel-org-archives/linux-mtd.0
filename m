Received: from mail.allot.com ([199.203.223.202] helo=exg.allot.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15F8wk-0007NM-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Jun 2001 07:37:06 +0100
Message-ID: <3B398202.CC5B6125@allot.com>
Date: Wed, 27 Jun 2001 09:49:39 +0300
From: Felix Radensky <felix@allot.com>
MIME-Version: 1.0
To: Simon Evans <spse@secret.org.uk>
CC: linux-mtd@lists.infradead.org
Subject: Re: Block device as MTD
References: <E15EzJQ-0008Px-00@spoinky.secret.org.uk>
Content-Type: text/plain; charset=us-ascii
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

Simon Evans wrote:

> I have checked this into CVS now. The following files are affected:
>
> drivers/mtd/devices/blkmtd.c  - the driver itself
> drivers/mtd/devices/Config.in
> drivers/mtd/devices/Makefile
> patches/Configure.help
>
> Please consider this alpha software. It uses raw/io to the disk (not via
> the buffer cache). Basic usage is:
>
> modprobe blkmtd device=/dev/floppy/0  etc
>
> If you are going to put a JFFS2 fs on the device, please note that
> it can take quite a while to mount because JFFS2 scans every block.
> A 96MB CF card took about 2 minutes.
>
> On the plus side, if you have more memory then the size of the device,
> you should find the whole device in the page cache ;)
>
> cheers
> si
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Hi,

We have CF slot on our board, but no IDE controllers. Can I still use your
blkmtd.c driver to access CF ? If not, what approach should I take to
utilize
CF (adding IDE controller is not an option) ?

Thanks in advance.

Felix.
