Received: from rv-out-0910.google.com ([209.85.198.187])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J2lhd-000300-R0
	for linux-mtd@lists.infradead.org; Thu, 13 Dec 2007 10:54:11 +0000
Received: by rv-out-0910.google.com with SMTP id c24so514881rvf.42
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Dec 2007 02:54:03 -0800 (PST)
Message-ID: <62cbdcd90712130254u64a3ae1eq95b24a4cd2a2f450@mail.gmail.com>
Date: Thu, 13 Dec 2007 11:54:03 +0100
From: "massimo cirillo" <maxcir@gmail.com>
To: dwmw2@infradead.org, joern@logfs.org, Nico@cam.org
Subject: Re: [PATCH][CFI] Wrong cache invalidation bug fix
In-Reply-To: <62cbdcd90712130248mc82d9cdp781fde10dd73d1b3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <62cbdcd90712030834o28f9126fs841b3b9d46324fb7@mail.gmail.com>
	<alpine.LFD.0.99999.0712031210180.9605@xanadu.home>
	<20071204000807.GB17212@lazybastard.org>
	<62cbdcd90712130248mc82d9cdp781fde10dd73d1b3@mail.gmail.com>
Cc: alexey.korolev@intel.com, linux-mtd@lists.infradead.org,
	Andrey.Lisov@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

Could you please apply the patch? It has been tested and acknowledged
by Nicolas and J=F6rn.

Description
This patch fixes improper setting of cache invalidation regions and
solves the issue of data corrupting.

Signed-off-by: Massimo Cirillo <maxcir@gmail.com>
Signed-off-by: Giuseppe D'Eliseo <giuseppedeliseo@gmail.com>
Acked-by: Nicolas Pitre <nico@cam.org>
Acked-by: J=F6rn Engel <joern@logfs.org>

------
diff -aur a/drivers/mtd/chips/cfi_cmdset_0001.c
b/drivers/mtd/chips/cfi_cmdset_0001.c

--- a/drivers/mtd/chips/cfi_cmdset_0001.c       2007-11-16
19:14:27.000000000 +0100
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c       2007-12-05
10:45:20.000000000 +0100
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

2007/12/4, J=F6rn Engel <joern@logfs.org>:
> On Mon, 3 December 2007 12:12:37 -0500, Nicolas Pitre wrote:
> >
> > With that change you can add "Acked-by: Nicolas Pitre <nico@cam.org>".
>
> Mine as well, if you feel so inclined.
>
> J=F6rn
>
> --
> Beware of bugs in the above code; I have only proved it correct, but
> not tried it.
> -- Donald Knuth
>
