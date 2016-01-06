Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGxSk-0007CA-R2
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2016 23:25:55 +0000
Received: by mail-pa0-x229.google.com with SMTP id yy13so150002254pab.3
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 15:25:34 -0800 (PST)
Date: Wed, 6 Jan 2016 15:25:31 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Sergei Ianovich <ynvich@gmail.com>
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 David Woodhouse <dwmw2@infradead.org>, Jeremy Kerr <jk@ozlabs.org>,
 Cyril Bur <cyrilbur@gmail.com>,
 Neelesh Gupta <neelegup@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Joel Stanley <joel@jms.id.au>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5] mtd: support BB SRAM on ICP DAS LP-8x4x
Message-ID: <20160106232531.GP109450@google.com>
References: <1397668667-27328-4-git-send-email-ynvich@gmail.com>
 <1450205941-15593-1-git-send-email-ynvich@gmail.com>
 <20151220033807.GC9883@rob-hp-laptop>
 <1450608238.15911.24.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1450608238.15911.24.camel@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 20, 2015 at 01:43:58PM +0300, Sergei Ianovich wrote:
> On Sat, 2015-12-19 at 21:38 -0600, Rob Herring wrote:
> > On Tue, Dec 15, 2015 at 09:58:53PM +0300, Sergei Ianovich wrote:
> > > +Required properties:
> > > +- compatible : should be "icpdas,sram-lp8x4x"
> > 
> > No wildcards please. Otherwise looks fine.
> 
> There is a similar review comment from Arnd Bergmann in the discussion
> of `[PATCH v5] serial: support for 16550A serial ports on LP-8x4x`.
> 
> I'll quote my latest clarification:
> > ... This driver will support ports on LP-8081, 

^^ So 8081 doesn't even match the wildcard scheme you give in the
compatible string, proving the point of the Conventional Wisdom
suggestion Rob gave...

> > LP-8141, LP-8441, LP-8841. Last time I checked the vendor was announcing
> > a series with 3 as the last digit. They use lp8x4x name, eg. in
> > documentation like `LP-8x4x_ChangeLog.txt`. They ship their proprietary
> > SDK in `lp8x4x_sdk_for_linux.tar`. All of this implies that it is a
> > single board.
> 
> I think the solution should be the same for all LP-8x4x drivers (IRQ,
> SRAM, SERIAL, IIO).

The rationale is described here:

http://devicetree.org/Device_Tree_Usage#Understanding_the_compatible_Property

Quote:
> Warning: Don't use wildcard compatible values, like "fsl,mpc83xx-uart"
> or similar. Silicon vendors will invariably make a change that breaks
> your wildcard assumptions the moment it is too late to change it.
> Instead, choose a specific silicon implementations and make all
> subsequent silicon compatible with it.

I don't think your circumstance is anything unique.

Regards,
Brian
