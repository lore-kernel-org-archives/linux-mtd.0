Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tg5DB-0002PU-Gi
 for linux-mtd@lists.infradead.org; Wed, 05 Dec 2012 02:59:50 +0000
Message-ID: <50BEB9BC.30105@freescale.com>
Date: Wed, 5 Dec 2012 11:04:28 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Zach Sadecki <zsadecki@itwatchdogs.com>
Subject: Re: [PATCH] mtd: gpmi: Always report ECC stats and return max_bitflips
References: <50BD01F8.3040003@itwatchdogs.com> <50BD6F62.80200@freescale.com>
 <50BE0B4A.9000503@itwatchdogs.com>
In-Reply-To: <50BE0B4A.9000503@itwatchdogs.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B412=E6=9C=8804=E6=97=A5 22:40, Zach Sadecki =E5=86=99=
=E9=81=93:
> max_bitflips represents the maximum number of bitflips per ECC=20
> corrected region in a page.=20
got it.

I also tested this patch in the mx6q-arm2 board. it runned well.

thanks.

Acked-by: Huang Shijie <b32955@freescale.com>


Huang Shijie
