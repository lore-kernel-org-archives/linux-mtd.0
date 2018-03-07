Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1etavm-0004TK-Of
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2018 15:24:40 +0000
Message-ID: <1520436263.2674.35.camel@gmail.com>
Subject: Re: [PATCH] ubi: Reject MLC NAND
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, Pavel Machek <pavel@ucw.cz>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 cyrille.pitchen@wedev4u.fr, marek.vasut@gmail.com,
 boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, tharvey@gateworks.com, stable@vger.kernel.org
Date: Wed, 07 Mar 2018 17:24:23 +0200
In-Reply-To: <6772577.AmT7QaWTNU@blindfold>
References: <20180303104554.5958-1-richard@nod.at>
 <20180306231805.GA28183@amd> <6772577.AmT7QaWTNU@blindfold>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2018-03-07 at 09:01 +0100, Richard Weinberger wrote:
> Pavel,
> 
> Am Mittwoch, 7. März 2018, 00:18:05 CET schrieb Pavel Machek:
> > On Sat 2018-03-03 11:45:54, Richard Weinberger wrote:
> > > While UBI and UBIFS seem to work at first sight with MLC NAND,
> > > you will
> > > most likely lose all your data upon a power-cut or due to
> > > read/write
> > > disturb.
> > > In order to protect users from bad surprises, refuse to attach to
> > > MLC
> > > NAND.
> > > 
> > > Cc: stable@vger.kernel.org
> > 
> > That sounds like _really_ bad idea for stable. All it does is it
> > removes support for hardware that somehow works.
> 
> MLC is not supported and does not work. Full stop.

Ack.
