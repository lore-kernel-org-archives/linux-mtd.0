Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QR5MB-0001xo-P7
	for linux-mtd@lists.infradead.org; Mon, 30 May 2011 16:30:20 +0000
Received: by fxm14 with SMTP id 14so3405765fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 May 2011 09:30:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <i1q6u61tl5go0ou25i0dcupco020ea94a3@4ax.com>
References: <5d84u6d24de3ikt776vdrqpnhhecs3aoio@4ax.com>
	<BANLkTimab0pKp68f_coPfsjm_6GdKAxSew@mail.gmail.com>
	<i1q6u61tl5go0ou25i0dcupco020ea94a3@4ax.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 30 May 2011 12:29:56 -0400
Message-ID: <BANLkTinmGVeysdwxGSRBsMVXPRnAtOWivg@mail.gmail.com>
Subject: Re: [Ubi] Wrong major:minor
To: Gilles <gilles.ganault@free.fr>
Content-Type: text/plain; charset=UTF-8
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

On Mon, May 30, 2011 at 05:53, Gilles wrote:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#BAD echo /sbin/mdev > /proc/sys=
/kernel/hotplug;

i dont know why you've disabled this.  if you want dynamic nodes after
boot, you need it.
-mike
