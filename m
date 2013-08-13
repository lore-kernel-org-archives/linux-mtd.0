Received: from mail-vc0-x230.google.com ([2607:f8b0:400c:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V95xV-0004WU-B1
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 04:11:50 +0000
Received: by mail-vc0-f176.google.com with SMTP id ha11so3429860vcb.21
 for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2013 21:11:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130812172649.GB7198@localhost>
References: <1376251908-7451-1-git-send-email-nilanjan.roychowdhury@gmail.com>
 <20130812172649.GB7198@localhost>
Date: Tue, 13 Aug 2013 09:41:28 +0530
Message-ID: <CAGq6Fke=DYbK=KO6RdTD2at9NPMKcmxzOQ2TL6fBfM2UgSOfRQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: mtdoops: fix for a potential memory leak in
 mtdoops_notify_remove
From: Nilanjan Roychowdhury <nilanjan.roychowdhury@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 12, 2013 at 10:56 PM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
>
> On Sun, Aug 11, 2013 at 01:11:48PM -0700, Nilanjan Roychowdhury wrote:
> > we are allocating cxt->oops_page_used using vmalloc in mtdoops_notify_a=
dd for
> > every mtd_info addition but not freeing it in mtdoops_notify_remove
> >
> > Signed-off-by: Nilanjan Roychowdhury <nilanjan.roychowdhury@gmail.com>
> > ---
> >  drivers/mtd/mtdoops.c |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
> > index 97bb8f6..02f49aa 100644
> > --- a/drivers/mtd/mtdoops.c
> > +++ b/drivers/mtd/mtdoops.c
> > @@ -386,6 +386,7 @@ static void mtdoops_notify_remove(struct mtd_info *=
mtd)
> >       cxt->mtd =3D NULL;
> >       flush_work(&cxt->work_erase);
> >       flush_work(&cxt->work_write);
> > +     vfree(cxt->oops_page_used);
> >  }
> >
> > --
> > 1.7.9.5
> >
>
> Have you tested this patch doing an unregister/module remove cycle?
>
> I'm not entirely sure, but I *think* you must also remove the
> vfree(cxt->oops_page_used); at mtdoops_exit(). Otherwise,
> you might call vfree() twice, the second time on a garbage pointer.
>
> The reason for this is that the unregister_mtd_user(&mtdoops_notifier);
> call in mtdoops_exit() will call the .remove callback (causing the first
> vfree() with this patch) and then call vfree() for the second time, expli=
citly.
> --
> Ezequiel Garc=EDa, Free Electrons
> Embedded Linux, Kernel and Android Engineering
> http://free-electrons.com
i did not do a module remove. I agree with your observation. I will
resubmit the patch.
