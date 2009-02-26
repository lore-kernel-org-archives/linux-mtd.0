Received: from mail-gx0-f160.google.com ([209.85.217.160])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LcbbP-0006jO-Hr
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2009 08:28:22 +0000
Received: by gxk4 with SMTP id 4so1083883gxk.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Feb 2009 00:28:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1235634216.25808.27.camel@localhost.localdomain>
References: <1235605127-2024-1-git-send-email-vapier@gentoo.org>
	<1235634216.25808.27.camel@localhost.localdomain>
Date: Thu, 26 Feb 2009 03:28:18 -0500
Message-ID: <8bd0f97a0902260028q1df6c376ta6537f83f2407f02@mail.gmail.com>
Subject: Re: [PATCH] make sure compiler supports warning flags
From: Mike Frysinger <vapier.adi@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 26, 2009 at 02:43, Artem Bityutskiy wrote:
> On Wed, 2009-02-25 at 18:38 -0500, Mike Frysinger wrote:
>> Some compilers (like gcc-3.3) don't support all the newer -W flags that =
we
>> are using. =A0So import the compiler check found in the kernel and test =
each
>> flag we add. =A0The :=3D is important so we only do the compiler tests o=
nce
>> per `make` rather than every time we compile a file.
>>
>> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>
> Looks fine for me, but I cannot really review this, so lets wait a
> little, and if there are no complaints I'll push it. Thanks!

that's good because i just realized i left stupid debugging echo in there :=
/
-mike
