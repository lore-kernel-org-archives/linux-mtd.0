Received: from carrot.linuxgrrls.org ([212.18.228.66] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15F1uh-0006wc-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Jun 2001 00:06:31 +0100
Date: Wed, 27 Jun 2001 00:12:01 +0100 (BST)
From: kira brown <kira@linuxgrrls.org>
To: Simon Evans <spse@secret.org.uk>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: Block device as MTD 
In-Reply-To: <E15EzJQ-0008Px-00@spoinky.secret.org.uk>
Message-ID: <Pine.LNX.4.30.0106270010420.1186-100000@carrot.linuxgrrls.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Tue, 26 Jun 2001, Simon Evans wrote:

> If you are going to put a JFFS2 fs on the device, please note that
> it can take quite a while to mount because JFFS2 scans every block.
> A 96MB CF card took about 2 minutes.

Why on eartl would you want to put JFFS on CF, when CF provides all the
facilities that JFFS does already?   You might as well put ext3fs on it,
it'll be much faster.

k.
