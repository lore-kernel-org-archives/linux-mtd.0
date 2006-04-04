Received: from uproxy.gmail.com ([66.249.92.193])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQaO0-0003EC-3I
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 21:31:15 -0400
Received: by uproxy.gmail.com with SMTP id j3so659743ugf
	for <linux-mtd@lists.infradead.org>;
	Mon, 03 Apr 2006 18:31:03 -0700 (PDT)
Message-ID: <625fc13d0604031831k12a99c66r26cc901950636ceb@mail.gmail.com>
Date: Mon, 3 Apr 2006 20:31:03 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Mikolaj Kolakowski" <mikolaj.kolakowski@gmail.com>
In-Reply-To: <6516efa10603300419u3ad488ds8f8fa13c8195c66c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <6516efa10603300419u3ad488ds8f8fa13c8195c66c@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 erase suspend
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/30/06, Mikolaj Kolakowski <mikolaj.kolakowski@gmail.com> wrote:
> Anybody can explain how erase suspend should work from the macro
> perspective?
>
> I assume that when I delete huge file and JFFS2 starts erasing sectors th=
en
> when I try to write small amount of data I shouldn't wait until all the
> sectors on a erase pending list will be erased? The write should stop
> erasing. Is it true?

It's a chip level feature, so it depends on the chip.  Also, JFFS2
itself does nothing in that area.  It's up to the MTD driver
underneath to deal with suspending erases.

> On my system I observe that erase suspend is supported but when I delete =
5MB
> file then copy of a small file (20 bytes) to the partition takes a few
> seconds. Is it a bug?

I doubt it's a bug in JFFS2.  Also, you didn't mention which kernel or
level of MTD/JFFS2 code you're running.  So if it is a bug, we
couldn't even tell you if it's been fixed or not.

josh
