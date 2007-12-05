Received: from rv-out-0910.google.com ([209.85.198.189])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Izwe3-0006My-D6
	for linux-mtd@lists.infradead.org; Wed, 05 Dec 2007 15:58:49 +0000
Received: by rv-out-0910.google.com with SMTP id c24so3789120rvf
	for <linux-mtd@lists.infradead.org>;
	Wed, 05 Dec 2007 07:58:35 -0800 (PST)
Message-ID: <62cbdcd90712050758h36335aa5q176f1c192f18d6a9@mail.gmail.com>
Date: Wed, 5 Dec 2007 16:58:35 +0100
From: "massimo cirillo" <maxcir@gmail.com>
To: "Nicolas Pitre" <nico@cam.org>
Subject: Re: [PATCH][CFI] Wrong cache invalidation bug fix
In-Reply-To: <alpine.LFD.0.99999.0712031210180.9605@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <62cbdcd90712030834o28f9126fs841b3b9d46324fb7@mail.gmail.com>
	<alpine.LFD.0.99999.0712031210180.9605@xanadu.home>
Cc: joern@logfs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

OK, I've verified your suggestion and the tests are ok.
Following the overall patch for the cfi_cmdset_0001.c

Signed-off-by Massimo Cirillo <maxcir@gmail.com> and Giuseppe D'Eliseo
<giuseppedeliseo@gmail.com>
Acked-by: Nicolas Pitre <nico@cam.org> and J=F6rn Engel <joern@logfs.org>

------
diff -aur a/drivers/mtd/chips/cfi_cmdset_0001.c
b/drivers/mtd/chips/cfi_cmdset_0001.c

--- a/drivers/mtd/chips/cfi_cmdset_0001.c       2007-12-05
10:45:20.000000000 +0100
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c       2007-11-16
19:14:27.000000000 +0100
@@ -1486,9 +1486,12 @@
       int ret, wbufsize, word_gap, words;
       const struct kvec *vec;
       unsigned long vec_seek;
+       unsigned long initial_adr;
+       int initial_len=3Dlen;

       wbufsize =3D cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
       adr +=3D chip->start;
+       initial_adr =3D adr;
       cmd_adr =3D adr & ~(wbufsize-1);

       /* Let's determine this according to the interleave only once */
@@ -1501,7 +1504,7 @@
               return ret;
       }

-       XIP_INVAL_CACHED_RANGE(map, adr, len);
+       XIP_INVAL_CACHED_RANGE(map, initial_adr, initial_len);
       ENABLE_VPP(map);
       xip_disable(map, chip, cmd_adr);

@@ -1592,7 +1595,7 @@
       chip->state =3D FL_WRITING;

       ret =3D INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
-                                  adr, len,
+                                  initial_adr, initial_len,
                                  chip->buffer_write_time);
       if (ret) {
               map_write(map, CMD(0x70), cmd_adr);
------

2007/12/3, Nicolas Pitre <nico@cam.org>:
> On Mon, 3 Dec 2007, massimo cirillo wrote:
>
> > Hi,
> >
> > We encountered the problem with cache invalidation in CFI driver. It
> > causes corruptions of data read from flash.
> >
> > The problem is investigated. The original code performs cache
> > invalidation from "adr" to "adr + len" in do_write_buffer(). Since len
> > and adr could be updated in the code before invalidation - it causes
> > improper setting of cache invalidation regions.
> > The following patch fixes this problem. This patch has been verified
> > on our OMAP based platform.
> > Could you please acknowledge and commit this patch?
> >
> > Thanks a lot.
> >
> > Signed-off-by Massimo Cirillo <maxcir@gmail.com> and Giuseppe D'Eliseo
> > <giuseppedeliseo@gmail.com>
>
> This patch is correct.  However, to make it more obvious, please change
> the used variable in the XIP_INVAL_CACHED_RANGE() call used in the same
> function as well.
>
> With that change you can add "Acked-by: Nicolas Pitre <nico@cam.org>".
>
>
> Nicolas
>
