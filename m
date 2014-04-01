Received: from mail-pb0-x234.google.com ([2607:f8b0:400e:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUtzk-0002Z5-1H
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 08:24:32 +0000
Received: by mail-pb0-f52.google.com with SMTP id rr13so9539909pbb.11
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 01:24:10 -0700 (PDT)
Date: Tue, 1 Apr 2014 01:24:06 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v4 4/5] mtd: nand: Allocate extra buffers needed for
 on-die ECC controller.
Message-ID: <20140401082406.GF6400@brian-ubuntu>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-5-git-send-email-davidm@egauge.net>
 <20140401072815.GC6400@brian-ubuntu>
 <20980858CB6D3A4BAE95CA194937D5E73EABA125@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EABA125@DBDE04.ent.ti.com>
Cc: David Mosberger <davidm@egauge.net>, "gsi@denx.de" <gsi@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On Tue, Apr 01, 2014 at 07:37:46AM +0000, Pekon Gupta wrote:
> >From: Brian Norris [mailto:computersforpeace@gmail.com]
> >>On Mon, Mar 31, 2014 at 05:28:56PM -0600, David Mosberger wrote:
> [...]
> >> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> >> index dbb99b3..456809b 100644
> >> --- a/include/linux/mtd/nand.h
> >> +++ b/include/linux/mtd/nand.h
> >> @@ -533,6 +533,8 @@ struct nand_buffers {
> >>  	uint8_t	*ecccalc;
> >>  	uint8_t	*ecccode;
> >>  	uint8_t *databuf;
> >> +	uint8_t *chkbuf;
> >> +	uint8_t *rawbuf;
> >
> >Do you really need two additional buffers? Can you get by with just one
> >of them?
> >
> 
> Some similar comments have been provided in the previous versions
> of the patch. But due to in-consistency in $subject, they might not
> be visible as a thread of same discussion.

Yeah, I didn't review every iteration so far. I'm possibly repeating
some things. I'll see where to respond on the old threads.

But here's a note to David: it looks like you sent 4 revisions in one
week. That's a bit fast. Perhaps you can wait a few more days on
spinning patch sets, especially when review is straddling a weekend like
that.

> You may like to review and comment on below threads also.
> 
> [PATCH] mtd: nand: Add support for Micron on-die ECC controller (rev2).
> http://lists.infradead.org/pipermail/linux-mtd/2014-March/052949.html
> 
> [RFC] mtd: nand: Preparatory patch for adding on-die ECC controller support ...
> http://lists.infradead.org/pipermail/linux-mtd/2014-March/052969.html

Brian
