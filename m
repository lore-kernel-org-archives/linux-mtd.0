In-Reply-To: <1226468289.16925.28.camel@sauron>
To: dedekind@infradead.org
Subject: Re: MTD/flash perfomance statistics
MIME-Version: 1.0
Message-ID: <OF3F0C9F32.73BC6467-ON882574FF.002E7DB9-882574FF.002EB9A6@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Wed, 12 Nov 2008 00:30:49 -0800
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind@infradead.org> wrote on 11/11/2008 09:38:09 PM:

> On Tue, 2008-11-11 at 10:08 -0800, Bruce_Leonard@selinc.com wrote:
> > We're using UBIFS/UBI/MTD/NAND and we want to find out how much of our 

> > time is spent accessing the flash.  Are there any tools or is there 
any 
> > code in that chain that collects any sort of statistics on flash 
> > performace/utilization?  I could do something as crude as a counter in 
my 
> > NAND driver, but if there's anything more sophisticated that I can 
just 
> > "use out of the box" so to speak that would be better.  Thanks.
> 
> Not sure what exactly you need, but probably you want oprofile?
> 

Well, I'm not sure exactly what I need either :).  What the 
application/diagnostic guys are looking for is a way to determine (to some 
degree) how "hard" we're "beating" on the flash.  How much of the 
processor's time are we spending just reading and writting to the flash as 
well as how often.  I think what they're after is a means to try and 
guestimate how long our flash will last given how frequently we're 
writting/erasing it.  We'll take a look at oprofile.  Thanks.

Bruce
