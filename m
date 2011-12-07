Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RYONB-0002PY-RW
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 20:45:54 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dedekind1@gmail.com
Subject: Re: [PATCH v3] mtd/docg3: fixes and cleanups
References: <1322726702.2332.9.camel@koala>
 <1322852412-15193-1-git-send-email-robert.jarzmik@free.fr>
 <1323066682.2316.18.camel@koala>
Date: Wed, 07 Dec 2011 21:45:29 +0100
In-Reply-To: <1323066682.2316.18.camel@koala> (Artem Bityutskiy's message of
 "Mon, 05 Dec 2011 08:31:19 +0200")
Message-ID: <87k468cdqu.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> Pushed to l2-mtd-2.6.git, thanks. But I still see this warning when
> I compile on x86_64:
>
> drivers/mtd/devices/docg3.c:1050:12: warning: =E2=80=98doc_get_erase_coun=
t=E2=80=99 defined
> but not used [-Wunused-function]
Yes, I know. As I have said previously to Stephen, this one will take a lit=
tle
bit more time to fix.

I'm working on it, and as soon as I have something, I'll submit.

Cheers.

--=20
Robert
