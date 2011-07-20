Received: from mail.elutions.com ([64.31.159.3])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjVDA-0002Th-00
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2011 11:45:08 +0000
Received: from mail.elutions.com (127.0.0.1) by mail.elutions.com (MlfMTA
	v3.2r9) id h4qmd00171sf for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jul 2011 06:24:13 -0400 (envelope-from
	<prvs=1182c31cb7=mhench@elutions.com>)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Regression in handling of unsafe UBI shutdown
Date: Wed, 20 Jul 2011 07:45:04 -0400
Message-ID: <F87D23B7E1F84E4AB52E4FA4A55F85DC026DADA5@tpamail.elutions.com>
In-Reply-To: <CACTFLANAFT=G4kFvHUqvLrt=MxgpJnJ-EeHY8zd49pZvsNRejw@mail.gmail.com>
From: "Mike Hench" <mhench@elutions.com>
To: "Daniel Mack" <zonque@gmail.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	Sven Neumann <s.neumann@raumfeld.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> UBIFS: recovery needed
> Error reading superblock on volume 'ubi:RootFS'!
> UBIFS not mounted, use ubifs mount to mount volume first!
> Wrong Image Format for bootm command
> ERROR: can't get kernel image!


Be nice to know what error.
FWIW:
a) I do not see this. I have very limited experience with 3.0-rc7 though
so maybe I should not say anything :-)

b) sometimes UBIFS decides to do recovery in u-boot, sometimes not.
it seems to depend on the type of content in the journal.
Lots of deleted files seem to trigger u-boot to perform a recovery for
instance.
I was running out of memory In u-boot while replaying the journal
at one point with an older kernel. This produced the same top level
error.
I run 12 megs now, with a 2gigabyte flash. I think that is overkill.

Work with u-boot with the 'bad' flash.
There is debugging in there, but I forget how to turn it on.

Mike Hench
