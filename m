Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XuILA-0002Oz-37
 for linux-mtd@lists.infradead.org; Fri, 28 Nov 2014 09:59:52 +0000
Message-ID: <1417168755.11181.7.camel@sauron.fi.intel.com>
Subject: Re: UBI 1MiB size partition
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Angelo Dureghello <angelo70@gmail.com>
Date: Fri, 28 Nov 2014 11:59:15 +0200
In-Reply-To: <54784527.8060205@gmail.com>
References: <5472F403.50702@gmail.com>
 <1417167595.11181.5.camel@sauron.fi.intel.com> <54784527.8060205@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-11-28 at 10:49 +0100, Angelo Dureghello wrote:
> Dear Artem,
> 
> thanks for your reply.
> 
> > UBI is a volume manager which is designed to manage the entire flash
> > chip. Sometimes system designers have one or two small partitions at the
> > beginning of the chip, and give the rest to UBI.
> >
> > You are using NAND flash, and UBI tries to reserve some amount of
> > eraseblocks for bad block handling. And the count of eraseblocks to
> > reserve is calculated from the entire chip size. So UBI says it wants
> > 20, but reserved only 4 - all the available blocks you have. So you do
> > not have any more blocks left, so you have no space.
> >
> > You really should re-think your design. 1MiB partition is too small,
> > there are too few eraseblocks. What if one or two of them become bad?
> >
> Yes, i realized this. A redesign of the partition scheme is needed at this
> stage.
> I cannot actually change the partition scheme for some reasons connected
> to the production process, but at least things are more clear now.

Not that I recommend this for your design, but if you want to play with
your 1MiB partition, you may try the max_beb_per1024 UBI parameter, or
the CONFIG_MTD_UBI_BEB_LIMIT option. I did not try, but hopefully it
allows you to specify 0?
