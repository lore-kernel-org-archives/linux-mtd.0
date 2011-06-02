Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSD7L-0002Ui-Ql
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 18:59:40 +0000
Received: by vws8 with SMTP id 8so1150219vws.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 11:59:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTi=ATYnYKrRvZLyFPxfbW0_RVwTROA@mail.gmail.com>
References: <BANLkTik+35hH5ADOGJ+qXtVJjtPd_AKz3g@mail.gmail.com>
	<BANLkTin9hvdNCMeVRSj806R19obN_91v5w@mail.gmail.com>
	<BANLkTinyQ1hoRDzJ8QKNZYP1m8X+AyPUGQ@mail.gmail.com>
	<BANLkTim+sNbXG3yk_DGZk4=+0Za+gb65BA@mail.gmail.com>
	<BANLkTimyNmXpKeCP3oHwx1SV2gdb4r7oNg@mail.gmail.com>
	<1306914686.4405.53.camel@localhost>
	<BANLkTi=ATYnYKrRvZLyFPxfbW0_RVwTROA@mail.gmail.com>
Date: Thu, 2 Jun 2011 14:59:34 -0400
Message-ID: <BANLkTimsanbjqD8ZqJ26wcp42iQWt+vFdw@mail.gmail.com>
Subject: Re: ubifs_decompress: cannot decompress ...
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jun 2, 2011 at 12:30 AM, Matthew L. Creech <mlcreech@gmail.com> wro=
te:
>
> As for this specific error (ubifs_decompress): tomorrow I'll try to
> gather & post additional log data for this device. =A0Thanks!
>

Here is a console dump with more information enabled:

http://mcreech.com/work/ubifs-decompress-err.txt

I turned on mount & recovery debug messages, although it seems to
mount & recover correctly, so presumably any info from past recovery
actions is long gone.  The error actually occurs later on, when our
main application accesses SQLite databases.

I dumped out the corrupted node data in 3 places:

1. In ubifs_decompress(), I dumped the data buffer, prefixed with
"compressed node" (redundant with #3, really)

2. In read_block(), I page-align the starting offset & size, re-fetch
the pertinent pages from flash, and dump those with corresponding OOB
info, prefixed with "data" and "oob" respectively

3. There's already a dbg_dump_node() call in read_block(), so I
enabled that as well

--=20
Matthew L. Creech
