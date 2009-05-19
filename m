Received: from yx-out-1718.google.com ([74.125.44.156])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6QTf-0008Nl-QD
	for linux-mtd@lists.infradead.org; Tue, 19 May 2009 14:39:42 +0000
Received: by yx-out-1718.google.com with SMTP id 6so2456681yxn.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 May 2009 07:39:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090519122714.GH30753@pengutronix.de>
References: <5023288.1242734340173.JavaMail.ngmail@webmail15.arcor-online.net>
	<20090519122714.GH30753@pengutronix.de>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Tue, 19 May 2009 08:39:14 -0600
Message-ID: <fa686aa40905190739j47921320mf0d10b44d13f6dac@mail.gmail.com>
Subject: Re: Q: MTD RAM in OF Device Tree
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: =?ISO-8859-1?Q?Albrecht_Dre=DF?= <albrecht.dress@arcor.de>,
	linux-mtd@lists.infradead.org, linuxppc-dev@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 19, 2009 at 6:27 AM, Wolfram Sang <w.sang@pengutronix.de> wrote=
:
> Hello Albrecht,
>
> (adding linux-mtd)
>
> On Tue, May 19, 2009 at 01:59:00PM +0200, Albrecht Dre=DF wrote:
>>
>> is there a standard way to define a ram chip (in my case a battery-buffe=
red
>> nv ram, attached to the 5200's Local Bus) in the OF tree, and are there =
any
>> drivers (on 2.6.29.1) which pick up the chip/partition specification for=
 mtd?
>> Does such a driver exist, or do I have to write one (probably based on
>> plat-ram.c?)? =A0I think of something like
>
> I wrote such a driver (yet without partitioning support) and I am trying =
to get
> it mainline, just didn't get any comments so far:
>
> http://patchwork.ozlabs.org/patch/23557/
> http://patchwork.ozlabs.org/patch/23556/
>
> I'd be happy if you could give it a try and donate some
> {Acked|Tested|Reviewed}-by tags. Maybe this will help for my next try to =
get
> it mainline.

I missed them when you posted them.  I'll go look now.
--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
