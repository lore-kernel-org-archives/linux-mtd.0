Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ed2x9-00049s-In
 for linux-mtd@lists.infradead.org; Sat, 20 Jan 2018 23:53:41 +0000
Date: Sun, 21 Jan 2018 00:53:21 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, richard@nod.at,
 stable@vger.kernel.org, marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: [PATCH v3] mtd: nand: brcmnand: Disable prefetch by default
Message-ID: <20180121005321.313ebc2c@bbrezillon>
In-Reply-To: <71de78c5-0081-a663-2383-638832766001@gmail.com>
References: <1515443808-31105-1-git-send-email-kdasu.kdev@gmail.com>
 <71de78c5-0081-a663-2383-638832766001@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 20 Jan 2018 15:13:35 -0800
Florian Fainelli <f.fainelli@gmail.com> wrote:

> On 01/08/2018 12:36 PM, Kamal Dasu wrote:
> > Brcm nand controller prefetch feature needs to be disabled
> > by default. Enabling affects performance on random reads as
> > well as dma reads.
> > 
> > Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> > Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
> > Cc: stable@vger.kernel.org  
> 
> Boris, is there a reason this is not in your v4.16 pull request?

Look carefully, it is there ;-).

"
Kamal Dasu (1):
      mtd: nand: brcmnand: Disable prefetch by default
"

> If not, could you take that fix?
> 
> Thank you
