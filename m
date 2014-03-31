Received: from gw1.transmode.se ([195.58.98.146])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUirl-0006lz-Iw
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 20:31:34 +0000
In-Reply-To: <1396287151.4857.50.camel@mars>
References: <1396287151.4857.50.camel@mars>
To: Christoph Fritz <chf.fritz@googlemail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: cfi_cmdset_0001 - fixup for PC28F512P33TFA
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Message-ID: <OFA78F5CB9.63C292B4-ONC1257CAC.006FBDC4-C1257CAC.0070B588@transmode.se>
Date: Mon, 31 Mar 2014 22:31:05 +0200
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org, Marius Achilles <M.Achilles@phytec.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"linux-mtd" <linux-mtd-bounces@lists.infradead.org> wrote on 2014/03/31 
19:32:31:
> 
> Add a fixup (quirk) for Micron NOR flash PC28F512P33TFA: This patch
> disables option 'suspend erase' due to "internal timing issues on
> some revisions of the P3x" which is pointed out by Micron TechNote-PDF
> "Adapting the Linux Kernel for Micron P30, P33, and J3 Flash Memory" 
[1].
> 
> Without this patch, errors occur during heavy flash usage mostly in 
minus
> degree temperature environments.
> 
> It's very likely that other P3x chips suffer from the same issue.
> 
> [1]: 
https://www.micron.com/~/media/Documents/Products/Technical%20Note/NOR%20Flash/tn1206_p30_p33_j3_linux.pdf

> 
> Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
> Tested-by: Marius Achilles <M.Achilles@phytec.de>

No way, disabling erase suspend will cause severe latencies for read/write 
ops.

The document mentions other ways to get around this problem, I suggest you 
explore
these first.
Minus degrees is not a common environment either so perhaps any fix should 
be selectable?
 
 Jocke
