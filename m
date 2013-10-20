Date: Sun, 20 Oct 2013 19:50:49 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v2 00/27] Armada 370/XP NAND support
Message-ID: <20131020195049.7e683d0f@skate>
In-Reply-To: <20131019162158.GA3044@localhost>
References: <1382137374-21251-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131019063535.GC20157@1wt.eu>
 <20131019142549.GO22434@titan.lakedaemon.net>
 <20131019162158.GA3044@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Daniel Mack <zonque@gmail.com>,
 linux-mtd@lists.infradead.org,
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

Dear Ezequiel Garcia,

On Sat, 19 Oct 2013 13:21:59 -0300, Ezequiel Garcia wrote:

> > > I strongly believe that all the information above is very valuable and
> > > that it's a shame to lose it in a cover message. It would definitely
> > > make sense to have this in a doc file.
> > 
> > Agreed.  Great work Ezequiel!  Let's capture this in Documentation/.
> > 
> 
> Wait a second!
> 
>   $ ls Documentation/mtd/ | wc -l
>   1
> 
> Isn't documenting deprecated? ...
> 
> Just kiddin'! I'll add this and the other cover to Documentation/
> so typos and english fixes are welcome!

I certainly agree this documentation should be kept, but I'm wondering
if keeping it as a comment inside the driver doesn't make more sense.
This document is really more about specific implementation details, and
the next person looking at the driver is not very likely to search such
details in Documentation/, in my opinion.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
