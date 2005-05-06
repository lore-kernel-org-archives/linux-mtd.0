Received: from rproxy.gmail.com ([64.233.170.205])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DTyk5-0007bQ-Fa
	for linux-mtd@lists.infradead.org; Fri, 06 May 2005 05:03:30 -0400
Received: by rproxy.gmail.com with SMTP id y7so537858rne
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2005 02:03:33 -0700 (PDT)
Message-ID: <f6d0cd060505060203609f2f05@mail.gmail.com>
Date: Fri, 6 May 2005 14:33:33 +0530
From: Niraj Maheshwari <niraj.maheshwari@gmail.com>
To: dedekind@infradead.org
In-Reply-To: <1115365247.27158.9.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <f6d0cd0605050523271574d91c@mail.gmail.com>
	<1115365247.27158.9.camel@sauron.oktetlabs.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Warning during GC,
	resulting in to Magic Bitmask Error for JFFS2.
Reply-To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem/All,

I tried using 5th May, 2005 snapshot and applied the patch on Linux
Kernel 2.6.10 but still the same problem gets repeated 3 out of 5
times if you follow the same steps and it's pretty much consistent.

When i delete a file when the JFFS2 partition is full, i get an error=20
"jffs2_reserve_space(): Low on dirty space to GC, but it's a deletion.
Allowing."

But if i give the command "sync" then it works fine after booting
otherwise it gives me following error for sometime and then it mounts
the JFFS2 partition.

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00540004:
0x0040 in stead

Any idea on this problem ? Has anyone faced this problem ?

Thanks
Niraj

On 5/6/05, Artem B. Bityuckiy <dedekind@infradead.org> wrote:
> > I am using Linux 2.6.10 kernel and  mounting the JFFS2 partition from
> > Intel NOR flash after booting the system. These error doesn't appear
> > always, it only comes
> > if we follow the steps explained below.
> >
> Try the last MTD from CVS please.
>=20
> --
> Best Regards,
> Artem B. Bityuckiy,
> St.-Petersburg, Russia.
>=20
>
