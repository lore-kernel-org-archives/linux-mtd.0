Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PkzkL-0000sY-SD
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2011 14:01:18 +0000
In-Reply-To: <1ACF9E26-CE29-4288-96EA-A6FA8CDCFD3B@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF6FB39892.8BB946B6-ONC1257823.006654EE-C1257823.006801B7@transmode.se>
	<F4EC0B87-B4D8-4577-A36B-64E1723634BC@prograde.net>
	<OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>
	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>
	<OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>
	<626D0191-85FC-41E2-94C7-CBFF9D9629BE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>
	<1ACF9E26-CE29-4288-96EA-A6FA8CDCFD3B@prograde.net>
Subject: Re: Numonyx NOR and chip->mutex bug?
To: Michael Cashwell <mboards@prograde.net>
Message-ID: <OF77B2F599.7C3F8513-ONC125782C.004C3AA4-C125782C.004D04E1@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 3 Feb 2011 15:01:15 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	Stefan Bigler <stefan.bigler@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Michael Cashwell <mboards@prograde.net> wrote on 2011/02/03 14:24:53:
> On Feb 3, 2011, at 3:11 AM, Joakim Tjernlund wrote:
>
> > Michael Cashwell <mboards@prograde.net> wrote on 2011/02/02 22:19:58:
> >>
> >
> >> Note, the SR[7,2] bits its says are cleared by the command are not the error bits we're talking about. 7 and 2 are WSM-ready and erase-complete. The error bits are different ones. Maybe that's the confusion?
> >
> > Yeah, didn't read this thoroughly enough, the comment talks about the status bits though. Seems like the safe thing to do even though I don't recall anyone running into this problem before.
>
> Agreed. I expect it would only matter if the intervening operation (likely a buffered write) itself both failed and left its own error bits in the register. For all I know that can't happen because the status clear is done as part of handling those errors.
>
> > Send it as a separate git patch though.
>
> Is this a nudge to separate the patches (eg: don't do unrelated things in one patch), or are you saying the patch format must be based on a git tree? I must admit lameness regarding using git as it was not part of the workflow I inherited.

Both actually. I guess the patch doesn't doesn't have to be formatted with git but it
needs to follow some rules, see Documentation/SubmittingPatches

 Jocke

PS.
   Please hit enter every now and then :)
