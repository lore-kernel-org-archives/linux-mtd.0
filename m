Received: from anchor-post-32.mail.demon.net ([194.217.242.90])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17L0ok-0007qr-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2002 13:13:38 +0100
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1251"
Subject: RE: [Fwd: cfi_cmdset_0001.c: do_write_buffer bug]
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Jun 2002 12:13:40 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B950805E2@OPTEX1.optex.local>
From: "John Hall" <John.Hall@optionexist.co.uk>
To: <joakim.tjernlund@lumentis.se>
Cc: <linux-mtd@lists.infradead.org>
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

Joakim Tjernlund wrote:

> > I was going to report exactly the same problem this morning. We have
> > an additional problem however. We currently have two Intel Strata
> > Flash parts in 16 bit mode to form a single 32 bit interface to a
> > StrongARM SA1110. We have found that sometimes, one chip returns
> > ready, but the second does not. You are then in a Catch-22 since
> > you're supposed to re-issue the write command to the one that's not
> > ready but cannot to the one that is ready.

> Have made any progress on this? I too have 2 Strata Flash in 16-bit
> mode to form a 32-bit interface. I have yet to encounter this problem
> though.

Not yet. We've spoken to Intel and they acknowledge there might be a
problem, but we're waiting for them to get back to us.

john
