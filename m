Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fb8es-0005gn-SJ
 for linux-mtd@lists.infradead.org; Thu, 05 Jul 2018 18:07:12 +0000
Date: Thu, 5 Jul 2018 20:06:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: stable@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-msm@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [BACKPORT PATCH] mtd: nand: fix return value check for bad block
 status
Message-ID: <20180705180657.GF29836@kroah.com>
References: <1530624845-28319-1-git-send-email-absahu@codeaurora.org>
 <20180705180353.GE29836@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180705180353.GE29836@kroah.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 05, 2018 at 08:03:53PM +0200, Greg KH wrote:
> On Tue, Jul 03, 2018 at 07:04:05PM +0530, Abhishek Sahu wrote:
> > commit e9893e6fa932f42c90c4ac5849fa9aa0f0f00a34 upstream.
> 
> No it is not :(
> 
> Please fix up and resend.

Ugh, my fault, nevermind, now queued up.

greg k-h
