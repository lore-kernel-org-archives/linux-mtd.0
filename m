Received: from phoenix.mvhi.com ([195.224.96.167] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190dn5-0001U8-2X
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 09:40:16 +0100
Received: from [212.234.11.56] (helo=extraetmess.thales-e-transactions.com)
	by phoenix.infradead.org with smtp (Exim 4.10)
	id 190GqE-0001m1-00
	for linux-mtd@lists.infradead.org; Tue, 01 Apr 2003 09:09:58 +0100
Message-ID: <3E894916.926ACDC3@thales-e-transactions.com>
Date: Tue, 01 Apr 2003 10:08:55 +0200
From: "Eric DEJONC" <eric.dejonc@thales-e-transactions.com>
MIME-Version: 1.0
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
References: <3E885040.41874936@thales-e-transactions.com>
	<1049124294.15393.190.camel@ralph.plexio.private>
	<3E88683E.65177484@thales-e-transactions.com>
	<1049128283.23625.196.camel@ralph.plexio.private>
	<20030331165610.GB19168@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: Stephen Lee <splee@plexio.com>
cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: mtd devices inaccessible
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I think i have found the problem, the 2.5.59 kernel has been patched for mtd
suppoirt on trizeps. May be that's why I could'nt get mtd device work
properly on a 2.5.6.2 kernel.

Best regards,
Eric

Jörn Engel a écrit :

> On Mon, 31 March 2003 08:31:24 -0800, Stephen Lee wrote:
> >
> > I presume you meant a 2.5.62 kernel below. Could it be a bug in the mtd
> > subsystem with that developmental kernel? Are you using the MTD cvs
> > patches and if yes, do you really need them? Did you run "make dep"
> > before "make bzImage"?
>
> make dep is unnecessary with 2.5.recent.
>
> Jörn
>
> --
> Premature optimization is the root of all evil.
> -- Donald Knuth
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
