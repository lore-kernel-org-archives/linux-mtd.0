Received: from zproxy.gmail.com ([64.233.162.204])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1En58u-0004Ac-Io
	for linux-mtd@lists.infradead.org; Thu, 15 Dec 2005 21:16:22 -0500
Received: by zproxy.gmail.com with SMTP id s1so582206nze
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Dec 2005 18:16:19 -0800 (PST)
Message-ID: <29f916510512151816v59b1f584h346a415b3888728@mail.gmail.com>
Date: Thu, 15 Dec 2005 21:16:18 -0500
From: alfred hitch <alfred.hitch@gmail.com>
To: Peter Menzebach <pm-mtd@mw-itcon.de>
In-Reply-To: <43A166C6.5060803@mw-itcon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <43A1418F.3060701@imc-berlin.de>
	<20051215102607.GA20431@angel.research.nokia.com>
	<43A1609C.80705@imc-berlin.de> <43A166C6.5060803@mw-itcon.de>
Cc: linux-mtd@lists.infradead.org, Steven Scholz <steven.scholz@imc-berlin.de>
Subject: Re: Do I have to umount JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Steven, Peter,

I would like to put in some problems we are also facing. I had
reported it sometime back here also.

On our system, we are observing that files on flash (jffs2 intel cfi nand)
are getting corrupted, after  a number of resets and say 3 months of usage)

Anyone seen anything like this ? any clues on how one can look into this.

Regards,
Alfred

On 12/15/05, Peter Menzebach <pm-mtd@mw-itcon.de> wrote:
> Steven Scholz wrote:
> > Jarkko Lavinen wrote:
> >> On Thu, Dec 15, 2005 at 11:12:31AM +0100, ext Steven Scholz wrote:
> >>
> >>> Now I wonder if it is needed to umount this partition explicitly befo=
re
> >>> rebooting? Or mount it read only first by having
> >>
> >> JFFS2 is synhronous except for the write buffer (used with Nand chips)=
.
> >> Doing sync is enough and flushes the write buffer.
> >
> > Is "sync()" done by the kernel before reboot? Or do I have to call "syn=
c"?
> >
> Hi Steven,
> afaik,
> and this this is inline with my experience, you have call sync before
> reboot.
> Since I write only complete files to jffs2, I reduced the timer, which
> flushes the write buffer automatically from 3 seconds to 500 ms.
> In that case, I normally get no errors even in case of a hard reset.
>
> Otherwise I get some "found empty flash at" and some CRC errors. The
> filesystem as whole should remain in a stable state in any case (that's
> the main reason apart from wear levelling for jffs2, I think)
>
>
> Best regards
> Peter
>
>
> --
> Peter Menzebach
> Menzebach und Wolff IT-Consulting GbR
> Phone +49 751 355 387 1
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
