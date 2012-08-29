Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T6dus-00019Y-MQ
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 08:46:27 +0000
Message-ID: <503DD74E.2080204@freescale.com>
Date: Wed, 29 Aug 2012 16:48:14 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v2] mtd: cmdlinepart: fix the wrong partitions number
 when truncating occurs
References: <1345904767-23011-1-git-send-email-shijie8@gmail.com>
 <20120825120231.73577d6a@halley>
 <CAMiH66HyfNEzEHGyZUcLJ_01PNVHqA44fjAqXsyM2c-HHms8hQ@mail.gmail.com>
 <20120826090603.6b833e54@pixies.home.jungo.com>
 <CAMiH66GVNad4dzbA9M66BGxGGb-JxQz8NJjBVWHcqp6FRpNbAQ@mail.gmail.com>
 <1346228646.2848.437.camel@sauron.fi.intel.com>
In-Reply-To: <1346228646.2848.437.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B408=E6=9C=8829=E6=97=A5 16:24, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> While appreciating Shmulik's attention to details, I vote this way:
>
> On Sun, 2012-08-26 at 02:47 -0400, Huang Shijie wrote:
>> Could Artem or David point us a direction about this?
>> [1]  Should the unsorted partitions be supported?
> No, it is asking for troubles.
>
thanks.
>> [2] And what should we do when we meet a 1GB nand, and the cmdline is
>>        gpmi-nand:100m(root),100m(kernel),1g(rootfs),1g(user),-(rest)
> Drop 'user' and 'rest' - I've sent some explanations in the previous
> e-mail.
>
ok, thanks.

I think this patch is enough to fix this issue.


Huang Shijie
