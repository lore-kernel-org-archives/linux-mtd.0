Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDpzL-00025J-Cr
 for linux-mtd@lists.infradead.org; Wed, 21 Jan 2015 07:46:08 +0000
Received: by mail-pd0-f179.google.com with SMTP id v10so30033385pde.10
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jan 2015 23:45:46 -0800 (PST)
Date: Tue, 20 Jan 2015 23:45:29 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>, Steve deRosier <derosier@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Huang Shijie <shijie8@gmail.com>, Richard Weinberger <richard@nod.at>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] mtd: nand: default bitflip-reporting threshold to 75% of
 correction strength
Message-ID: <20150121074529.GA5273@norris-Latitude-E6410>
References: <54B38745.70007@atmel.com>
 <1421095889-12717-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1421095889-12717-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 12, 2015 at 12:51:29PM -0800, Brian Norris wrote:
> The MTD API reports -EUCLEAN only if the maximum number of bitflips
> found in any ECC block exceeds a certain threshold. This is done to
> avoid excessive -EUCLEAN reports to MTD users, which may induce
> additional scrubbing of data, even when the ECC algorithm in use is
> perfectly capable of handling the bitflips.
> 
> This threshold can be controlled by user-space (via sysfs), to allow
> users to determine what they are willing to tolerate in their
> application. But it still helps to have sane defaults.
> 
> In recent discussion [1], it was pointed out that our default threshold
> is equal to the correction strength. That means that we won't actually
> report any -EUCLEAN (i.e., "bitflips were corrected") errors until there
> are almost too many to handle. It was determined that 3/4 of the
> correction strength is probably a better default.
> 
> [1] http://lists.infradead.org/pipermail/linux-mtd/2015-January/057259.html
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to l2-mtd.git.

Brian
