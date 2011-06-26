Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaiZf-0004Ob-LU
	for linux-mtd@lists.infradead.org; Sun, 26 Jun 2011 06:12:04 +0000
Received: by pzk28 with SMTP id 28so2670439pzk.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Jun 2011 23:12:00 -0700 (PDT)
MIME-Version: 1.0
Sender: glikely@secretlab.ca
In-Reply-To: <20110625152009.f264be78.randy.dunlap@oracle.com>
References: <20110624155822.cb8cf6eb.sfr@canb.auug.org.au>
	<20110624090456.191f1fda.randy.dunlap@oracle.com>
	<1308947172.13493.37.camel@koala> <4E04F5D0.9090900@oracle.com>
	<1308983721.23868.2.camel@koala>
	<20110625152009.f264be78.randy.dunlap@oracle.com>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Sun, 26 Jun 2011 00:11:40 -0600
Message-ID: <BANLkTi=Q-7bCHaH+-z6gnbwvexpGLYH6pA@mail.gmail.com>
Subject: Re: linux-next: Tree for June 24 (mtd + of)
To: Randy Dunlap <randy.dunlap@oracle.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Vitaly Wool <vwool@ru.mvista.com>,
	dedekind1@gmail.com, LKML <linux-kernel@vger.kernel.org>,
	linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 25, 2011 at 4:20 PM, Randy Dunlap <randy.dunlap@oracle.com> wro=
te:
> On Sat, 25 Jun 2011 09:35:13 +0300 Artem Bityutskiy wrote:
>
>> On Fri, 2011-06-24 at 13:38 -0700, Randy Dunlap wrote:
>> > On 06/24/11 13:26, Artem Bityutskiy wrote:
>> > > On Fri, 2011-06-24 at 09:04 -0700, Randy Dunlap wrote:
>> > >> On Fri, 24 Jun 2011 15:58:22 +1000 Stephen Rothwell wrote:
>> > >>
>> > >>> Hi all,
>> > >>>
>> > >>> Changes since 20110623:
>> > >>>
>> > >>> My fixes tree includes:
>> > >>> =A0 =A0 =A0 =A0 (as an experiment) the early part of mmotm-2011-06=
-22-13-05
>> > >>> =A0 =A0 =A0 =A0 STAGING: Comedi: Build only on arches providing PA=
GE_KERNEL_NOCACHE
>> > >>
>> > >>
>> > >> When CONFIG_MTD=3Dm, CONFIG_MTD_OF_PARTS=3Dy:
>> > >>
>> > >> drivers/mtd/ofpart.o: In function `init_module':
>> > >> ofpart.c:(.init.text+0x0): multiple definition of `init_module'
>> > >> drivers/mtd/mtdcore.o:(.init.text+0x43): first defined here
>> > >
>> > > I guess this is some old issue? I do not think ofpart can be compile=
d-in
>> > > if the mtd core is a module...
>> >
>> > [adding driver author, Vitaly]
>> >
>> > No, it's a current issue.
>>
>> I meant that the subject suggests this is about linux-next, but this
>> problem should be in upstream.
>
> Sorry I misunderstood your comment.
>
> 3.0-rc4 does not have this build error when I use the .config file with i=
t...
> however, I think that 3.0-rc4 also does not build ofpart.ko as it should.
>
> Looks to me like changes in drivers/mtd/{Kconfig && Makefile} caused this
> build error.

The following commit in linux-next appears to be the culprit:

commit 1a6bc893044b961caae1c5a9c6c2065e608da427
Author: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date:   Sun May 29 21:32:33 2011 +0400

    mtd: prepare to convert of_mtd_parse_partitions to partition parser

    Prepare to convert of_mtd_parse_partitions() to usual partitions parser=
:
    1) Register ofpart parser
    2) Internally don't use passed device for error printing
    3) Add device_node to mtd_part_parser_data struct
    4) Move of_mtd_parse_partitions from __devinit to common text section
    5) add ofpart to the default list of partition parsers

    Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
    Signed-off-by: Artem Bityutskiy <dedekind1@gmail.com>

It adds a module_init() call to ofpart.c which does not work the way
that ofpart.c is linked to mtdcore.o.  Seems like that commit series
still needs work.

g.
