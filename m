Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCL9m-0002Lj-SI
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 02:29:39 +0000
Message-ID: <51340714.3070108@freescale.com>
Date: Mon, 4 Mar 2013 10:29:40 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v2] mtd: torturetest: add the support for random data
 pattern
References: <alpine.DEB.2.00.1302050900010.3736@lnxricardw.se.axis.com>	
 <1360052485-11961-1-git-send-email-b32955@freescale.com>	
 <1360751856.12703.132.camel@sauron.fi.intel.com>	
 <CAMiH66FFzeSg7r_hedet5deynxY6OF18UMcASsX-GaHjGmXiZQ@mail.gmail.com>
 <1362235493.2745.11.camel@sauron>
In-Reply-To: <1362235493.2745.11.camel@sauron>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: ricard.wanderlof@axis.com, Huang Shijie <shijie8@gmail.com>,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B403=E6=9C=8802=E6=97=A5 22:44, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Sat, 2013-02-16 at 12:00 +0800, Huang Shijie wrote:
>> On Wed, Feb 13, 2013 at 6:37 PM, Artem Bityutskiy<dedekind1@gmail.com>=
  wrote:
>>> On Tue, 2013-02-05 at 16:21 +0800, Huang Shijie wrote:
>>>> Add a new module parameter 'pattern'. The meaning of the pattern is:
>>>>    (1) pattern =3D=3D 0 for 55/AA pattern.
>>>>    (2) pattern<  0 for random pattern.
>>>>    (3) pattern>  0 for random pattern too, the value of the pattern =
is used
>>>>        as the seed for the random generator.
>>> Please, do not add parameters, make it simple - teach the test to use
>>> both the old patterns plus additional cycles with random patterns.
>> but if we do not add new parameter, how can we create a random seed?
> Unless you have a real practical reason to let users pass the initial
> random seed, do not do this.
>
ok. got it.

thanks
Huang Shijie
