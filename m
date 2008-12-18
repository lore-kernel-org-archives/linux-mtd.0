Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LDJJ7-0003QN-A9
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 13:52:53 +0000
Subject: Re: ubifs: another scheduling while atomic back trace
From: Artem Bityutskiy <dedekind@infradead.org>
To: Cal Page <pagcal@runbox.com>
In-Reply-To: <494A517E.2000405@runbox.com>
References: <494A517E.2000405@runbox.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 18 Dec 2008 15:53:38 +0200
Message-Id: <1229608418.30575.4.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: ubifs <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-12-18 at 08:34 -0500, Cal Page wrote:
> I tracked it down to fs/ubifs/journal.c in make_reservation()?

How did you track? And what pointed you to this function?

> the code is:
>     again:
>        down_read()
>        err =3D reserve_space()
>        if ( !err) return 0
>        up_read()

That code really looks hacky, because it takes the lock and assumes the
caller unlocks it. We tried to come up with a better solution, and
debated on this, but concluded that this is the best way.

IOW, this is fine, because the caller unlocks the lock using
'finish_reservation()' call.

Moreover, rw semaphore should not make the code to be atomic.


> Also, I notice fs/fs-writeback.c in writeback_inodes does a=20
> down_read_trylock. Won't this interfear with the down_read above?

Sorry, I do not see how and what should interfere there.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
