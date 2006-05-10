Received: from ug-out-1314.google.com ([66.249.92.174])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FduLI-0005bY-Lb
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 15:27:35 -0400
Received: by ug-out-1314.google.com with SMTP id j40so15850ugd
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 May 2006 12:27:26 -0700 (PDT)
Message-ID: <625fc13d0605101220q55a920sd777d902584dd92e@mail.gmail.com>
Date: Wed, 10 May 2006 14:20:09 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Steve Finney" <saf76@earthlink.net>
In-Reply-To: <16539078.1147288371389.JavaMail.root@elwamui-little.atl.sa.earthlink.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <16539078.1147288371389.JavaMail.root@elwamui-little.atl.sa.earthlink.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND read errors, R/O FS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/10/06, Steve Finney <saf76@earthlink.net> wrote:
> >On Wed, 10 May 2006 15:20:44 +0400, Vitaly Wool wrote:
> >> Josh Boyer wrote:
> >>
> >> >Not quite the case.  You need bad block skipping, yes.  But NAND can
> >> >get bit flips in good blocks still.  How do you deal with that?  You
> >> >can't leave the block in that state forever because it will continue
> >> >to get bit flips and then your data will be unusable.
> >> Yep, I know about the issue. The recommended way to go here AFAIK is t=
o
> >> mark the block as bad and copy its contents to a free one.
>
> FWIW, on the Samsung K9F* NAND chip, the explicitly recommended procedure
> for single bit read errors is to do single bit Error Correction (assuming=
 ECC
> is implemented) and to NOT remap (you _are_ supposed to  remap and
> copy one write errors). Apparently the chances of a 2nd bit error within =
a single
> 512 byte page (the ECC unit) are negligible.

That's ok for those specific chips, but the problems are more generic.
 A read-only filesystem can read a single page repeatedly and really
often.  Then can cause read distrub errors in other pages.

And I've really only been keeping SLC chips in mind.  When you get to
MLC technology, it's even less reliable.

josh
