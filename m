Received: from cpdvg201.cms.usa.net ([165.212.10.5])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tujg-0004MV-00
	for <linux-mtd@lists.infradead.org>; Wed, 17 Oct 2001 18:44:08 +0100
Message-ID: <20011017175322.3246.qmail@cpdvg201.cms.usa.net>
Date: 17 Oct 2001 10:53:21 PDT
From: Eric <ebrower@usa.net>
To: linux-mtd@lists.infradead.org
Subject: Re: [MTD partitioning rewrite]
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> [ ... ] might even grow into a complete rewrite of the central =

> MTD code. We will see, how much is needed...

I applaud your decision to modify the partitioning scheme, and in
a few areas the central code could use spring-cleaning; however, =

a re-write of the central code is scary business unless you have
a lot of hardware with which to test and folks here aggressively =

audit the work.  I have yet to see "re-writes" that did not impact
the codebase stability.

> - An MTD device will be the equivalent of a hard drive. There will be
> several, named mtda, mtdb, mtdc,...

Hooray!  This would be a welcome change.  Perhaps we can also eliminate
the restriction of 16 char device maximum (yes, it does affect me in a
non-academic way).

> - The ro-devices don't seem to be necessary. If noone has strong
> objections, I will just discard those.

No complaints here.

> - The partitioning should stay out of the mapping drivers as much as
> possible. The mapping driver only supplies a pointer to the partition
> table parser. When the device is registered, the partitioning will
> automatically be read.

I'd like more implementation details, but the separation is welcome.
It does seem a bit silly to re-write the mapping driver just for a
new partitioning scheme.  Perhaps we can treat it like a disk in =

this regard and "scan" it for a partition table.

> If anyone has questions, comments, code sniplets, ideas, anything, you
> can contact me privately on through the list. I will only try to do
> the best, _I_ can do and hope, David approves it.

Sounds like a worthy plan to me.  I'd suggest holding-off on the =

"complete rewrite" until after this new functionality has been
added, though :)

E
