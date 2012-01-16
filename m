Received: from lnx503.hrz.tu-darmstadt.de ([130.83.156.232])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmmAF-0002q3-Je
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 12:59:56 +0000
From: Tim Sander <tim01@iss.tu-darmstadt.de>
To: dedekind1@gmail.com
Subject: Re: ubiformat & linux 3.0.14-rt
Date: Mon, 16 Jan 2012 13:59:48 +0100
References: <201201131006.33998.tim01@iss.tu-darmstadt.de>
 <201201161143.23934.tim01@iss.tu-darmstadt.de>
 <1326712798.14299.53.camel@sauron.fi.intel.com>
In-Reply-To: <1326712798.14299.53.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201201161359.49629.tim01@iss.tu-darmstadt.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem

Am Montag, 16. Januar 2012 schrieb Artem Bityutskiy:
> On Mon, 2012-01-16 at 11:43 +0100, Tim Sander wrote:
> > > http://git.infradead.org/ubifs-2.6.git/commit/1f5d78dc4823a85f112aaa2d0
> > > f176 24f8c2a6c52
> > > http://git.infradead.org/ubifs-2.6.git/commit/d34315da9146253351146140e
> > > a4b 277193ee5e5f
> > 
> > Do you think it is worthwhile checking the ubifs 3.0 backport with the
> > above two cherry-picked?
> 
> I've pushed them to the ubifs-v3.0 back-port tree as well. But I think
> they are useless - sorry, I was confused.
Ok i was wondering that logging was causing this cind of behavoir...

> Also, if you say this happens when you run ubiformat - this is something
> about your flash driver. Do you use NOR or NAND? Can you detect which
> interrupt takes too much time? If the theory is that this is your flash
> driver interrupt - can you verify it by injecting some instrumentation
> to the interrupt handler?
This is a arm i.mx35 (pcm43) platform using the nor and nand driver. The 
mxc_nand driver is loaded later which seems to be around the same time this 
message:
"sched: RT throttling activated" comes up and the ubi on the nand gets 
attached. I will see what if i can dig s.t. up with the instrumentation and 
will report back.

Best regards
Tim
