Received: from ns2.discountwebhost.com ([64.170.22.131] helo=ns1.discountwebhost.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17axyw-00065Y-00
	for <linux-mtd@lists.infradead.org>; Sat, 03 Aug 2002 13:26:06 +0100
Message-Id: <5.1.0.14.0.20020803074026.02927a48@64.170.22.132>
Date: Sat, 03 Aug 2002 07:47:11 -0500
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: MTD Partition problems
Cc: linux-mtd@lists.infradead.org,David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020803094616.GA13044@wohnheim.fh-wedel.de>
References: <AB8D0DF31D9BD511BE94000347959DC901996389@MXSFRCOHOU01>
 <AB8D0DF31D9BD511BE94000347959DC901996389@MXSFRCOHOU01>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable
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

At 11:46 AM 8/3/2002 +0200, J=F6rn Engel wrote:
>On Fri, 2 August 2002 16:59:07 -0500, Malik, Vipin [FRCO/HOU] wrote:
> > I'm just getting back into playing with this.
> >
> > Is there something broken with the mtd partitioning code?
>
>Not really broken, but maybe useless.


Hmm, useless as in "that functionality has been depricated- a better way is=
=20
available- use <state better way here>" or useless as in "it's good stuff=20
but currently not working".

I am (almost) sure that it was working and allowed me to setup different=20
read/write partitions on the same flash chip (about 9-12 months ago).



> > I defined 3 mtd partitions on one 8MB flash. The partitions look fine=20
> on the
> > debug log and a "cat /proc/mtd" shows three devices with the proper=
 sizes
> > and names as defined in my "mtd_partition" map structure in my map file.
> >
> > However, it seems that 6 mtd partitions have been added (even though=
 just 3
> > show up in /proc/mtd)!
> >
> > Each of mtd[0,1], mtd[2,3] and mtd[4,5] pairs point to partitions 1,2&3
> > respectively. Each of the pairs point to the same partitions (have the=
 same
> > stuff in them).
>
>One device of each pair is read-only. This is by design and scheduled
>to be ripped out sometime.


Sorry for the stupid question: If it's by design, why is it going to be=20
ripped out sometime soon?


>David, 2.4.19 is released, but I am right in my exam period. Does end
>of August and/or beginning of September sound ok for the merge?


Should I be using the main CVS code or some branch. The above was with=20
2.4.19-rc3.

Thanks

Vipin
P.S. I noticed that my original mail did show up, but not at work. Hmmm.=20
Sorry for the duplicate post.



>J=F6rn
>
>--
>Beware of bugs in the above code; I have only proved it correct, but
>not tried it.
>-- Donald Knuth
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
