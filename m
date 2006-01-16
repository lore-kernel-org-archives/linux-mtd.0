Received: from fed1rmmtao10.cox.net ([68.230.241.29])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EyaZT-0005pl-Ub
	for linux-mtd@lists.infradead.org; Mon, 16 Jan 2006 15:03:25 -0500
Received: from [192.168.11.9] (really [68.7.81.85]) by fed1rmmtao08.cox.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20060116194655.RGUN26964.fed1rmmtao08.cox.net@[192.168.11.9]>
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2006 14:46:55 -0500
From: rick adams <rgadams@cox.net>
To: linux-mtd@lists.infradead.org
In-Reply-To: <E1EyXiO-0003vi-Vj@canuck.infradead.org>
References: <E1EyXiO-0003vi-Vj@canuck.infradead.org>
Content-Type: text/plain
Date: Mon, 16 Jan 2006 10:49:55 -0800
Message-Id: <1137437396.7786.22.camel@laptop.sandiego.IdealSolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: Any reported mtd issues with Intel Strataflash TE28F128
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-01-16  Ron Kundla <rkundla@gmail.com> wrote:
>
> I've looked at the data sheet for the J3D part and it is identical or
> faster than the J3C part. Intel also states that the J3D part is
> functionally equivalent to the J3C.

Ron

A word of warning of Intels idea of equivalent. A year or so ago I was
working for a client who was modifying a design and changing from a
Strataflash rev J part to a rev K part. Intel had told the client that
the parts were identical except for the form factor and an added feature
(burst mode). They stated that code written for the J part would work
fine on the D part (just the old code wouldn't utilize the new feature).
We were experiencing write failures and traced it to a difference in the
power on initialization state between a rev J part and a rev K part. The
rev J part has all it sectors unlocked at power on reset. The rev K part
has all it sectors locked on power on reset. You might want to compare
of the data sheets and not just take Intels word.

Rick
