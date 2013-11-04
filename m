Date: Mon, 4 Nov 2013 09:01:11 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v2 07/27] mtd: nand: pxa3xx: Early variant detection
Message-ID: <20131104120110.GC2516@localhost>
References: <1382137374-21251-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1382137374-21251-8-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131103211856.GA5896@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131103211856.GA5896@gmail.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 03, 2013 at 04:18:58PM -0500, Huang Shijie wrote:
> On Fri, Oct 18, 2013 at 08:02:34PM -0300, Ezequiel Garcia wrote:
> > In order to customize early settings depending on the detected SoC variant,
> what's the early settings depending on the variant?

We need to detect the variant *before* alloc_nand_resource(),
in order to set a different cmdfunc() for each variant.

Having a separate cmdfunc() is, IMO, the best solution for two
reasons:

1. We keep the legacy pxa platform away from our intrusive changes,
which such platform won't use.

2. The 'splitted' command semantic is weird and complex enough
to live in its own function.

> could you add them in the commit?
> 

Yes, that sound better. Thanks for the feedback.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
