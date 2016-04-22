Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atQts-00080t-Rp
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 02:32:57 +0000
Date: Fri, 22 Apr 2016 11:32:29 +0900
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Manuel =?iso-8859-1?Q?P=E9gouri=E9-Gonnard?= <mpg@elzevir.fr>,
 Eva Rachel Retuya <eraretuya@gmail.com>,
 Janani Ravichandran <janani.rvchndrn@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V3 05/11] staging: mt29f_spinand: set ECC algorithm
 explicitly
Message-ID: <20160422023229.GA19001@kroah.com>
References: <1460913104-27388-1-git-send-email-zajec5@gmail.com>
 <1460926387-9563-1-git-send-email-zajec5@gmail.com>
 <1460926387-9563-6-git-send-email-zajec5@gmail.com>
 <20160421222056.1deb7d13@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160421222056.1deb7d13@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 21, 2016 at 10:20:56PM +0200, Boris Brezillon wrote:
> Hi Greg,
> 
> On Sun, 17 Apr 2016 22:53:01 +0200
> Rafał Miłecki <zajec5@gmail.com> wrote:
> 
> > This is part of process deprecating NAND_ECC_SOFT_BCH (and switching to
> > enum nand_ecc_algo).
> 
> Do you mind if I take this patch through the NAND tree in order to avoid
> dependency problems?

Not at all:
	Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
