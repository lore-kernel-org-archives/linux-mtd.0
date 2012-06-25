Received: from nm13-vm4.bullet.mail.ne1.yahoo.com ([98.138.91.173])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SjAb5-0005sI-4N
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2012 14:49:00 +0000
References: <1340632690.58836.YahooMailNeo@web114616.mail.gq1.yahoo.com>
Message-ID: <1340635736.72938.YahooMailNeo@web114615.mail.gq1.yahoo.com>
Date: Mon, 25 Jun 2012 07:48:56 -0700 (PDT)
From: Reginald Perrin <reggyperrin@yahoo.com>
Subject: Re: Help needed with corruption detection/ubifs_wbuf_sync_nolock
To: MTD Mailing List <linux-mtd@lists.infradead.org>
In-Reply-To: <1340632690.58836.YahooMailNeo@web114616.mail.gq1.yahoo.com>
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

Update: =A0=0A=0AI'm now doing this, and it seems to work. =A0Is this corre=
ct?=0A=0Aif (=A0wbuf->dtype !=3D UBI_UNKNOWN &&=A0((struct ubifs_ch *)wbuf-=
>buf)->node_type > UBIFS_ORPH_NODE )=A0=0A=0A...=0A=0ARP=0A=0A=0A----- Orig=
inal Message -----=0A> From: Reginald Perrin <reggyperrin@yahoo.com>=0A> To=
: MTD Mailing List <linux-mtd@lists.infradead.org>=0A> Cc: =0A> Sent: Monda=
y, June 25, 2012 9:58 AM=0A> Subject: Help needed with corruption detection=
/ubifs_wbuf_sync_nolock=0A> =0A> Hi folks,=0A> =0A> I'm tracking down a cor=
ruption issue, and trying to trace back where =0A> LEB's are getting random=
ly corrupted in our system (a very rare event, but =0A> it can happen). =A0=
I'm focusing on ubifs/io.c, and trying to validate data =0A> before we send=
 to=A0ubi_leb_write().=0A> =0A> Can somebody please clarify something for m=
e on=A0ubifs_wbuf_sync_nolock()? =0A> =A0I'm trying to validate that the da=
ta we're writing hasn't been =0A> corrupted. =A0I thought I could just chec=
k that the node-type was valid, such as:=0A> =0A> =A0 =A0 if ( ((struct ubi=
fs_ch *)wbuf->buf)->node_type > UBIFS_ORPH_NODE ) =0A> {=0A> =0A> =A0 =A0 =
=A0 =A0 // ABORT WRITE=0A> =A0 =A0 }=0A> =0A> =A0 =A0 err =3D ubi_leb_write=
(c->ubi, wbuf->lnum, wbuf->buf, wbuf->offs,=0A> =0A> =0A> This *seems* to w=
ork, but during our application start, it's actually =0A> triggering before=
 we are reaching the troubled code, in code that really =0A> shouldn't have=
 any issues. =A0I think this means I don't understand how =0A> wbuf relates=
 to actual LEB nodes.=0A> =0A> Can anybody help me understand how to check =
to see if the LEB is corrupted =0A> before we write? =A0I'm trying to get c=
lose enough to the corruption to get a =0A> backtrace.=0A> =0A> TIA=0A> RP=
=0A> =0A> ______________________________________________________=0A> Linux =
MTD discussion mailing list=0A> http://lists.infradead.org/mailman/listinfo=
/linux-mtd/=0A> 
