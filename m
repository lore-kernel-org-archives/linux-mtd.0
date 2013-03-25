Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UK1fZ-0002qw-Cf
 for linux-mtd@lists.infradead.org; Mon, 25 Mar 2013 07:18:14 +0000
Message-ID: <514FFA64.6000205@freescale.com>
Date: Mon, 25 Mar 2013 15:19:00 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: "Paul B. Henson" <henson@acm.org>
Subject: Re: i.MX28 gpmi-nand underlying geometry
References: <514FC1F1.8040500@acm.org>
In-Reply-To: <514FC1F1.8040500@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B403=E6=9C=8825=E6=97=A5 11:18, Paul B. Henson =E5=86=
=99=E9=81=93:
> kernel. Ideally I'd like to be able to read the necessary information=20
> directly from the NAND while booted with a current kernel.
The current code really does not print out the geometry information=20
directly.

But it's easy to implement it. we can add the dynamic debug code for the=20
gpmi.
If you want to see the geometry infor, you can enable the dynamic debug,=20
and enable it in the kernel cmdline.

i can add it when another gpmi patch is merged:
http://lists.infradead.org/pipermail/linux-mtd/2013-March/046335.html

thanks
Huang Shijie
