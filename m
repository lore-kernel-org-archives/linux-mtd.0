Received: from mail-pb0-x22f.google.com ([2607:f8b0:400e:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VC2sd-0001il-Lv
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2013 07:31:00 +0000
Received: by mail-pb0-f47.google.com with SMTP id rr4so79981pbb.20
 for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2013 00:30:37 -0700 (PDT)
Date: Wed, 21 Aug 2013 00:30:28 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jussi Kivilinna <jussi.kivilinna@iki.fi>
Subject: Re: [PATCH] alauda: do not use stack for URB transfer_buffers
Message-ID: <20130821073028.GB31788@brian-ubuntu>
References: <20130806120329.8864.36301.stgit@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130806120329.8864.36301.stgit@localhost6.localdomain6>
Cc: David Woodhouse <dwmw2@infradead.org>, Joern Engel <joern@logfs.org>,
 linux-usb@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 06, 2013 at 03:03:29PM +0300, Jussi Kivilinna wrote:
> Patch fixes alauda not to use stack as URB transfer_buffer. URB buffers need to
> be DMA-able, which stack is not.
> 
> Patch is only compile tested.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
> ---
>  drivers/mtd/nand/alauda.c |   74 ++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 56 insertions(+), 18 deletions(-)

Just FYI, this driver is being removed, so I'm obviously not taking this
patch :)

Brian
