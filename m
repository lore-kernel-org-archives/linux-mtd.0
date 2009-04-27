Received: from yx-out-1718.google.com ([74.125.44.153])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LyYLR-0007oQ-9b
	for linux-mtd@lists.infradead.org; Mon, 27 Apr 2009 21:26:40 +0000
Received: by yx-out-1718.google.com with SMTP id 6so112807yxn.72
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Apr 2009 14:26:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49F61F32.3020003@harris.com>
References: <49F61F32.3020003@harris.com>
Date: Mon, 27 Apr 2009 17:26:31 -0400
Message-ID: <8bd0f97a0904271426p30df3a97ke31af72dcf96531f@mail.gmail.com>
Subject: Re: [PATCH] Bug in m25p80.c during whole-chip erase
From: Mike Frysinger <vapier.adi@gmail.com>
To: "Steven A. Falco" <sfalco@harris.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 27, 2009 at 17:10, Steven A. Falco wrote:
> There is a logic error in "whole chip erase" for the m25p80 family. =C2=
=A0If
> the whole device is successfully erased, erase_chip() will return 0, and
> the code will fall through to the "else" clause, and do sector-by-sector
> erase in addition to the whole-chip erase. =C2=A0This patch corrects that=
.
>
> Also, the MAX_READY_WAIT_COUNT is insufficient for an m25p16 connected
> to a 400 MHz powerpc. =C2=A0Increasing it allows me to successfully progr=
am
> the device on my board.

in general, trying to set timeouts "close" to the spec gains nothing
with spi flash devices.  the timeout limit is hit only when an error
occurs, and errors should not occur during the normal run of things.
on the other side, having a timeout be wrongly hit when the device is
operating correctly is a much worse situation to be in.
-mike
