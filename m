Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLpVx-00049z-4u
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 07:48:17 +0000
Message-ID: <531979DD.8080305@freescale.com>
Date: Fri, 7 Mar 2014 15:48:45 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 1/3] mtd: nand: add a helper to parse the Hynix nand
References: <1388736518-5934-1-git-send-email-b32955@freescale.com>
 <1388736518-5934-2-git-send-email-b32955@freescale.com>
 <20140307074134.GE31517@norris-Latitude-E6410>
In-Reply-To: <20140307074134.GE31517@norris-Latitude-E6410>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2014=E5=B9=B403=E6=9C=8807=E6=97=A5 15:41, Brian Norris =E5=86=99=
=E9=81=93:
> Can you use 'decode' instead of 'parse', so the naming is like
> nand_decode_id() and nand_decode_ext_id()?
>
ok.

the patch 2 uses the SZ_4K macro, so it also needs the header size.h.
I will send a new version later.

thanks
Huang Shijie
