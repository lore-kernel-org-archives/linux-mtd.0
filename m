Received: from nm8-vm0.bullet.mail.ne1.yahoo.com ([98.138.91.23])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SkbQh-0005BP-Ax
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 13:40:12 +0000
References: <1340632690.58836.YahooMailNeo@web114616.mail.gq1.yahoo.com>
 <1340806951.3070.33.camel@sauron.fi.intel.com>
Message-ID: <1340977208.96550.YahooMailNeo@web114614.mail.gq1.yahoo.com>
Date: Fri, 29 Jun 2012 06:40:08 -0700 (PDT)
From: Reginald Perrin <reggyperrin@yahoo.com>
Subject: Re: Help needed with corruption detection/ubifs_wbuf_sync_nolock
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
In-Reply-To: <1340806951.3070.33.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>
Reply-To: Reginald Perrin <reggyperrin@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,=0A=0AOur analysis shows that LEB's are corrupted due to a software b=
ug we are trying to find. =A0It seems like data is shifted in the buffer (l=
ike memcpy(buf,buf+2,node_size)), which we think is related to our power ma=
nagement.=0A=0AMy goal was to try and trap on the bad write, and debug what=
ever is corrupting things before it happens.=0A=0AYou've convinced me that =
using wbuf probably isn't the right tactic. =A0I put code into all the othe=
r ubl_leb_write() calls, and it doesn't seem to be in those. =A0=0A=0AStill=
 trying to find the best way to trap on it before it happens.=0A=0AThanks=
=0A=0A=0A=0A----- Original Message -----=0A> From: Artem Bityutskiy <dedeki=
nd1@gmail.com>=0A> To: Reginald Perrin <reggyperrin@yahoo.com>=0A> Cc: MTD =
Mailing List <linux-mtd@lists.infradead.org>=0A> Sent: Wednesday, June 27, =
2012 10:22 AM=0A> Subject: Re: Help needed with corruption detection/ubifs_=
wbuf_sync_nolock=0A> =0A> Hi,=0A> =0A> On Mon, 2012-06-25 at 06:58 -0700, R=
eginald Perrin wrote:=0A>>  I'm tracking down a corruption issue, and tryin=
g to trace back where=0A>>  LEB's are getting randomly corrupted in our sys=
tem (a very rare event,=0A>>  but it can happen).=A0 I'm focusing on ubifs/=
io.c, and trying to=0A>>  validate data before we send to ubi_leb_write().=
=0A> =0A> You are not using MLC NAND, right? Did you validate your flash us=
ing MTD=0A> tests?=0A> =0A>>  Can somebody please clarify something for me=
=0A>>  on ubifs_wbuf_sync_nolock()?=A0 I'm trying to validate that the data=
=0A>>  we're writing hasn't been corrupted.=A0 I thought I could just check=
=0A>>  that the node-type was valid, such as:=0A>> =0A>> =A0 =A0  if ( ((st=
ruct ubifs_ch *)wbuf->buf)->node_type > =0A> UBIFS_ORPH_NODE )=0A>>  {=0A>>=
 =0A>> =A0 =A0 =A0 =A0  // ABORT WRITE=0A>> =A0 =A0  }=0A>> =0A>> =A0 =A0  =
err =3D ubi_leb_write(c->ubi, wbuf->lnum, wbuf->buf, =0A> wbuf->offs,=0A>> =
=0A> The above code assumes the contents of the write-buffer always starts=
=0A> with an UBIFS node, which is not true. 'wbuf->buf[0]' may be the =0A> =
middle=0A> or the end of a node. If you want to add a check, you need to wr=
ite a=0A> helper function which _scans_ the write-buffer and searches for=
=0A> UBIFS_NODE_MAGIC, and _then_ may be the start of a node. Then you go=
=0A> check the common header CRC. And the write-buffer may contain more tha=
n=0A> one node, so you need to iterate. And you need to take into account t=
he=0A> case when this is the end of the write-buffer and the common header =
does=0A> not fit.=0A>> =0A>>  Can anybody help me understand how to check t=
o see if the LEB is=0A>>  corrupted before we write?=A0 I'm trying to get c=
lose enough to the=0A>>  corruption to get a backtrace.=0A> =0A> Corrupted =
how - the CRC is corrupted? You can try to scan the LEB in the=0A> previoiu=
s LEB using 'ubifs_scan()' in before switching to the new one in=0A> the 'u=
bifs_wbuf_seek_nolock()' function, I guess.=0A> =0A> -- =0A> Best Regards,=
=0A> Artem Bityutskiy=0A> =0A> ____________________________________________=
__________=0A> Linux MTD discussion mailing list=0A> http://lists.infradead=
.org/mailman/listinfo/linux-mtd/=0A> 
