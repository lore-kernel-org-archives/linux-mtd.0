Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RiUiA-0005Mk-Ed
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2012 17:33:15 +0000
Received: by wera10 with SMTP id a10so11324597wer.36
 for <linux-mtd@lists.infradead.org>; Wed, 04 Jan 2012 09:33:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20120104003446.695fd426@gmail.com>
References: <20120104003446.695fd426@gmail.com>
Date: Wed, 4 Jan 2012 12:33:11 -0500
Message-ID: <CA+5PVA7BowJwum9TLCdLUfS7b6ifRQtkw3vf0rhO4+TwyLD6jg@mail.gmail.com>
Subject: Re: possible use-after-free in drivers/mtd/ubi/wl.c: erase_worker
From: Josh Boyer <jwboyer@gmail.com>
To: Emese Revfy <re.emese@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 3, 2012 at 6:34 PM, Emese Revfy <re.emese@gmail.com> wrote:
> Hi,
>
> I think I found a potential problem in drivers/mtd/ubi/wl.c in
> erase_worker():
>
> 1050 =A0 =A0 =A0 =A0 ubi_err("failed to erase PEB %d, error %d", pnum, er=
r);
> 1051 =A0 =A0 =A0 =A0 kfree(wl_wrk);
> 1052 =A0 =A0 =A0 =A0 kmem_cache_free(ubi_wl_entry_slab, e);
> 1053
> 1054 =A0 =A0 =A0 =A0 if (err =3D=3D -EINTR || err =3D=3D -ENOMEM || err =
=3D=3D -EAGAIN ||
> 1055 =A0 =A0 =A0 =A0 =A0 =A0 err =3D=3D -EBUSY) {
> 1056 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int err1;
> 1057
> 1058 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Re-schedule the LEB for erasure *=
/
> 1059 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err1 =3D schedule_erase(ubi, e, 0);
>
> The pointer e is freed at line 1052 (kmem_cache_free), but
> later it is passed to schedule_erase which will eventually call
> erase_worker where it will be dereferenced and/or freed again.

Yes.  That does seem to be a problem.  Care to create a patch that solves t=
his
by deferring the frees until after the err variable is checked?

josh
