Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMoUT-0006Jj-3t
	for linux-mtd@lists.infradead.org; Wed, 18 May 2011 21:41:13 +0000
Received: by vxd2 with SMTP id 2so1842671vxd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 May 2011 14:41:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1305751647-3122-1-git-send-email-bengardiner@nanometrics.ca>
References: <1305196419.2713.84.camel@localhost>
	<1305751647-3122-1-git-send-email-bengardiner@nanometrics.ca>
Date: Wed, 18 May 2011 17:41:11 -0400
Message-ID: <BANLkTi=+V7PR_29pK3ooVggPmeicCG0eWg@mail.gmail.com>
Subject: Re: [PATCH] UBIFS: don't fail on -EBADMSG when fixing free space
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 18, 2011 at 4:47 PM, Ben Gardiner
<bengardiner@nanometrics.ca> wrote:
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Don't fail on -EBADMSG since these are precisely the e=
rror codes that
> + =A0 =A0 =A0 =A0* are returned by ubi_red in the cases where free-space =
fix-ups are
> + =A0 =A0 =A0 =A0* required.
> + =A0 =A0 =A0 =A0*/

Hi Ben,

Off-hand, I don't see how this comment can be true.  It seems like
we'll have 2 cases:

1. The pages in question are actually erased, in which case they'll be
0xff-filled by ubi_read() without error, or
2. The pages were programmed with all 0xff data, in which case the ECC
info should be correct

There's a third possibility, that the ECC info is bad because there's
a real error, but that's not something we can reliably recover from.
Am I overlooking another scenario?

--=20
Matthew L. Creech
