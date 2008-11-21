Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L3Saj-0007TR-2Y
	for linux-mtd@lists.infradead.org; Fri, 21 Nov 2008 09:46:21 +0000
Subject: Re: Query on UBIFS usage
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ankur Maheshwari <ankur.maheshwari@gmail.com>
In-Reply-To: <8fbbfb6b0811201021l3f3d9aabr90d9c54b18555cfc@mail.gmail.com>
References: <8fbbfb6b0811201021l3f3d9aabr90d9c54b18555cfc@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 21 Nov 2008 11:44:18 +0200
Message-Id: <1227260658.3954.46.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: ankur_maheshwari@in.com, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-11-20 at 23:51 +0530, Ankur Maheshwari wrote:
> 1. I read in UBIFS FAQ that it can not be used as NFS file system. I
> am bit confuse with the statement.

You cannot export UBIFS via NFS so far, because we did not implement
NFS support inside UBIFS. In other words, UBIFS cannot be NFS server's
backing FS. But we are planning to implement this, we just do not have
time and do not need this.

> Is it possible that I use UBIFS on one of Flash partition and at the
> same time do NFS (root fs mount as NFS) boot. Is there any issue with
> it.

No, in this case you mount some other file system via NFS, co you are an
NFS client. It should be fine.

> 2. Can I use UBIFS with other Flash filesystem (like SquashFS-read
> only) on other partition of same flash.

Of course.

> 3. What will be better, keep using SquashFS(RO) or switch to UBIFS.

Everything depends on your needs/requirements/etc.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
