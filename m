Received: from sky.skycomputers.com ([198.4.246.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18IvHj-0003cG-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2002 18:27:12 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Brian Waite <waite@skycomputers.com>
To: Russ Dill <Russ.Dill@asu.edu>
Subject: Re: Newbie question
Date: Mon, 2 Dec 2002 13:57:43 -0500
Cc: linux-mtd@lists.infradead.org
References: <200212021323.28860.waite@skycomputers.com> <1038855329.13667.0.camel@timmy>
In-Reply-To: <1038855329.13667.0.camel@timmy>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200212021357.43611.waite@skycomputers.com>
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

I love it when good design shines. I can't wait to get the board up and w=
atch=20
the magic. Thanks for the information!
Brian
\On Monday 02 December 2002 1:55 pm, Russ Dill wrote:
> On Mon, 2002-12-02 at 11:23, Brian Waite wrote:
> > Hi,
> > I am very new to the MTD world and I had a quick question that may ra=
nk
> > in the RTFM land, but I am doing that and not finding an answer. I ha=
ve a
> > board that has 2-2x16 128 Mbit Intel StrataFLASHes side by side that =
I
> > want to run with the MTD layer. It looks like the cfi_cmdset_001.c wi=
ll
> > work except I have to issue commands to both FLASH chips at the same
> > time. Has anyone implimented something like this? Is there some
> > documentation other than the infradead site? As long as this is up to
> > date I am happy, but I wasn't convinced it is fully up-to-date. I am
> > coming the archives so even a quick subject line pointer would be gre=
at.
>
> something like this just "works" (due to a lot of good programming)
