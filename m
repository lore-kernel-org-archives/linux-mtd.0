Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aN7Fx-0005nd-1A
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 23:06:09 +0000
Received: by mail-pa0-x22b.google.com with SMTP id cy9so60547293pac.0
 for <linux-mtd@lists.infradead.org>; Sat, 23 Jan 2016 15:05:48 -0800 (PST)
Date: Sat, 23 Jan 2016 15:05:44 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Romain Izard <romain.izard.pro@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Josh Wu <rainyfeeling@outlook.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Yang Wenyou <Wenyou.Yang@atmel.com>
Subject: Re: [PATCH v2 2/8] mtd: atmel_nand: Simplify error messages
Message-ID: <20160123230544.GL24744@localhost>
References: <1452854102-6125-1-git-send-email-romain.izard.pro@gmail.com>
 <1452854102-6125-3-git-send-email-romain.izard.pro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452854102-6125-3-git-send-email-romain.izard.pro@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 15, 2016 at 11:34:56AM +0100, Romain Izard wrote:
> The error messages when the ECC controller is misconfigured through the
> device tree are very precise. As a result they can (and will) get
> obsolete when new revisions of the controller appear.
> 
> Simplify them before adding the support for the new revision.
> 
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> ---
> v2: split from the 32-bit ECC enabling patch

Pushed patches 2 and 3 to l2-mtd.git. Waiting on others' comments for
the rest, since there was some discussion on their v1.

Brian
