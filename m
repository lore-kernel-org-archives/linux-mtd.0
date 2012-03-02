Received: from nm8-vm0.bullet.mail.ird.yahoo.com ([77.238.189.203])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S3UCR-0000pk-CN
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2012 15:15:16 +0000
Message-ID: <1330701313.29258.YahooMailClassic@web29001.mail.ird.yahoo.com>
Date: Fri, 2 Mar 2012 15:15:13 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OF3BA4765E.16024E23-ONC12579B5.004E96D5-C12579B5.004FAAF8@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, philipp.zabel@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- On Fri, 2/3/12, Joakim Tjernlund <joakim.tjernlund@transmode.se> wrote:=
=0A> > The problem only became a problem for me after I=0A> switched from J=
FFS2 to=0A> > UBIFS. I found that UBIFS would make file systems=0A> read-on=
ly. Either JFFS2=0A> > was more forgiving of CFI errors, or UBIFS exercised=
=0A> CFI in new ways that=0A> > provoked the errors. As others switch from =
JFFS2 to=0A> UBIFS they too might=0A> > find the same problem.=0A> =0A> yes=
, UBI probably has some different use. One seems that it=0A> keeps erasing =
the=0A> same block over and over again if the erase fails. JFFS2=0A> doesn'=
t do that since=0A> you can't trust a block that is failing erase(how can y=
ou be=0A> sure that write will work?)=0A> So, IMHO, UBIFS should reconsider=
 this policy.=0A> =0A> On that note, have you noticed any difference betwee=
n JFFS2=0A> and UBIFS?=0A> Is performance comparable?=0A=0AI haven't spent =
any time considering performance since I am preoccupied=0Awith the errors. =
However my perception is that UBIFS boots slower but is=0Aquicker for norma=
l file writes and perhaps reads.=0A=0AOne functional difference which I hav=
e tested is the mmap(2) MAP_SHARED=0Aflag. This was not supported in JFFS2 =
and consequently commands such as=0Alocaledef would simply fail. On UBIFS l=
ocaledef works normally.
