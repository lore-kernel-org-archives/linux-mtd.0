From: David Woodhouse <dwmw2@infradead.org>
To: Chris Carlson <ccarlson@istor.com>
In-Reply-To: <7D036BD3216A084DB1BD9D62BCEAF29049A3C7@mail1irv.inside.istor.com>
References: 
	 <7D036BD3216A084DB1BD9D62BCEAF29049A3C7@mail1irv.inside.istor.com>
Content-Type: text/plain
Message-Id: <1077272582.18703.1590.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 20 Feb 2004 10:23:03 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Old version of Linux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-02-19 at 14:23 -0800, Chris Carlson wrote:
> The problem with this solution is:
>   1 - We have to figure out how to merge all the enhancements MontaVista
> put in.

Which of these enhancements are _required_ features? List each one
specifically and people could perhaps provide you with a pointer to the
current patches which provide these features.

>   2 - We have to probably rebuild all of the Unix utilities and
> libraries.

No. Nothing should need to change in userspace.

>   3 - We have to port all of our internally written drivers to support
> the new release.

Very little should need to change; we don't break backward compatibility
(much) during a stable series. From 2.4.17 to 2.4.24 you really
shouldn't have trouble.

> My concern is that the above will be months of work (since I have to do
> it by myself).

I'd guess hours instead of months.

> The other solution is to see if I can port your latest drivers to the
> old Linux.

That's also possible. Start by taking an older copy of compatmac.h
before I stripped all the ancient crap out of it. 

It's probably quicker, and saner, to update your kernel to 2.4.24
though.

-- 
dwmw2
