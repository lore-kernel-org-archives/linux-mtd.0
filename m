Received: from nf-out-0910.google.com ([64.233.182.188])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FwH1M-0001SK-2W
	for linux-mtd@lists.infradead.org; Fri, 30 Jun 2006 07:18:53 -0400
Received: by nf-out-0910.google.com with SMTP id d4so223478nfe
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 Jun 2006 04:18:43 -0700 (PDT)
Message-ID: <fe810cf0606300418o797e889fu38755c9d9aa34d64@mail.gmail.com>
Date: Fri, 30 Jun 2006 15:18:43 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@wohnheim.fh-wedel.de>
Subject: Re: JFFS2 wbuf non-contiguous write bug
In-Reply-To: <20060629150701.GB29253@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <fe810cf0606290500h54295e34jbb018a5346dceb6a@mail.gmail.com>
	<20060629124433.GA19237@wohnheim.fh-wedel.de>
	<fe810cf0606290741r2b1de379mc0ba49c2aa336757@mail.gmail.com>
	<625fc13d0606290746x1c8bff28j96769da31e5bc3f3@mail.gmail.com>
	<20060629150701.GB29253@wohnheim.fh-wedel.de>
Cc: Josh Boyer <jwboyer@gmail.com>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/29/06, J=F6rn Engel <joern@wohnheim.fh-wedel.de> wrote:
>
> Next question is: does the check against sibley/nor_ecc make sense?
> Would the code hurt anyone if it was enabled for nand and dataflash as
> well?
>

It seems the following patch (with unconditional wbuf fixup) works
with both Sibley and NAND. At least holey.c test passed.


Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com>

diff -uNr a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
--- a/fs/jffs2/wbuf.c=092006-06-29 12:28:33.000000000 +0400
+++ b/fs/jffs2/wbuf.c=092006-06-30 11:45:33.000000000 +0400
@@ -754,6 +754,13 @@
 =09=09memset(c->wbuf,0xff,c->wbuf_pagesize);
 =09}

+=09/* Fixup the wbuf if we are moving to a new eraseblock */
+=09if (((c->wbuf_ofs % c->sector_size) =3D=3D 0) && !c->wbuf_len) {
+=09=09c->wbuf_ofs =3D PAGE_DIV(to);
+=09=09c->wbuf_len =3D PAGE_MOD(to);
+=09=09memset(c->wbuf,0xff,c->wbuf_pagesize);
+=09}
+
 =09/*
 =09 * Sanity checks on target address.  It's permitted to write
 =09 * at PAD(c->wbuf_len+c->wbuf_ofs), and it's permitted to
