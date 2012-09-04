Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8oPy-0000ca-B0
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 08:23:30 +0000
Message-ID: <5045BAF4.9090308@freescale.com>
Date: Tue, 4 Sep 2012 16:25:24 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: cmdlinepart: check the partitions
References: <1346744628-13840-1-git-send-email-b32955@freescale.com>	
 <1346744628-13840-3-git-send-email-b32955@freescale.com>
 <1346746785.12610.12.camel@sauron.fi.intel.com>
In-Reply-To: <1346746785.12610.12.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 shmulik.ladkani@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B409=E6=9C=8804=E6=97=A5 16:19, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> Just do
>
> if (ret)
> 	return ret;
>
>
> and kill the huge 'switch' that you added.
If the cmdline have two mtd-ids such as:
  =20
gpmi-nand:100m(root),100m@100m(kernel),1g@200m(rootfs);edb7212-nand:-(hom=
e)

The `return` will also bypass the `edb7212-nand`.

Is it acceptable?

Best Regards
Huang Shijie
