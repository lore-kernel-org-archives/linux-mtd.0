Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17azbk-0006H4-00
	for <linux-mtd@lists.infradead.org>; Sat, 03 Aug 2002 15:10:16 +0100
Date: Sat, 3 Aug 2002 16:10:13 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Vipin Malik <vipin@embeddedlinuxworks.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD Partition problems
Message-ID: <20020803141013.GA14370@wohnheim.fh-wedel.de>
References: <AB8D0DF31D9BD511BE94000347959DC901996389@MXSFRCOHOU01> <AB8D0DF31D9BD511BE94000347959DC901996389@MXSFRCOHOU01> <5.1.0.14.0.20020803074026.02927a48@64.170.22.132>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5.1.0.14.0.20020803074026.02927a48@64.170.22.132>
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

On Sat, 3 August 2002 07:47:11 -0500, Vipin Malik wrote:
> >> Is there something broken with the mtd partitioning code?
> >
> >Not really broken, but maybe useless.
> 
> Hmm, useless as in "that functionality has been depricated- a better way is 
> available- use <state better way here>" or useless as in "it's good stuff 
> but currently not working".

Useless as in useless, really. Functionality is added, that is
available anyway.

> >One device of each pair is read-only. This is by design and scheduled
> >to be ripped out sometime.
> 
> Sorry for the stupid question: If it's by design, why is it going to be 
> ripped out sometime soon?

It might have made sense, when it was designed. It might just have
been a relatively new developer making the usual mistakes. Whatever.

Fact is that it is useless, the superuser can create a read only
device simply by 'chmod -w /dev/mtd0', if she wishes. That is all
those extra devices do, except for causing confusion and eating up
minor numbers.

People would get even more confused when suddenly the device nodes
have different behaviour, which will definitely happen as soon as the
ro-devices are gone. But I have some patches in my queue that will
create confusion anyway. You do the math.

> >David, 2.4.19 is released, but I am right in my exam period. Does end
> >of August and/or beginning of September sound ok for the merge?
> 
> Should I be using the main CVS code or some branch. The above was with 
> 2.4.19-rc3.

Currently, there is no branch that tackles this problem. There was
one, but David never took a look, was busy, and rescheduled to 'when
2.4.19 is out'. Now I am busy,...

Jörn

-- 
Public Domain  - Free as in Beer
General Public - Free as in Speech
BSD License    - Free as in Enterprise
Shared Source  - Free as in "Work will make you..."
