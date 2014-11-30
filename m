Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XuyOF-0004Hi-Pw
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 06:53:52 +0000
Received: by mail-pa0-f54.google.com with SMTP id fb1so9006973pad.41
 for <linux-mtd@lists.infradead.org>; Sat, 29 Nov 2014 22:53:29 -0800 (PST)
Date: Sat, 29 Nov 2014 22:53:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Remove "We support only one NAND chip" from
 bindings doc
Message-ID: <20141130065326.GB3608@norris-Latitude-E6410>
References: <1417097929-17832-1-git-send-email-sr@denx.de>
 <20141128014832.GA3113@localhost.localdomain>
 <54781DD5.5030801@denx.de>
 <20141129024047.GA5056@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141129024047.GA5056@localhost.localdomain>
Cc: devicetree@vger.kernel.org, Stefan Roese <sr@denx.de>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 29, 2014 at 10:40:50AM +0800, Huang Shijie wrote:
> On Fri, Nov 28, 2014 at 08:01:41AM +0100, Stefan Roese wrote:
> > On 28.11.2014 02:48, Huang Shijie wrote:
> > >On Thu, Nov 27, 2014 at 03:18:49PM +0100, Stefan Roese wrote:
> > >>This sentence "We support only one NAND chip now" is not true any more.
> > >>Multiple chips are supported. So lets remove this sentence to not
> > >
> > >The gpmi can only supports one chip. Of course, there are maybe two dies
> > >in this single chip.
> > 
> > Now I'm a bit confused. The i.MX6 supports 4 chips select signals. And isn't
> > "two dies in this single chip" not practically the same as connecting 2 (or
> > more) chips (same device) to multiple chip selects of the SoC? Where is the
> > difference here?
> The "one chip" here is means the "one package" (TSOP or BGA ....).

Then why is this even in the DT binding doc? Isn't that a board-level
constraint (and not a chip property) which should be obvious to the
user? If so, then should we just drop the language? Or at a minimum,
make it more specific so it doesn't confuse readers.

> (In logic, "two dies in this single chip" is same as connecting 2 chips
> to the gpmi.)

...which means that logically, you can connect more than one chip to the
GPMI, right?

Brian
