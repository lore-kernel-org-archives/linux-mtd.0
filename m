Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCpEX-00052Y-Jn
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 10:36:36 +0000
Message-ID: <1362479827.2943.49.camel@sauron>
Subject: Re: [PATCH 12/12] mtd: nand: provision full ID support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 05 Mar 2013 12:37:07 +0200
In-Reply-To: <CAN8TOE_Sb-h7zTp4rUCrx5e0rZHg44iDMM5_zKsgHQORXf3B0g@mail.gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
 <1362415349-7107-13-git-send-email-dedekind1@gmail.com>
 <CAN8TOE_Sb-h7zTp4rUCrx5e0rZHg44iDMM5_zKsgHQORXf3B0g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-03-04 at 11:45 -0800, Brian Norris wrote:
> >  struct nand_flash_dev {
> >         char *name;
> > -       int dev_id;
> > +       union {
> > +               struct {
> > +                       uint8_t mfr_id;
> > +                       uint8_t dev_id;
> > +               };
> > +               uint8_t id[8];
> > +       };
> 
> I'm sorry that I was unable to fully review Huang's code while it was
> being discussed earlier. But from what I read, it seemed there was
> some disagreement on some of the format of the tables (e.g., Artem
> wondered why the extra zeroes). Now, it seems like instead, we're
> including duplicate fields. The "mfr_id" and "dev_id" are always the
> first two bytes of the "id[8]" field. Does it make sense to repeat
> them? And I actually don't ever see where "mfr_id" would be used.

This is not repeating. Because of the union {}, mfr_id's memory address
is identical to id[0]'s address, and dev_id's memory address is
identical to id[1]'s address. You can consider 'mfr_id' and 'dev_id' to
be alias names for id[0] and id[1]. If one needs to have an alias name
for other ID bytes, they can be added.

My idea was that type->mfr_id and type->dev_id is more readable than
type->id[0] and type->id[1].

> There's also the (yet unanswered?) question of whether we reasonably
> would handle in this table both those chips which have their full
> information listed in conjunction with their 8-byte ID string and
> those chips with minimal information in the table, and the rest must
> be decoded from extended ID.

I was thinking that we have a single table which contains both, and we
make sure that all full ID records go first, and device ID-only records
go last. This would mean that we first match by full ID, and then by
device IDs.

> Perhaps the answer to this last question was already assumed to be
> "yes." But how would we differentiate the two types of table entries?
> Simply by seeing whether they filled out "dev_id" vs. "id[8]"? This
> patch doesn't clearly show how the new fields could be used.

I was thinking about

if (type->mfr_id == 0)
	/* this is device-only ID */
else
	/* this is full ID */

or

static inline bool is_full_nand_id(type) {
	return type->mfr_id;
}

> Hopefully my comments make some sense. If they don't, then that
> probably means we need some more discussion before including this last
> patch. If they do make sense, then that probably still means this last
> patch needs to be rewritten and/or included only along with a series
> that can reasonably make use of these fields (like Huang's series).

Sure, this is why you was in "To:" - you are the main NAND janitor
nowadays, because others mostly care about their little drivers, while
you demonstrated skills and will to make the general layer sane.

-- 
Best Regards,
Artem Bityutskiy
