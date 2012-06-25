Received: from nm27.bullet.mail.sp2.yahoo.com ([98.139.91.97])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sj9pt-0003xE-0x
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2012 14:00:13 +0000
Message-ID: <1340632690.58836.YahooMailNeo@web114616.mail.gq1.yahoo.com>
Date: Mon, 25 Jun 2012 06:58:10 -0700 (PDT)
From: Reginald Perrin <reggyperrin@yahoo.com>
Subject: Help needed with corruption detection/ubifs_wbuf_sync_nolock
To: MTD Mailing List <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Reply-To: Reginald Perrin <reggyperrin@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,=0A=0AI'm tracking down a corruption issue, and trying to trace ba=
ck where LEB's are getting randomly corrupted in our system (a very rare ev=
ent, but it can happen). =A0I'm focusing on ubifs/io.c, and trying to valid=
ate data before we send to=A0ubi_leb_write().=0A=0ACan somebody please clar=
ify something for me on=A0ubifs_wbuf_sync_nolock()? =A0I'm trying to valida=
te that the data we're writing hasn't been corrupted. =A0I thought I could =
just check that the node-type was valid, such as:=0A=0A=A0 =A0 if ( ((struc=
t ubifs_ch *)wbuf->buf)->node_type > UBIFS_ORPH_NODE ) {=0A=0A=A0 =A0 =A0 =
=A0 // ABORT WRITE=0A=A0 =A0 }=0A=0A=A0 =A0 err =3D ubi_leb_write(c->ubi, w=
buf->lnum, wbuf->buf, wbuf->offs,=0A=0A=0AThis *seems* to work, but during =
our application start, it's actually triggering before we are reaching the =
troubled code, in code that really shouldn't have any issues. =A0I think th=
is means I don't understand how wbuf relates to actual LEB nodes.=0A=0ACan =
anybody help me understand how to check to see if the LEB is corrupted befo=
re we write? =A0I'm trying to get close enough to the corruption to get a b=
acktrace.=0A=0ATIA=0ARP
