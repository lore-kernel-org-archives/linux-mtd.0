Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S60Bt-0001WM-NG
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 13:49:06 +0000
Message-ID: <1331301084.29445.34.camel@sauron.fi.intel.com>
Subject: Re: UBI/ubifs problem
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Fri, 09 Mar 2012 15:51:24 +0200
In-Reply-To: <Pine.LNX.4.64.1203091444540.21132@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1202161543340.13194@lnxricardw.se.axis.com>
 <Pine.LNX.4.64.1202171107440.13194@lnxricardw.se.axis.com>
 <1331131250.32316.8.camel@sauron.fi.intel.com>
 <Pine.LNX.4.64.1203071723410.21132@lnxricardw.se.axis.com>
 <1331138261.3463.19.camel@sauron.fi.intel.com>
 <Pine.LNX.4.64.1203080606110.24516@lnxricardw.se.axis.com>
 <1331300366.29445.31.camel@sauron.fi.intel.com>
 <Pine.LNX.4.64.1203091444540.21132@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2012-03-09 at 14:45 +0100, Ricard Wanderlof wrote:
> On Fri, 9 Mar 2012, Artem Bityutskiy wrote:
> 
> >> I think what I'm thinking about is that in the specialized case of ubifs
> >> used for a read-only file system, such as a root file system (without
> >> /etc, /var, and so on), it would be possible for mkfs.ubifs to create a
> >> file system, and use as many LEBs as it needs for the actual data. On a
> >> read-only file system there doesn't even have to be a journal, although I
> >> don't know if that is possible.
> >
> > Well, I'd accept a patch which added a --optimize-for-ro option which
> > would prepare a file-system with the smallest journal size.
> 
> Can the journal be eliminated completely or does something in ubifs 
> require there to be a journal at all times, albeit small?

I think currently at least 5 LEBs are required:

/* Minimum number of logical eraseblocks in the log */
#define UBIFS_MIN_LOG_LEBS 2
/* Minimum number of bud logical eraseblocks (one for each head) */
#define UBIFS_MIN_BUD_LEBS 3
/* Minimum number of journal logical eraseblocks */
#define UBIFS_MIN_JNL_LEBS (UBIFS_MIN_LOG_LEBS + UBIFS_MIN_BUD_LEBS)

-- 
Best Regards,
Artem Bityutskiy
