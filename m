Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RaN64-00078b-3I
 for linux-mtd@lists.infradead.org; Tue, 13 Dec 2011 07:48:21 +0000
Received: by bkat2 with SMTP id t2so5753779bka.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2011 23:48:17 -0800 (PST)
Date: Tue, 13 Dec 2011 09:48:05 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: write bad block marker even with BBT
Message-ID: <20111213094805.04c4b8c9@pixies.home.jungo.com>
In-Reply-To: <CAN8TOE9C9VEi7htM=-jypt29y23Ex3CCnYBOW3+OkTs1Zcra1A@mail.gmail.com>
References: <1323292100-19280-1-git-send-email-computersforpeace@gmail.com>
 <1323723000.2297.4.camel@koala>
 <CAN8TOE9C9VEi7htM=-jypt29y23Ex3CCnYBOW3+OkTs1Zcra1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 12 Dec 2011 13:53:08 -0800 Brian Norris <computersforpeace@gmail.com> wrote:
> On Mon, Dec 12, 2011 at 12:49 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > 2. Would the case of inconsistency between BBT and OOB markers be
> > possible to fix-up after the power cut?
> 
> Not trivially :) I suppose we could assume that any bad block markers
> in the OOB are in the BBT (when it exists) but not vice versa, then
> when we rebuild the BBT at boot time, we rescan the OOB only on the
> bad blocks, rewriting to OOB if necessary. Eventually, this kind of
> degrades to usefulness of the BBT though, if you're always checking
> back with the OOB markers.

What about the following scheme for 'nand_default_block_markbad' in case
NAND_BBT_WRITE_BBM is on:

1. Invalidate exising on-flash BBT
2. Update the BI marker on the OOB
3. Update the on-flash BBT

If a power cut occurs just before (1), then we failed to update either
BBT or OOB with the newly detected bad block. Can't do much about that.

If a power cut occurs between (1) and (2), then upon next boot the BBT
will be rebuilt by scanning the device.
Assuming all former bad blocks were indeed marked in their OOB (since
NAND_BBT_WRITE_BBM was on), then the scan would lead to a BBT identical
to the old BBT that was invalidated.
Again, the "new" bad block would not be marked - same case as if the
power cut occured before (1).

If a power cut occurs between (2) and (3), then upon next boot the BBT
will be rebuilt by scanning the device - this time the new BBT will
contain the newly detected bad block, since it was already OOB marked.

Invalidating the on-flash BBT might be implemented by erasing its block,
for example.

I guess this is a bigger change than the patch suggested, since
'nand_bbt.c' should expose interface for invalidating the BBT.

Also, need to examine if this scheme fits a scenario where there are
both main and mirror BBTs.
