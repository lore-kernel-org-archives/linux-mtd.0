Received: from anchor-post-33.mail.demon.net ([194.217.242.91])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17L1HO-0007t3-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2002 13:43:14 +0100
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: RE: [Fwd: cfi_cmdset_0001.c: do_write_buffer bug] 
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Jun 2002 13:40:14 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B950805E5@OPTEX1.optex.local>
From: "John Hall" <John.Hall@optionexist.co.uk>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <joakim.tjernlund@lumentis.se>,
	<linux-mtd@lists.infradead.org>
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

On 20 June 2002 13:25 David Woodhouse <dwmw2@infradead.org> wrote:

> John.Hall@optionexist.co.uk said:
> >  Not yet. We've spoken to Intel and they acknowledge there might be
> >  a problem, but we're waiting for them to get back to us.

> OK, I suspect what we want to do is something like...
>=20
>  Send WriteToBuffer command.
>  Poll for a little while for chips to become ready.
>  If neither chip is ready, repeat.
>  If only one chip is ready, abort the WriteToBuffer. Send a
>  zero-length (or one-byte) buffer and then something other than a
>  WriteConfirm command, to abort the write. Clear the resulting
>  'Invalid Command/ Sequence' error bits which will get set, and start
>  again.

Possibly. We're going to wait and see what Intel say, and then submit a
patch if needed.

Regards,
John Hall
