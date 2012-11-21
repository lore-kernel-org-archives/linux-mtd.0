Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tb8xi-0002Vy-QV
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2012 11:59:29 +0000
Date: Wed, 21 Nov 2012 11:58:48 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Bill Pemberton <wfp5p@virginia.edu>
Subject: Re: [PATCH 238/493] mtd: remove use of __devinit
Message-ID: <20121121115848.GI3290@n2100.arm.linux.org.uk>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
 <1353349642-3677-238-git-send-email-wfp5p@virginia.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1353349642-3677-238-git-send-email-wfp5p@virginia.edu>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Wan ZongShun <mcuos.com@gmail.com>, gregkh@linuxfoundation.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Olof Johansson <olof@lixom.net>, linuxppc-dev@lists.ozlabs.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 19, 2012 at 01:23:07PM -0500, Bill Pemberton wrote:
>  drivers/mtd/maps/pismo.c               | 14 +++++++-------
>  drivers/mtd/maps/sa1100-flash.c        |  5 ++---

For these two,

Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
