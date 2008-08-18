In-Reply-To: <1219056317.18027.2.camel@sauron>
To: dedekind@infradead.org
Subject: Re: ubifs mount size
MIME-Version: 1.0
Message-ID: <OFDF416755.461F244B-ON882574A9.0080A363-882574A9.008152A0@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Mon, 18 Aug 2008 16:32:56 -0700
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd-bounces@lists.infradead.org, dfoley <dfoley@telus.net>,
	linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > 
> > Yes this looks right.  UBIFS doesn't really know how much data canbe 
fitted
> > in the file system, so it makes a worst case estimate.
> 
> In practice you will be able to fit more than what df shows. I will
> write a corresponding FAQ entry which will explain the issue later.
> 

Oh good.  I finally have my 8GiB problem solved (patch forthcoming in the 
next 24 hours probably), but df -h was only showing 6.8GiB and I couldn't 
account for the descrpancy.  I'm looking forward to being able to do that.

Thanks for all the hard work on UBI/UBIFS Artem.  It's working like a 
champ so far.  I'm planning on setting LTP up to run for a couple of weeks 
to really stress it out and I'll let you know how that goes.

FYI, it takes about 45 seconds for the UBI module to load for an 8GiB 
device when I do it by hand.  I think things were a bit faster when UBI is 
built into the kernel.  Once I get that working again I'll update you.

Bruce
