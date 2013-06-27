Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UsBqN-0000TC-Qz
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2013 13:02:36 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: enrico benetti <enrico.benetti@bluewind.it>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: UBIFS: power cut test on 2.6.35 + NOR
Date: Thu, 27 Jun 2013 13:01:40 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FCA8354@post.tritech.se>
References: <51CBDF47.709@bluewind.it>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCA81FE@post.tritech.se>,
 <51CC3669.103@bluewind.it>
In-Reply-To: <51CC3669.103@bluewind.it>
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

>From: linux-mtd [linux-mtd-bounces@lists.infradead.org] on behalf of enric=
o benetti [enrico.benetti@bluewind.it]=0A=
>Sent: Thursday, June 27, 2013 2:56 PM=0A=
>To: linux-mtd@lists.infradead.org=0A=
>Subject: Re: UBIFS: power cut test on 2.6.35 + NOR=0A=
>=0A=
>> I'm using 2.6.35.14 (last 2.6.35) with all UBIFS patches from the=0A=
>> repo you mentioned above. I have also added/ported all patches from=0A=
>> mainline 3.9 stable (excluding those only dealing with debug prints etc)=
.=0A=
>>=0A=
>> Still I have some minor (I hope) issues after running integck power-cut=
=0A=
>> tests for several days. They manifest in errors on xattr nodes.=0A=
>> There are some related patches in discussion, see:=0A=
>> http://thread.gmane.org/gmane.linux.kernel.lsm/18746=0A=
>> http://thread.gmane.org/gmane.linux.drivers.mtd/47021=0A=
>>=0A=
>>=0A=
>Hi Mats, Norbert,=0A=
>thanks for your kind feedbacks.=0A=
>=0A=
>Mats, are you working on a NOR-based system or are you referring to NAND?=
=0A=
=0A=
NOR=0A=
=0A=
>=0A=
>I'm going to merge from 2.6.35 back-port repo and I'll let you know.=0A=
>=0A=
>Regards,=0A=
>E=0A=
