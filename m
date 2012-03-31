Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SDn2R-0004YY-Ib
 for linux-mtd@lists.infradead.org; Sat, 31 Mar 2012 01:23:32 +0000
Message-ID: <4F765C88.5020306@newsguy.com>
Date: Fri, 30 Mar 2012 18:23:20 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
 <20120316111939.GA10362@parrot.com> <4F636964.3030904@newsguy.com>
 <20120316184345.GF10228@parrot.com> <4F64F17C.2070409@newsguy.com>
 <1333117016.5440.41.camel@sauron.fi.intel.com>
In-Reply-To: <1333117016.5440.41.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Ivan Djelic <ivan.djelic@parrot.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/30/2012 07:16 AM, Artem Bityutskiy wrote:
> On Sat, 2012-03-17 at 13:18 -0700, Mike Dunn wrote:
>> Before I start on this, I'd like to get a
>> blessing from Artem / David, since the chamges will touch many drivers
>> in a
>> somehat non-trivial manner. 
> 
> Come on Mike, just go ahead without blessings. The stuff you are want to
> do very important I believe. Currently MTD is basically lacking behind
> the technology.


How about just a slight nod in my general direction?  :)

OK, I was letting it rest until the merge window passed, which was good because
it gave Brian time to point out my blunder.

Mike
