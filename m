Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZ6m1-000322-Na
	for linux-mtd@lists.infradead.org; Tue, 21 Jun 2011 19:38:10 +0000
Received: by fxm14 with SMTP id 14so238516fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Jun 2011 12:37:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1308671201-18197-5-git-send-email-computersforpeace@gmail.com>
References: <1308671201-18197-1-git-send-email-computersforpeace@gmail.com>
	<1308671201-18197-5-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 21 Jun 2011 15:37:39 -0400
Message-ID: <BANLkTim4K0unnqbhXKvyZRkZPCqL5-=Uig@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] nanddump: warn about new default BB handling
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 21, 2011 at 11:46, Brian Norris wrote:
> + =C2=A0 =C2=A0 =C2=A0 if (bb_default)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, "Warni=
ng: you did not specify a default bad-block handling\n"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 " =C2=A0method. In future versions, the =
default will change to\n"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 " =C2=A0--bb=3Dskipbad. Use \"nanddump -=
-help\" for more information.\n");

nanddump has mostly been converted to common.h, so this should use
warning() instead.
-mike
