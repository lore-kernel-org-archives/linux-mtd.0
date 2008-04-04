Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jhe8V-00061b-Ic
	for linux-mtd@lists.infradead.org; Fri, 04 Apr 2008 05:06:47 +0000
Subject: Re: can't mount ubifs on volume smaller than 265 LEBs/32MiB
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080404041251.GA2752@cloud.net.au>
References: <20080404041251.GA2752@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Fri, 04 Apr 2008 08:06:19 +0300
Message-Id: <1207285579.8040.14.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-04-04 at 15:12 +1100, Hamish Moffatt wrote:
> With a LEB size of 126kb, any file system < 265 LEBs won't mount,
> failing in validate_sb.
Hmm...

> # ubimkvol /dev/ubi0 -N config -S 264
> Volume ID 2, size 264 LEBs (34062336 bytes, 32.5 MiB), LEB size 129024 by=
tes (126.0 KiB), dynamic, name "config", alignment 1
> # mount /rw
> mount: mounting ubi0:config on /rw failed: Invalid argument
>=20
> # dmesg
> [...]
> [ 1191.360000] UBIFS error (pid 2804): validate_sb: bad superblock

I'll look at this shortly, thanks for the report. As a suggestion, if
you have problems with UBIFS and going to send a bug-report, try to
enable debugging, reproduce the problem and send dmesg. With debugging
enabled it prints more useful information and makes it easier to
identify and fix the issue.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
