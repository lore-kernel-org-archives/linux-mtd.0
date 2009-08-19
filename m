Received: from web39802.mail.mud.yahoo.com ([209.191.106.63])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MdZea-0007iS-G7
	for linux-mtd@lists.infradead.org; Wed, 19 Aug 2009 01:07:56 +0000
Message-ID: <705516.85389.qm@web39802.mail.mud.yahoo.com>
Date: Tue, 18 Aug 2009 18:07:50 -0700 (PDT)
From: Victor Gallardo <victorgallardo@yahoo.com>
Subject: jffs2 overflow issue in read_dnone
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=0A=A0=0AI noticed if I compile with CONFIG_PPC_64K_PAGES, I run into th=
e following issue.=0A=A0=0A******** read_dnode: tn->csize =3D=3D 0, csize =
=3D=3D 65536=0A******** check_node: tn->csize =3D=3D 0 <=3D=3D=3D=3D=3D=3D=
=3D=3D BUG_ON assert=0A=A0=0ALook like an OVERFLOW bug. Is this correct?=0A=
=A0=0AHere is the problem=0A=A0=0Afs/jffs2/nodelist.h=0A=A0=A0=A0 struct jf=
fs2_tmp_dnode_info=0A=A0=A0=A0 {=0A=A0=A0=A0=A0=A0=A0=A0 ...=0A=A0=A0=A0=A0=
=A0=A0=A0 uint16_t csize;=0A=A0=A0=A0=A0=A0=A0=A0 ...=0A=A0=A0=A0 };=0A=A0=
=0Afs/jffs2/readinode.c=0A=A0=A0=A0 static inline int read_dnode(...)=0A=A0=
=A0=A0 {=0A=A0=A0=A0=A0=A0=A0=A0 struct jffs2_tmp_dnode_info *tn;=0A=A0=A0=
=A0=A0=A0=A0=A0 uint32_t csize;=0A=A0=A0=A0=A0=A0=A0=A0 ...=0A=A0=A0=A0=A0=
=A0=A0=A0 csize =3D je32_to_cpu(rd->csize);=0A=A0=A0=A0=A0=A0=A0=A0 ...=0A=
=A0=A0=A0=A0=A0=A0=A0 tn->csize =3D csize;=0A=A0 #ifdef DBG_BUG_ON_ASSERT=
=0A=A0=A0=A0=A0=A0=A0=A0 if ( tn->csize =3D=3D 0 && csize !=3D 0) {=0A=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 printk("******* %s: tn->csize =
=3D=3D 0, csize =3D=3D %d\n",__func__,csize);=0A=A0=A0=A0=A0=A0=A0=A0 }=0A=
=A0 #endif=0A=A0=A0=A0=A0=A0=A0=A0 ....=0A=A0=A0 }=0ABest Regards,=0A=A0=0A=
Victor Gallardo
