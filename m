Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ShpKb-0003jk-1i
 for linux-mtd@lists.infradead.org; Thu, 21 Jun 2012 21:54:25 +0000
Received: by lbbgg6 with SMTP id gg6so2737919lbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2012 14:54:22 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 21 Jun 2012 23:54:21 +0200
Message-ID: <CAFLxGvyvbr1pTP9Qy+bJhLXnm3OkutqW0QGf8fRi6Dj4-_qUnw@mail.gmail.com>
Subject: UBI fastmap updates (was: no subject)
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 thomas.wucher@linutronix.de, linux-mtd@lists.infradead.org,
 shmulik.ladkani@gmail.com, tglx@linutronix.de, Marius.Mazarel@ugal.ro,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 21, 2012 at 11:49 PM, Richard Weinberger <richard@nod.at> wrote=
:
> This is the next round of UBI fastmap updates.
>
> The highlights are:
> =A0 =A0 =A0 =A0- New self checks and a better fall back to scanning mecha=
nism
> =A0 =A0 =A0 =A0- The attaching by fastmap code got simplified
> =A0 =A0 =A0 =A0- invalidate_fastmap() now really invalidates the fastmap =
B-)
> =A0 =A0 =A0 =A0- Minor fixes
>
> If you want to test fastmap you can use my git repo:
> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubi2.git ubi2/v12

Sorry, I've killed the subject line. :-\

--=20
Thanks,
//richard
