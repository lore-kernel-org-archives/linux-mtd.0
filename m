Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQubG-0003u5-U6
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 08:14:47 +0000
Message-ID: <1395389636.5163.104.camel@sauron.fi.intel.com>
Subject: Re: Corrupt empty space
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Fri, 21 Mar 2014 10:13:56 +0200
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB4DF3@DBDE04.ent.ti.com>
References: <D2D3E4C4A672E847B422D1E5F695E1A402E61608@sreublc136.eu.labinal.snecma>
 <aadf057c868c47128845c19d69933c46@BLUPR08MB103.namprd08.prod.outlook.com>
 <1394524000.6302.217.camel@sauron.fi.intel.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB4DAF@DBDE04.ent.ti.com>
 <1395387117.5163.79.camel@sauron.fi.intel.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB4DF3@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 HOUR =?ISO-8859-1?Q?Fr=E9deric?= <frederic.hour@safran-engineering.com>,
 Kent Li <Kent.Li@radisys.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-03-21 at 07:50 +0000, Gupta, Pekon wrote:
> Also, as there are multiple threads on same topic, If would be helpful
> if you can review and continue discussion over there.

Pekon, I apologise, I do not have time to review these threads now. If
this is difficult to implement generically on the MTD level, I trust
you.

I think there are only few places where UBI or UBIFS really need to know
an answer to the following question: is this min. I/O unit empty (never
written to) or not?

1. Recovery in UBIFS
2. Auto-formatting decision in UBI/UBIFS
3. Some debugging stuff in UBI where we try to make sure we write only
to empty pages.

If MTD layer provides helpers which UBIFS could call to get the answer,
that could probably work.

I mean, probably it is not necessary to make every read do this empty
page processing. It would be cool, but if the price is read throughput
drop, probably not worth it. All MTD reads can be the old style reads
which give no ECC protection when the page is empty. This could be
documented somewhere, BTW, in the code, and web site, too.

Then when UBI/UBIFS needs to know whether certain min. I/O unit is empty
or not, then UBI/UBIFS calls a special MTD helper function to get the
answer.

This would probably need some work in UBI/UBIFS, but I think this should
not be too difficult.

-- 
Best Regards,
Artem Bityutskiy
