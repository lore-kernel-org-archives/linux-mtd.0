Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTcIG-0000Cw-I6
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 16:04:45 +0000
Received: by vws8 with SMTP id 8so3831434vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 09:04:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307354316.3112.19.camel@localhost>
References: <BANLkTik+35hH5ADOGJ+qXtVJjtPd_AKz3g@mail.gmail.com>
	<BANLkTin9hvdNCMeVRSj806R19obN_91v5w@mail.gmail.com>
	<BANLkTinyQ1hoRDzJ8QKNZYP1m8X+AyPUGQ@mail.gmail.com>
	<BANLkTim+sNbXG3yk_DGZk4=+0Za+gb65BA@mail.gmail.com>
	<BANLkTimyNmXpKeCP3oHwx1SV2gdb4r7oNg@mail.gmail.com>
	<1306914686.4405.53.camel@localhost>
	<BANLkTi=ATYnYKrRvZLyFPxfbW0_RVwTROA@mail.gmail.com>
	<BANLkTimsanbjqD8ZqJ26wcp42iQWt+vFdw@mail.gmail.com>
	<1307354316.3112.19.camel@localhost>
Date: Mon, 6 Jun 2011 12:04:42 -0400
Message-ID: <BANLkTimNweAZ0wKT+LApBsWAV0W8Akmijg@mail.gmail.com>
Subject: Re: ubifs_decompress: cannot decompress ...
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Ben Gardiner <bengardiner@nanometrics.ca>,
	MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 6, 2011 at 5:58 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> So the corruption starts exactly at the NAND page boundary. This makes
> me believe that the reason is most probably power cut recovery. But you
> say your client ensures there were none...
>
> Yes, you are right that info from past is gone... What I'd like to see
> is a dump of the whole LEB. Could you please add 'dbg_dump_leb()' -
> basically I want to look if this LEB was passed through GC.
>

[Repost, gmail mangled my node dump]

The dbg_dump_leb() call fails due to a bad CRC; I've posted its output
plus the corresponding raw LEB dump (obtained via mtd->read_oob())
here:

http://mcreech.com/work/ubifs-decompress-err-rawleb.txt

-- 
Matthew L. Creech
