In-Reply-To: <1226995509.16925.115.camel@sauron>
To: dedekind@infradead.org
Subject: Re: MTD/flash perfomance statistics
MIME-Version: 1.0
Message-ID: <OFD5C7E2A2.7ED96530-ON88257508.0065AD14-88257508.0066ADDB@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Fri, 21 Nov 2008 10:41:38 -0800
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

Hi Artem,

Artem Bityutskiy <dedekind@infradead.org> wrote on 11/18/2008 12:05:09 AM:

> On Mon, 2008-11-17 at 15:42 -0800, Bruce_Leonard@selinc.com wrote:
> > "They appear to be going the wrong way.  We're looking for runtime 
> > diagnostic-y type of things (i.e. Number of writes to the flash, 
number of 
> > bad blocks, statistics from the wear leveler to see how the wear 
leveling 
> > is going, etc.)  Things that don't take a lot of CPU time to do, like 
> > counters, that we can use to give us information on what a customer's 
box 
> > may or may not be doing in the field.  A ready example that comes to 
mind 
> > is ethernet statistics, bytes/packets sent/recieved, error counts, 
etc. Or 
> > if you want a storage analog, things like you would see in 
> > /sys/block/hda/stat but adapted to make sense in Flash storage."
> 
> I see. No, we do not really provide this statistics, just because no one
> needed this. Please, give me the list of what exactly you would like to
> know, and I will try to implement this for you.
> 

Okay, a bit more info has trickled in from the application guys.  We don't 
know exactly what we want, but something is better than nothing :).  What 
we're looking for is information regarding how often we're 
reading/writting the flash, how many factory bad blocks there are, how 
many bad blocks have developed over time.  We want to be able to make a 
rough estimate of how long a part is going to last, based on the part 
itself (i.e., number of bad blocks) and any given customer's usage of the 
product (i.e., how often is the part being accessed, how many new bad 
blocks have developed, how well is the UBI wear leveling working) wich 
will vary from customer to customer depending on how they're using the 
product.  It doesn't have to be anything sophisticated and I think 
primarily what the app guys are after are things that UBI probably already 
tracks for the wear leveling (i.e., number of writes and bad blocks).

Does this help?

Thanks.

Bruce
