Received: from mail-gx0-f10.google.com ([209.85.217.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KmsUw-00074C-O7
	for linux-mtd@lists.infradead.org; Mon, 06 Oct 2008 15:59:50 +0000
Received: by gxk3 with SMTP id 3so5331407gxk.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Oct 2008 08:59:41 -0700 (PDT)
Message-ID: <b816c8220810060859x2af5178dnc23c6cca72a5a17d@mail.gmail.com>
Date: Mon, 6 Oct 2008 09:59:41 -0600
From: "Steve Hurst" <creepingmalaise@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: MTD How-to?
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I'm an MTD noob trying to gain read/write access to a chip that
appears to be supported in jedec_probe.c (49LF008A), using a mostly
unchanged debian 2.6.24 kernel.  I've enabled everything I think I
need to in the kernel, but can't seem to get things to recognize the
chip.

I've reviewed a couple of pretty old how-to's (2.2/2.4 days old), and
visited the available pages at
http://www.linux-mtd.infradead.org/doc/general.html, but can't find
anything modern that lays out the steps for getting a device up and
going.

Can anyone point me at relevant documentation or a how-to?

TIA!
