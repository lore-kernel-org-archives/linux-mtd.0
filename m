Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Us9k2-0005N6-US
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2013 10:47:55 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: enrico benetti <enrico.benetti@bluewind.it>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: UBIFS: power cut test on 2.6.35 + NOR
Date: Thu, 27 Jun 2013 10:47:00 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FCA81FE@post.tritech.se>
References: <51CBDF47.709@bluewind.it>
In-Reply-To: <51CBDF47.709@bluewind.it>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Enrico,=0A=
=0A=
> From: linux-mtd [linux-mtd-bounces@lists.infradead.org] on behalf of enri=
co benetti [enrico.benetti@bluewind.it]=0A=
> Sent: Thursday, June 27, 2013 8:44 AM=0A=
> To: linux-mtd@lists.infradead.org=0A=
> Subject: UBIFS: power cut test on 2.6.35 + NOR=0A=
=0A=
> I've checked git repos, and=0A=
> http://git.infradead.org/users/dedekind/ubifs-v2.6.35.git/=0A=
> <http://git.infradead.org/users/dedekind/ubifs-v2.6.35.git/shortlog>=0A=
> is updated to 08/2012 (that is approx 3.7.1 kernel revision) and no more=
=0A=
> supported.=0A=
=0A=
I'm using 2.6.35.14 (last 2.6.35) with all UBIFS patches from the=0A=
repo you mentioned above. I have also added/ported all patches from=0A=
mainline 3.9 stable (excluding those only dealing with debug prints etc).=
=0A=
=0A=
Still I have some minor (I hope) issues after running integck power-cut=0A=
tests for several days. They manifest in errors on xattr nodes.=0A=
There are some related patches in discussion, see:=0A=
http://thread.gmane.org/gmane.linux.kernel.lsm/18746=0A=
http://thread.gmane.org/gmane.linux.drivers.mtd/47021=0A=
=0A=
BR // Mats=
