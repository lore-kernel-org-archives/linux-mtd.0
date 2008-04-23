Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Joe0R-0006x7-7y
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 12:23:23 +0000
Subject: Re: [RFC] slight UBI scan time improvement
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10804230351s699a851bmb950a18b22ae8e54@mail.gmail.com>
References: <1208882552.11721.13.camel@sauron>
	<bae050c10804230015r50b7747apef8b1d8cab302c9a@mail.gmail.com>
	<1208935971.11721.20.camel@sauron>
	<bae050c10804230101m64bc2558icf9a5ad7efb8c824@mail.gmail.com>
	<1208938571.11721.38.camel@sauron>
	<bae050c10804230207s79902591l8a977881d89e48c3@mail.gmail.com>
	<1208942023.11721.48.camel@sauron>
	<bae050c10804230351s699a851bmb950a18b22ae8e54@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 23 Apr 2008 15:23:55 +0300
Message-Id: <1208953435.11721.60.camel@sauron>
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

On Wed, 2008-04-23 at 18:51 +0800, Nancy wrote:
>       Will you please explain why need leb_read_lock()?

This locks the LEB and prevent concurrent I/O to this LEB. E.g., we do
not want a situation when one process unmaps an LEB while another
process is writing to it.

That was probably overkill, but I implemented per-LEB r/w locking. This
is similar to rw semaphore in Linux. It means that several processes may
simultaneously read for this LEB, but only one process at a time may
write (or unmap).

>       If I ummap a leb(only operate the eba table, do not do
> ubi_wl_put_peb() ), then, what will that PEB belong to? wl->free,
> wl->used, wl->prot.pnum, wl->prot.aec, wl->scrub? What will happen to
> that PEB?

If you unmap it you have to clean the corresponding EBA table record and
return it to the WL unit.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
