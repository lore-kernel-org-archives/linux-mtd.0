Received: from
 1.c.d.e.d.2.1.2.0.7.4.b.1.c.8.0.0.0.0.0.a.e.3.0.0.b.8.0.1.0.0.2.ip6.arpa
 ([2001:8b0:3ea:0:8c1:b470:212d:edc1] helo=linux-mips.org)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYbTu-0008Cs-JS
 for linux-mtd@lists.infradead.org; Thu, 08 Dec 2011 10:45:39 +0000
Date: Thu, 8 Dec 2011 10:45:23 +0000
From: Ralf Baechle <ralf@linux-mips.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] MTD: nand: Convert au1550nd to use
 module_platform_driver()
Message-ID: <20111208104522.GA21777@linux-mips.org>
References: <1322748247.31743.1.camel@phoenix>
 <1323008139.9400.59.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1323008139.9400.59.camel@sauron.fi.intel.com>
Cc: linux-mips@linux-mips.org, Axel Lin <axel.lin@gmail.com>,
 linux-mtd@lists.infradead.org, Manuel Lauss <manuel.lauss@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 04, 2011 at 04:15:32PM +0200, Artem Bityutskiy wrote:

> > Hi Ralf,
> > This patch converts au1550nd to use module_platform_driver().
> > You have committed a5bd32fd "MTD: nand: make au1550nd.c a platform_driver".
> > Currently this patch can only apply to either your tree or linux-next.
> > Could you help to take it.
> > ( committed a5bd32fd does not exist in l2-mtd-2.6.git,
> > so Artem cannot apply it.)
> 
> Yes, please, merge the au1550nd.c piece via Ralf, thanks!

No point in adding code to change it again first commit so I've folded
this patch into "MTD: nand: make au1550nd.c a platform_driver".

Thanks folks!

  Ralf
