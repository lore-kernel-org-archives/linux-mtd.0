Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCs0k-0002RP-D4
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:34:31 +0000
Message-ID: <1362490491.2943.54.camel@sauron>
Subject: Re: [PATCH 10/12] mtd: nand_ids: introduce helper macros
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 05 Mar 2013 15:34:51 +0200
In-Reply-To: <CAN8TOE_Db-qpWE_a_JAW7QBjyVb-uj2fYBDnuAcBn95yrHFr+Q@mail.gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
 <1362415349-7107-11-git-send-email-dedekind1@gmail.com>
 <CAN8TOE_Db-qpWE_a_JAW7QBjyVb-uj2fYBDnuAcBn95yrHFr+Q@mail.gmail.com>
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

On Mon, 2013-03-04 at 11:23 -0800, Brian Norris wrote:
> > +/*
> > + * A helper for defining older chips which did not have page size and
> > + * eraseblock size encoded in the chip ID bytes.
> > + */
> 
> Do the "TABLE_NAND" flash really "not have page size and eraseblock
> size encoded in the chip ID bytes"? I would say they have them
> "encoded" in a way: the encoding is just a 1-to-1 constant mapping!
> 
> The real difference between TABLE_NAND and EXTENDED_ID_NAND is that
> with EXTENDED_ID_NAND, manufacturers overloaded the same device ID so
> that the device ID now only represented a particular total chip size
> (and voltage, buswidth), and the page size, eraseblock size, and OOB
> size could vary while using the same device ID.
> 
> I don't know if I'm just being too picky here or if this actually is
> worth clarifying/improving these comments. One candidate change:
> 
> "A helper for defining older chips whose device ID determines their
> page size and eraseblock size."

No, you are not picky, you are pointing to a serious flaw in my
commentaries. Thank you. I'll update the comments accordingly and send
out the new version for your review.

-- 
Best Regards,
Artem Bityutskiy
