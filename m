Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D0lAN-0003u1-I6
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 13:41:52 -0500
To: =?iso-8859-1?q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
References: <20050214175251.GA28755@wohnheim.fh-wedel.de>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 14 Feb 2005 11:41:22 -0700
In-Reply-To: <20050214175251.GA28755@wohnheim.fh-wedel.de>
Message-ID: <m3fyzzx9v1.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: joern@wh.fh-wedel.de, Amit Gud <amitg@calsoftinc.com>, gud@eth.net,
	linux-mtd@lists.infradead.org, kernel-janitors@lists.osdl.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 8/18] drivers/mtd/ remove pci_find_{device, subsys}
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel <joern@wohnheim.fh-wedel.de> writes:

> Looks fairly simple, but I've never dealt with pci_find_device(), so
> my voice doesn't count.

When switching from pci_find_device to pci_get_device
the corresponding call to pci_dev_put() needs to be added.

In addition we need an entry in compat.h

Beyond that ich2rom.c should just be deleted.  It was renamed
ichxrom.c a while ago.

Eric
