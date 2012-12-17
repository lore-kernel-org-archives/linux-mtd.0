Received: from plane.gmane.org ([80.91.229.3])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TkPIF-0006vo-13
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2012 01:14:56 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1TkPIO-00043v-NC
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2012 02:15:05 +0100
Received: from mail.nanometrics.ca ([mail.nanometrics.ca])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Mon, 17 Dec 2012 02:15:04 +0100
Received: from christophercordahi by mail.nanometrics.ca with local (Gmexim
 0.1 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Mon, 17 Dec 2012 02:15:04 +0100
To: linux-mtd@lists.infradead.org
From: Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH 1/3] mtd: cmdlinepart: make the partitions rule more strict
Date: Mon, 17 Dec 2012 01:11:24 +0000 (UTC)
Message-ID: <loom.20121217T021112-577@post.gmane.org>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
 <1346656701.3061.8.camel@sauron.fi.intel.com>
 <CAMiH66GX7h5tve9CLHzj8MMrUv90fL+4BWYPZ6KQkP5bbXY9ag@mail.gmail.com>
 <1346686544.3061.75.camel@sauron.fi.intel.com>
 <20120904144826.7b9b7518@halley> <5046B504.6000608@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Huang Shijie <b32955 <at> freescale.com> writes:

> 于 2012年09月04日 19:48, Shmulik Ladkani 写道:
> >
> > My POV is that sorting and verification is not needed, is troublesome,
> > and might affect users in ways they don't expect.
> >
> > So far, mtdparts commandline parsing has been very lenient and liberal.
> > I think we should keep this approach; give the user the flexibility,
> > he'll be responsible to provide meaningful cmdline parts for his
> > system.
> >
> > Actually, Huang's initial complaint was that 'parse_cmdline_partitions'
> > was too strict - the truncated partition was not registered!
> >
> > Now, philosophy aside, let's talk about some usecases that might break.
> >
> > I remember overlapping partitions (more precisely, partition that is a
> > subset of another) being common in some embedded systems, where the
> > "rootfs" and "kernel" partitions are a subset of the "overall image"
> > partition.
> > Why break this? if users enjoy the flexibility, and careful not to
> > create silly partitions, I'm in favor of keeping the flexibility.
> >
> > Same goes for sorting.
> > If one has a system hacked to work with mtd0 hardcodedly, but mtd0's
> > physical location is somewhere at the end of the device, why reorder the
> > partitions enumeration affecting this system?
> >
> > I'd say keep it simple and flexible.
> yes, it's really simple and flexible.

Is it agreed that sorting is not necessary and will not be implemented?
If so are there objections to me modifying the documentation to indicate
that out of order partitions is part of the supported design?

In my embedded distribution, I would like to introduce a MTD partition
at the end of the list to not affect existing hardcoded MTD numbers.

The fw_printenv/fw_setenv command line interface to U-Boot environment
makes use of a /etc/fw_env.config with hardcoded device numbers which
would be broken by a sort.

Although my out of order partitions worked, I couldn't find any
documentation indicating it was a supported feature.  This thread with
Artem's support for sorting got me worried.

If the only reason for sorting is to prevent overlapping partitions,
I think this can be written just as efficiently without a sort although
Shmulik also gives a reason why this restriction should not exist.
I'd prefer to accept that task rather than have to handle changing
MTD numbers.

> But I think it's not wise to export the 0-size partition to user.
> The user may confused at this.

Although I just submitted a patch to improve this, personally I think
if a user specifies a zero sized partition, they should get it.  Or if
it's inherently incorrect I think it should be an error.  Similarly
I'd expect the same for truncated partitions, either provide the size
specified or error.  Since I don't ever foresee using either of these
two features I don't have any objections to current situation.  These
are just my $0.02

--
Chris
