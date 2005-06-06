Received: from netserv.ipi.ac.ru ([83.149.245.1] helo=ipi.ac.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DfJWR-00022i-LU
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2005 11:28:16 -0400
Received: from [83.149.245.1] (netserv.ipi.ac.ru [83.149.245.1])
	by ipi.ac.ru (8.12.8p1/8.12.2) with ESMTP id j56FSDD9030283
	for <linux-mtd@lists.infradead.org>; Mon, 6 Jun 2005 19:28:14 +0400
Message-ID: <42A46B8D.9030607@ipi.ac.ru>
Date: Mon, 06 Jun 2005 19:28:13 +0400
From: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
MIME-Version: 1.0
CC: linux-mtd@lists.infradead.org
References: <426F719A.2000903@ipi.ac.ru>
	<20050606133406.GD31739@wohnheim.fh-wedel.de>
	<42A4572C.8020107@ipi.ac.ru>
	<20050606141453.GF31739@wohnheim.fh-wedel.de>
In-Reply-To: <20050606141453.GF31739@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Subject: Re: misaligned memory access in cmdlinepart.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:
> On Mon, 6 June 2005 18:01:16 +0400, Timofei V. Bondarenko wrote:
>=20
>>Index: cmdlinepart.c
>>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>RCS file: /home/cvs/mtd/drivers/mtd/cmdlinepart.c,v
>>retrieving revision 1.17
>>diff -u -p -r1.17 cmdlinepart.c
>>--- cmdlinepart.c	26 Nov 2004 11:18:47 -0000	1.17
>>+++ cmdlinepart.c	6 Jun 2005 13:57:08 -0000
>>@@ -234,12 +234,14 @@ static int mtdpart_setup_real(char *s)
>> 		 * parse one mtd. have it reserve memory for the
>> 		 * struct cmdline_mtd_partition and the mtd-id string.
>> 		 */
>>+#define THIS_MTD_ALIGN_CONST sizeof(void*)
>=20
> Not sure if this macro is worth the pain.  If it is, you should
> declare it outside the function.  Just above is what most people do.

Ok.. That's matter of taste. I'm rather like to complicate things.

>>+		/* align this_mtd */
>>+                this_mtd =3D (struct cmdline_mtd_partition *)
>>+                    ALIGN((unsigned long)this_mtd, THIS_MTD_ALIGN_CONS=
T);
>>+		/* enter results */
>=20
>=20
> Gcc allows arithmetic with (void*) exactly for code like this:
> 		this_mtd =3D ALIGN((void*)this_mtd, THIS_MTD_ALIGN_CONST);
> or:
> 		this_mtd =3D ALIGN((void*)this_mtd, sizeof(void*));
>=20
> You should retest it, though.

error: invalid operands to binary &

Then we've to cast it from integer to a pointer type.

--
	Timofei.


Index: cmdlinepart.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/cmdlinepart.c,v
retrieving revision 1.17
diff -u -p -r1.17 cmdlinepart.c
--- cmdlinepart.c	26 Nov 2004 11:18:47 -0000	1.17
+++ cmdlinepart.c	6 Jun 2005 14:33:59 -0000
@@ -239,7 +239,8 @@ static int mtdpart_setup_real(char *s)
  				&num_parts,	/* out: number of parts */
  				0,		/* first partition */
  				(unsigned char**)&this_mtd, /* out: extra mem */
-				mtd_id_len + 1 + sizeof(*this_mtd));
+				mtd_id_len + 1 + sizeof(*this_mtd) +
+                                sizeof(void*)-1 /*alignment*/);
  		if(!parts)
  		{
  			/*
@@ -252,7 +253,10 @@ static int mtdpart_setup_real(char *s)
  			 return 0;
  		 }

-		/* enter results */=09
+		/* align this_mtd */
+                this_mtd =3D (struct cmdline_mtd_partition *)
+                    ALIGN((unsigned long)this_mtd, sizeof(void*));
+		/* enter results */
  		this_mtd->parts =3D parts;
  		this_mtd->num_parts =3D num_parts;
  		this_mtd->mtd_id =3D (char*)(this_mtd + 1);
