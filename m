Received: from mail1.daniel.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16RMuN-00005G-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2002 00:29:27 +0000
Message-ID: <3C46FBDE.AF159573@daniel.com>
Date: Thu, 17 Jan 2002 10:29:18 -0600
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: dennis noermann <dennis.noermann@noernet.de>
CC: linux-mtd@lists.infradead.org
Subject: Re: experience with max block erase
References: <Pine.LNX.4.33.0201170137210.18875-100000@chaingun.noernet.de>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I would take their word for it as there is no way you can infer anything from
one (or even a couple of) tests.

I take it to mean that they "gurantee" that each sector can _at least_ handle 100K
erases without any chip failures or erase failures.
That's just my take.

AMD claims (gurantees?) 1million erase cycles/sector!

Vipin


dennis noermann wrote:

> Hi
> i am intrested in testing some Intel Flash
> how much erase cycles it realy can do
>
> does someone has done this before ?
>
> i have some intel strata flash 28F640J3A
>
> "Each block can be independently erased 100,000 times"
>
> is this like the "food expiry date" ore "best before date" ?
> (sorry i dont know the right englisch word , but i think you undertstand it :) )
>
> ore have i to write some eraseprogramm and wait a long time :)
>
> dennis
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
