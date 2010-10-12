Received: from relay2.mail.timico.net ([62.121.20.90] helo=relay.timico.net)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P5b6H-0007HC-UN
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 09:24:51 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Content-Class: urn:content-classes:message
Date: Tue, 12 Oct 2010 10:24:44 +0100
Subject: RE: [RFC] mtd: add MEMSETGOODBLOCK ioctl
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093EEAAB3A@Cloud.RL.local>
In-Reply-To: <1286874177.2164.14.camel@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Mike Frysinger <vapier@gentoo.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Just to make clear, this patch should NOT go in in the present form.
I am just posting it to see if some discussion starts about how this
should be done.

In the current form, it's just a hack that works for me.

Artem Bityutskiy wrote:
> On Wed, 2010-10-06 at 12:21 +0900, Jon Povey wrote:
>> Adds the MEMSETGOODBLOCK ioctl, inverse operation of MEMSETBADBLOCK
>> for times when you really are sure that a block is good, but was
>> marked bad in error.

> Briefly looked - you do not have any locking. You should have some
> nand_get_device() calls.

I pretty much copy-pasted from the existing SETBADBLOCK support, maybe
I missed something or maybe they are missing locking too.

> Also, did you investigate whether it is possible to
> distinguish between
> factory-marked bad eraseblocks and user-marked bad eraseblocks?

Yes, that can be done. They have different bits in the BBT. This ioctl
ignores them though, for my purposes sometimes MTD thinks blocks are
factory-bad when they are not. This ioctl says "I don't care why you
think this block is bad, I know better".

Thinking about this, to handle well in userland software,
MEMGETBADBLOCK should return more than just boolean BAD or GOOD, maybe
it should return different values for factory bad, reserved, went-bad.

The mtd-abi.h doesn't seem to have any spec, it looks like it comes
from nand_bbt.c:nand_isbad_bbt() which returns only 0 or 1.
Don't know if this could be quietly extended without breaking ABI.

> Also, if this patch to go in, I'd really like to see some Reviewed-by
> and Tested by. Or some good list of setups where you tested this
> yourself and how you did this. Is this possible?

Sure. But this isn't even ready for that kind of testing in my opinion.
Like I say it's a hack and conversation-starter.

> Let's CC Mike who was interested in this and Brian who was doing great
> job in the BBT area recently and could review this patch.



--
Jon Povey
jon.povey@racelogic.co.uk

Racelogic is a limited company registered in England. Registered number 274=
3719 .
Registered Office Unit 10, Swan Business Centre, Osier Way, Buckingham, Buc=
ks, MK18 1TB .

The information contained in this electronic mail transmission is intended =
by Racelogic Ltd for the use of the named individual or entity to which it =
is directed and may contain information that is confidential or privileged.=
 If you have received this electronic mail transmission in error, please de=
lete it from your system without copying or forwarding it, and notify the s=
ender of the error by reply email so that the sender's address records can =
be corrected. The views expressed by the sender of this communication do no=
t necessarily represent those of Racelogic Ltd. Please note that Racelogic =
reserves the right to monitor e-mail communications passing through its net=
work
