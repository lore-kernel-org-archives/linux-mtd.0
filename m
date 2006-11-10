Received: from mgw-ext12.nokia.com ([131.228.20.171])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Giaez-0000nC-Up
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 12:59:30 -0500
Subject: Re: mount costs too long
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <4554AA07.5020204@ru.mvista.com>
References: <6d6a94c50611092305v6f52b9b0hfd254e10a2992d44@mail.gmail.com>
	<1163159781.19697.24.camel@crusty.rchland.ibm.com>
	<6d6a94c50611100648g87770a0qb723fad11fa65cd8@mail.gmail.com>
	<1163174898.3925.13.camel@sauron>  <4554A592.5000308@ru.mvista.com>
	<1163176000.3925.15.camel@sauron>  <4554AA07.5020204@ru.mvista.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 10 Nov 2006 19:15:41 +0200
Message-Id: <1163178941.3925.18.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Aubrey <aubreylee@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-11-10 at 19:34 +0300, Vitaly Wool wrote:
> B/c due to the MTD layer rework, there's no way now to use custom
> oobinfo in yaffs.
> Therefore, as yaffs1 presumes the SmartMedia OOB layout one can either
> read/write raw OOB but that will most probably break the bad block
> handling, or implement a small shim layer putting spare OOB area into
> SmartMedia OOB layout or back. Any other way will result in
> incompatibility with the older version of yaffs1.

OK, as it was said that YAFFS1 becomes much slower, this means that it
reads more data from OOB then if it were working with older kernel.
Right? Why it reads more data?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
