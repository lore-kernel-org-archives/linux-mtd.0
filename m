Received: from netserv.ipi.ac.ru ([83.149.245.1] helo=ipi.ac.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DfZTT-0004EK-W2
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2005 04:30:17 -0400
Message-ID: <42A55B15.8000506@ipi.ac.ru>
Date: Tue, 07 Jun 2005 12:30:13 +0400
From: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <426F719A.2000903@ipi.ac.ru>	<20050606133406.GD31739@wohnheim.fh-wedel.de>	<42A4572C.8020107@ipi.ac.ru>	<20050606141453.GF31739@wohnheim.fh-wedel.de>	<42A460BB.50800@ipi.ac.ru>	<20050606162648.GJ31739@wohnheim.fh-wedel.de>	<42A47E7D.2060302@ipi.ac.ru>
	<20050606174443.GA24857@wohnheim.fh-wedel.de>
In-Reply-To: <20050606174443.GA24857@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
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
> On Mon, 6 June 2005 20:49:01 +0400, Timofei V. Bondarenko wrote:
>=20
>>J=F6rn Engel wrote:
>>
>>>Hmm.  Well, I just don't care enough, let's keep it.
>>>
>>>Can you test the current patch and see if it works for you?  Once
>>>you've confirmed that, I'll commit it.
>>
>>Yes. I've tested it on the uclinux-bf533.
>=20
>=20
> Doesn't apply with patch -p1.  Can you respin the patch against mtd
> cvs and make sure it does?  If in doubt, read:
> http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt

Ok, sorry for noise.
Is it good enough?

diff -u -p -r1.17 cmdlinepart.c
--- mtd/drivers/mtd/cmdlinepart.c	26 Nov 2004 11:18:47 -0000	1.17
+++ mtd/drivers/mtd/cmdlinepart.c	7 Jun 2005 08:02:00 -0000
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
