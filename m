Received: from mail1.danielind.com ([12.19.96.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15RhmZ-0005ih-00
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jul 2001 23:14:31 +0100
Message-ID: <30724FF712DFD2119E6200104B244892011974C6@mail1>
From: Vipin Malik <Vipin.Malik@daniel.com>
To: 'Kent Borg' <kentborg@borg.org>, Linux Mtd
	 <linux-mtd@lists.infradead.org>
Subject: RE: infradead.org vs kernel.org sources
Date: Tue, 31 Jul 2001 17:05:33 -0500
MIME-Version: 1.0
Content-Type: text/plain
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

>But now I had occasion to look at the stuff I grabbed from the
>infradead cvs repository.  It looks rather different.

AFAIK latest stuff is in the CVS repo. IF you are comparing with the stuff
in the release kernels (is that what you meant by kernel.org?) then you
should be working off the CVS.

>I guess my next move is to drop that infradead sub-tree into the
>linux/drivers/mtd directory and see what happens.  (I think we need to
>directly link, not be a loadable module, so the sources need to be
>merged.)

There is no diff in doing modules vs "merged in" as far as how you link in
the CVS code into the kernel. You can do both (rather either).

>Is this what I want?

Sounds like it. Is it? :)

>-kb, the Kent who hopes to get JFFS working on top of MTD.
Why? Why not JFFS2? It's more stable and full featured (and not to mention
next gen from JFFS). As long as you are using 2.4.x as JFFS2 does not yet
work with 2.2.x

Vipin
