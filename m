Received: from mail.kroah.org ([69.55.234.183] helo=perch.kroah.org)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D0l9E-0003mV-JR
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 13:40:41 -0500
Date: Mon, 14 Feb 2005 10:40:08 -0800
From: Greg KH <greg@kroah.com>
To: J?rn Engel <joern@wohnheim.fh-wedel.de>
Message-ID: <20050214184007.GF7815@kroah.com>
References: <200502141122.11786.amitg@calsoftinc.com>
	<20050214175251.GA28755@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050214175251.GA28755@wohnheim.fh-wedel.de>
Cc: kernel-janitors@lists.osdl.org, David Woodhouse <dwmw2@infradead.org>,
	Amit Gud <amitg@calsoftinc.com>, linux-mtd@lists.infradead.org, gud@eth.net
Subject: Re: [KJ] Re: [PATCH 8/18] drivers/mtd/ remove pci_find_{device,
	subsys}
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 14, 2005 at 06:52:51PM +0100, J?rn Engel wrote:
> Looks fairly simple, but I've never dealt with pci_find_device(), so
> my voice doesn't count.
> 
> dwmw2, is this ok?

No it isn't, please do not apply.  See my KJ response for why it is not
correct.

thanks,

greg k-h
