Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LqYd8-0001JW-Ip
	for linux-mtd@lists.infradead.org; Sun, 05 Apr 2009 20:07:53 +0000
Date: Sun, 5 Apr 2009 22:07:44 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [RFC/PATCH] flash_eraseall: extra care if NOR flash is not
	BIT_WRITEABLE
Message-ID: <20090405200744.GB10484@Chamillionaire.breakpoint.cc>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
	<1237848138-18157-4-git-send-email-sebastian@breakpoint.cc>
	<1237874727.14602.95.camel@localhost.localdomain>
	<20090324085530.GA21444@Chamillionaire.breakpoint.cc>
	<1237962807.14602.99.camel@localhost.localdomain>
	<20090326134418.GB21993@shareable.org>
	<20090326154142.GA15963@Chamillionaire.breakpoint.cc>
	<1238133332.3321.98.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1238133332.3321.98.camel@localhost.localdomain>
Cc: Jamie Lokier <jamie@shareable.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Artem Bityutskiy | 2009-03-27 07:55:32 [+0200]:

>> I'm sorry. That is actually my point. The layout of the cleanmarker
>> (which are used only by JFFS2) depends on a specific kernel switch in
>> case of NOR flash which is not BIT_WRITEABLE and userland can't know
>> that.
>> I've sent a patch to remove the -j option because the generated
>> cleanmaker *may* be wrong. Artem replied that he would like to see this
>> fixed.
>> So here is an attempt to fix this: black listed ubi & data flash but I
>> dunno how fix the NOR case where does not have BIT_WRITEABLE bit. A
>> commandline switch for those who know what they do?
>> Why don't rip out -j and let the kernel create clean marker if it
>> needs it?
>
>I looked into your patch closer, and there is no such dependency
>actually. Now it looks fine for me.

okay. what about this:
in jffs2_do_fill_super() we have:


| c->cleanmarker_size =3D sizeof(struct jffs2_unknown_node);
12 bytes.

|=20
| /* NAND (or other bizarre) flash... do setup accordingly */
| ret =3D jffs2_flash_setup(c);
| if (ret)
|         return ret;

and jfffs_flash_setup() is:
|static int jffs2_flash_setup(struct jffs2_sb_info *c) {
|        int ret =3D 0;
|       =20
|        if (jffs2_cleanmarker_oob(c)) {
|                /* NAND flash... do setup accordingly */
|                ret =3D jffs2_nand_flash_setup(c);
|                if (ret)
|                        return ret;
|        }      =20
|
|        /* and Dataflash */
|        if (jffs2_dataflash(c)) {
|                ret =3D jffs2_dataflash_setup(c);
|                if (ret)
|                        return ret;
|        }
|
|        /* and Intel "Sibley" flash */
|        if (jffs2_nor_wbuf_flash(c)) {
and jffs2_nor_wbuf_flash() depends on CONFIG_JFFS2_FS_WRITEBUFFER.
Without it is 0 and with it is defined to
(c->mtd->type =3D=3D MTD_NORFLASH && ! (c->mtd->flags & MTD_BIT_WRITEABLE))

|                ret =3D jffs2_nor_wbuf_flash_setup(c);
and jffs2_nor_wbuf_flash_setup() changes the cleanmarker size via

         c->cleanmarker_size =3D max(16u, c->mtd->writesize);

and this is !=3D 12 in every case.

|                if (ret)
|                        return ret;
|        }
|       =20
|        /* and an UBI volume */
|        if (jffs2_ubivol(c)) {
|                ret =3D jffs2_ubivol_setup(c);
|                if (ret)
|                        return ret;
|        }
|  =20
|        return ret;
|}

Do I overlook something or why is there no dependency on
CONFIG_JFFS2_FS_WRITEBUFFER on NOR flash which does not have the
MTD_BIT_WRITEABLE flag?

>
>I can apply them if there are not complaints. But how you have
>tested them? I would not want to break 'flash_eraseall' once again :-)
understand. Nope, I do not have such flash. I got a bug report against
clean marker on a data flash and that is why I started looking into
this.

>
>--=20
>Best regards,
>Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
>

Sebastian
