Received: from ns2.discountwebhost.com ([64.170.22.131] helo=ns1.discountwebhost.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17b4BU-0006kF-00
	for <linux-mtd@lists.infradead.org>; Sat, 03 Aug 2002 20:03:28 +0100
Message-Id: <5.1.0.14.0.20020803112646.00ace9d8@64.170.22.132>
Date: Sat, 03 Aug 2002 14:24:32 -0500
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
From: Vipin Malik <mtd-linux@embeddedlinuxworks.com>
Subject: Re: MTD Partition problems
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20020803141013.GA14370@wohnheim.fh-wedel.de>
References: <5.1.0.14.0.20020803074026.02927a48@64.170.22.132>
 <AB8D0DF31D9BD511BE94000347959DC901996389@MXSFRCOHOU01>
 <AB8D0DF31D9BD511BE94000347959DC901996389@MXSFRCOHOU01>
 <5.1.0.14.0.20020803074026.02927a48@64.170.22.132>
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

> >
> > Sorry for the stupid question: If it's by design, why is it going to be
> > ripped out sometime soon?
>
>It might have made sense, when it was designed. It might just have
>been a relatively new developer making the usual mistakes. Whatever.
>
>Fact is that it is useless, the superuser can create a read only
>device simply by 'chmod -w /dev/mtd0', if she wishes. That is all
>those extra devices do, except for causing confusion and eating up
>minor numbers.

So if I read you correctly, you are saying that the partitioning code=20
really works but in a quirky way: the presence of duplicate read only=20
paired devices, which really provide no useful functionality.

However, if one ignores the duplicated devices, one can still use=20
partitioning and mount a JFFS2 fs on one of the partitions while having=20
something completely different on another and device access locking will be=
=20
taken care of by the mtd driver (which is essentially what partitioning=20
provides vs. just calling add_mtd() NUM_PARTITION times in your map file on=
=20
the same flash chip).

Additionally, (say) /dev/mtdblock2 will really provide a handle to=20
/dev/mtd4 the writable third partition on the partitioned flash chip, thus=
=20
mounting the JFFS2 fs on the partition originally intended (the third=20
partition).

Unfortunately, my tests indicate that this is not happening. I know that=20
/dev/mtdblock2 (the intended third partition) is formatted. However JFFS2=20
finds data here and refuses to mount on it. I think it is really being=20
passes a handle to and accesses /dev/mtd2, which is the wrong partition.

/dev/mtdblock[4,5] do not exist, even though /dev/mtd[4,5] do and /dev/mtd4=
=20
is the correct partition that I want!

Argh! I'll try your patches if you like.

Thanks for your answers.

Vipin




>People would get even more confused when suddenly the device nodes
>have different behaviour, which will definitely happen as soon as the
>ro-devices are gone. But I have some patches in my queue that will
>create confusion anyway. You do the math.
>
> > >David, 2.4.19 is released, but I am right in my exam period. Does end
> > >of August and/or beginning of September sound ok for the merge?
> >
> > Should I be using the main CVS code or some branch. The above was with
> > 2.4.19-rc3.
>
>Currently, there is no branch that tackles this problem. There was
>one, but David never took a look, was busy, and rescheduled to 'when
>2.4.19 is out'. Now I am busy,...
>
>J=F6rn
>
>--
>Public Domain  - Free as in Beer
>General Public - Free as in Speech
>BSD License    - Free as in Enterprise
>Shared Source  - Free as in "Work will make you..."
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
