Received: from mail-pd0-f170.google.com ([209.85.192.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJaDV-0007vJ-Bf
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 04:08:29 +0000
Received: by pdjp10 with SMTP id p10so2052540pdj.3
 for <linux-mtd@lists.infradead.org>; Thu, 05 Feb 2015 20:08:08 -0800 (PST)
Date: Thu, 5 Feb 2015 20:08:05 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Kevin Hao <haokexin@gmail.com>
Subject: Re: [PATCH 12/15] mtd: kconfig: replace PPC_OF with PPC
Message-ID: <20150206040805.GI18140@ld-irv-0074>
References: <1422712065-9403-1-git-send-email-haokexin@gmail.com>
 <1422712065-9403-13-git-send-email-haokexin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1422712065-9403-13-git-send-email-haokexin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 David Woodhouse <dwmw2@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jan 31, 2015 at 09:47:42PM +0800, Kevin Hao wrote:
> The PPC_OF is a ppc specific option which is used to mean that the
> firmware device tree access functions are available. Since all the
> ppc platforms have a device tree, it is aways set to 'y' for ppc.
> So it makes no sense to keep a such option in the current kernel.
> Replace it with PPC.
> 
> Signed-off-by: Kevin Hao <haokexin@gmail.com>

Pushed to l2-mtd.git. Thanks.

Brian
