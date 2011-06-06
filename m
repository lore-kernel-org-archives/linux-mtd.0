Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTcZT-0000V1-0a
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 16:22:31 +0000
Received: by fxm14 with SMTP id 14so3720484fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 09:22:28 -0700 (PDT)
Subject: Re: ubifs_decompress: cannot decompress ...
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTimNweAZ0wKT+LApBsWAV0W8Akmijg@mail.gmail.com>
References: <BANLkTik+35hH5ADOGJ+qXtVJjtPd_AKz3g@mail.gmail.com>
	<BANLkTin9hvdNCMeVRSj806R19obN_91v5w@mail.gmail.com>
	<BANLkTinyQ1hoRDzJ8QKNZYP1m8X+AyPUGQ@mail.gmail.com>
	<BANLkTim+sNbXG3yk_DGZk4=+0Za+gb65BA@mail.gmail.com>
	<BANLkTimyNmXpKeCP3oHwx1SV2gdb4r7oNg@mail.gmail.com>
	<1306914686.4405.53.camel@localhost>
	<BANLkTi=ATYnYKrRvZLyFPxfbW0_RVwTROA@mail.gmail.com>
	<BANLkTimsanbjqD8ZqJ26wcp42iQWt+vFdw@mail.gmail.com>
	<1307354316.3112.19.camel@localhost>
	<BANLkTimNweAZ0wKT+LApBsWAV0W8Akmijg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 19:18:11 +0300
Message-ID: <1307377091.3112.100.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ben Gardiner <bengardiner@nanometrics.ca>,
	MTD list <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-06 at 12:04 -0400, Matthew L. Creech wrote:
> On Mon, Jun 6, 2011 at 5:58 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >
> > So the corruption starts exactly at the NAND page boundary. This makes
> > me believe that the reason is most probably power cut recovery. But you
> > say your client ensures there were none...
> >
> > Yes, you are right that info from past is gone... What I'd like to see
> > is a dump of the whole LEB. Could you please add 'dbg_dump_leb()' -
> > basically I want to look if this LEB was passed through GC.
> >
> 
> [Repost, gmail mangled my node dump]
> 
> The dbg_dump_leb() call fails due to a bad CRC; I've posted its output
> plus the corresponding raw LEB dump (obtained via mtd->read_oob())
> here:

I have to go home now - could you please improve dbg_dump_leb().
Currently it calls ubifs_scan(), which scans, finds corrupted node,
prints corruption information and returns -EUCLEAN and destroys the
scanned data.

Instead, we could do:

1. Add another parameter to ubifs_scan() which makes it to _not_ free
scanned data on corruption.

2. In dbg_dump_leb() when you get -EUCLEAN - just go ahead and print the
scanned information instead of exiting. Should not be too difficult to
do.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
