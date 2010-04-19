Received: from mail-pz0-f181.google.com ([209.85.222.181])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O3yyJ-0003rW-QI
	for linux-mtd@lists.infradead.org; Mon, 19 Apr 2010 21:57:40 +0000
Received: by pzk11 with SMTP id 11so1130565pzk.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Apr 2010 14:57:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1270714961.6754.107.camel@localhost>
References: <4BA7A183.7040206@fosstel.com>
	<1270714961.6754.107.camel@localhost>
Date: Mon, 19 Apr 2010 17:57:37 -0400
Message-ID: <i2odbdb2ea61004191457s58e5b816i1efdf694a1e2a24@mail.gmail.com>
Subject: Re: UBIFS and MLC NAND Flash
From: twebb <taliaferro62@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "Pedro I. Sanchez" <psanchez@fosstel.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> > 2. I have several boards with MLC NAND flash running the Linux kernel
> > 2.6.29 and UBIFS. I am seeing a fairly large rate of file "corruption"
> > errors, files that all of a sudden become unreadable. Curiously enough,
> > they have been read-only files in all cases, program executables and
> > shared libraries.
>
> Hmm. Do you do unclean power cuts?
>
> > Would upgrading to a more recent kernel, or back porting the latest
> > UBIFS code, help? Shall I expect better support for MLC NAND flash in
> > the latest UBIFS code?
>
> You did not specify whether you pulled the ubifs-v2.6.29.git tree. If
> you did this, then your UBI/UBIFS should be the same as in the latest
> kernels. Please, do this, although this will probably not solve your
> corruption problems, but you'll have other bug-fixes we have made since
> 2.6.29 times.
>
>

Pedro,
I'm seeing very similar issues with MLC+UBIFS, though not only with
read-only files.=A0 Have you made any progress in your investigation or
while trying Artem's suggestions?=A0 I'm about to start digging into
this and would be interested to hear about any issues you may have
come across.  Do you have any opinion on whether this "corruption" is
related to the information posted on the linux-mtd site at...
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc ?

A few notes:
- I do occasionally have power cuts, but my understanding was that
UBI/UBIFS was very tolerant of that condition.
- I use CONFIG_MTD_UBI_WL_THRESHOLD=3D256
- I'm using linux-2.6.29

Thanks,
twebb
