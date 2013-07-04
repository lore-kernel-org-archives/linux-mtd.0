Received: from antispam02.maxim-ic.com ([205.153.101.183]
 helo=antispam02.maximintegrated.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UujG4-0007jO-P1
 for linux-mtd@lists.infradead.org; Thu, 04 Jul 2013 13:07:37 +0000
From: Brian Foster <brian.foster@maximintegrated.com>
To: David Mosberger-Tang <dmosberger@gmail.com>
Subject: Re: [Q] Using Micron 4-bit on-die ECC with v2.6.36 kernel?
Date: Thu, 4 Jul 2013 15:07:10 +0200
Message-ID: <2596872.0DU6ch1YoB@laclwks004>
In-Reply-To: <CACwUX0PaXg+hAqjeB2AK+7FEzr506RTNfNSHQAW+BJ-AnAQxKA@mail.gmail.com>
References: <17588192.75Agdljyqk@laclwks004> <2488729.MWQE1XjhTW@laclwks004>
 <CACwUX0PaXg+hAqjeB2AK+7FEzr506RTNfNSHQAW+BJ-AnAQxKA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 04-July-2013 05:37:23 David Mosberger-Tang wrote:
> BBT markers don't assume ECC correction (there are multiple copies).

 At least in v2.6.36, that is misleading albeit not
 incorrect.  There _is_ a duplicate BBT block (called
 the =E2=80=9Cmirror=E2=80=9D), but neither it nor the primary BBT bloc=
k
 have multiple copies of the BBT marker (or the version).
 (And, as it happens, the markers differ between the two
 blocks (I'm not too sure why?).)

 So, unless both BBT blocks fail, you _should_ always
 be able to find and use one.  What happens if both
 happen to fail (in v2.6.36) is not-clear (to me).

 I have not checked to see what the situation is in the
 latest kernel.

> However, I certainly agree that it'd be better to check all bits
> covered by ECC.  It just didn't even cross my mind when we wrote
> the code in question.  Had much bigger fish to fry at the time,
> like do we need to recall all the devices in the field...

 I quite understand!  Fortunately for us, there's no reason
 to recall any of our devices, since they are reference
 boards that come with the full source, which can be updated
 from our GIT servers.  Hence, the users/developers can do
 what they like.  What it does mean is I have to be a bit
 careful not to break the existing (=E2=80=9Clegacy=E2=80=9D) situation=
!

cheers!
=09-blf-

--=20
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated               |  http://www.maximintegrated.com/
