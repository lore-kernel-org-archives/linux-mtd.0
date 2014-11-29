Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XuXyP-0003GE-NT
 for linux-mtd@lists.infradead.org; Sat, 29 Nov 2014 02:41:26 +0000
Received: by mail-pd0-f174.google.com with SMTP id w10so7473738pde.19
 for <linux-mtd@lists.infradead.org>; Fri, 28 Nov 2014 18:41:04 -0800 (PST)
Date: Sat, 29 Nov 2014 10:40:50 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: gpmi: Remove "We support only one NAND chip" from
 bindings doc
Message-ID: <20141129024047.GA5056@localhost.localdomain>
References: <1417097929-17832-1-git-send-email-sr@denx.de>
 <20141128014832.GA3113@localhost.localdomain>
 <54781DD5.5030801@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54781DD5.5030801@denx.de>
Cc: devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 28, 2014 at 08:01:41AM +0100, Stefan Roese wrote:
> On 28.11.2014 02:48, Huang Shijie wrote:
> >On Thu, Nov 27, 2014 at 03:18:49PM +0100, Stefan Roese wrote:
> >>This sentence "We support only one NAND chip now" is not true any more.
> >>Multiple chips are supported. So lets remove this sentence to not
> >
> >The gpmi can only supports one chip. Of course, there are maybe two dies
> >in this single chip.
> 
> Now I'm a bit confused. The i.MX6 supports 4 chips select signals. And isn't
> "two dies in this single chip" not practically the same as connecting 2 (or
> more) chips (same device) to multiple chip selects of the SoC? Where is the
> difference here?
The "one chip" here is means the "one package" (TSOP or BGA ....).

(In logic, "two dies in this single chip" is same as connecting 2 chips
to the gpmi.)

thanks
Huang Shijie
