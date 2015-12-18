Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aA2AE-0006Ln-Dz
 for linux-mtd@lists.infradead.org; Fri, 18 Dec 2015 21:02:17 +0000
Received: by mail-pf0-x230.google.com with SMTP id o64so54484560pfb.3
 for <linux-mtd@lists.infradead.org>; Fri, 18 Dec 2015 13:01:50 -0800 (PST)
Date: Fri, 18 Dec 2015 13:01:46 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH v5] mtd: nand: bcm47xx: use the mtd instance embedded in
 struct nand_chip
Message-ID: <20151218210146.GO10460@google.com>
References: <1450467498-35553-1-git-send-email-computersforpeace@gmail.com>
 <20151218215000.2b0adda9@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151218215000.2b0adda9@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 18, 2015 at 09:50:00PM +0100, Boris Brezillon wrote:
> On Fri, 18 Dec 2015 11:38:18 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> 
> > From: Boris BREZILLON <boris.brezillon@free-electrons.com>
> > 
> > struct nand_chip now embeds an mtd device. Make use of this mtd instance.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> 
> Looks good to me, not we can have both a SoB and an AB tag coming from
> the same person, but
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-elctrons.com>

Good point. I guess the ack can just assure me I didn't screw up your
work *too* badly :)

Applied without the duplicate tag
