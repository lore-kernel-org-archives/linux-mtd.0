Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RavjD-00032U-DJ
 for linux-mtd@lists.infradead.org; Wed, 14 Dec 2011 20:47:04 +0000
Received: by eekc1 with SMTP id c1so1399873eek.36
 for <linux-mtd@lists.infradead.org>; Wed, 14 Dec 2011 12:46:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20111213094805.04c4b8c9@pixies.home.jungo.com>
References: <1323292100-19280-1-git-send-email-computersforpeace@gmail.com>
 <1323723000.2297.4.camel@koala>
 <CAN8TOE9C9VEi7htM=-jypt29y23Ex3CCnYBOW3+OkTs1Zcra1A@mail.gmail.com>
 <20111213094805.04c4b8c9@pixies.home.jungo.com>
Date: Wed, 14 Dec 2011 12:46:59 -0800
Message-ID: <CAN8TOE_i=c3ysugu+_swbzi0B4abCYT0LJtLzJhQ8r_KMG8yRQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: write bad block marker even with BBT
From: Brian Norris <computersforpeace@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kevin Cernekee <cernekee@gmail.com>, Jim Quinlan <jim2101024@gmail.com>,
 linux-mtd@lists.infradead.org, Matthieu CASTET <matthieu.castet@parrot.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 12, 2011 at 11:48 PM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> What about the following scheme for 'nand_default_block_markbad' in case
> NAND_BBT_WRITE_BBM is on:
>
> 1. Invalidate exising on-flash BBT
> 2. Update the BI marker on the OOB
> 3. Update the on-flash BBT

Generally looks OK, but it complicates things unnecessarily IMO...

> I guess this is a bigger change than the patch suggested, since
> 'nand_bbt.c' should expose interface for invalidating the BBT.

Yes, and I don't want to rewrite nand_bbt just to expose an interface
simply for an esoteric power cut case.

> Also, need to examine if this scheme fits a scenario where there are
> both main and mirror BBTs.

This is one of the problems. We would need to invalidate both BBTs in
step 1, making our attempts at mirroring pointless. In fact, in some
power cut cases, we could be left in a worse condition than if we
didn't try to compensate for power cuts, since we just killed our
backup table.

Brian
