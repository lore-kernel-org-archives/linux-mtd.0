Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RW2aW-0002Ru-DR
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 09:05:53 +0000
Received: by lagu2 with SMTP id u2so794005lag.36
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2011 01:05:50 -0800 (PST)
Subject: Re: [PATCH] nandtest: seed random generator properly
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 01 Dec 2011 11:05:48 +0200
In-Reply-To: <CAN8TOE-zTCY-SRrVpsFExu32yq_3j7FJGgVUBN3CEt_E_qzS8Q@mail.gmail.com>
References: <CAN8TOE-rh_yh_0hi+unXe3Q5zV9tdBW6rhomRG-h3za5A4ROrg@mail.gmail.com>
 <1322503912-8221-1-git-send-email-computersforpeace@gmail.com>
 <OF4FD25221.65A13349-ONC1257957.002904C2-C1257957.00293DF7@phytec.de>
 <CAN8TOE-zTCY-SRrVpsFExu32yq_3j7FJGgVUBN3CEt_E_qzS8Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1322730350.2332.28.camel@koala>
Mime-Version: 1.0
Cc: Jan Weitzel <J.Weitzel@phytec.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-11-30 at 10:24 -0800, Brian Norris wrote:
> On Mon, Nov 28, 2011 at 11:30 PM, Jan Weitzel <J.Weitzel@phytec.de> wrote:
> > Brian Norris <computersforpeace@gmail.com> schrieb am 28.11.2011 19:11:52:
> >> +   if (seed < 0)
> >> +      seed = time(NULL);
> >> +   srand(seed);
> >
> > So you loose all negative seeds.
> 
> Well, srand() technically takes unsigned ints, so all seeds are
> technically positive. But that just means we're parsing and storing
> seeds wrong (not a big deal, really).

Brian, would you please send an incremental patch on top of Jan's which
I've pushed?

Artem.
