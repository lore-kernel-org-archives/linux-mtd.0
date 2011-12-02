Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RWQEh-00028C-D3
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2011 10:20:56 +0000
Received: by eaac10 with SMTP id c10so3843542eaa.36
 for <linux-mtd@lists.infradead.org>; Fri, 02 Dec 2011 02:20:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1322728943.2332.13.camel@koala>
References: <CAN8TOE9=ux=suwcQMwJY1XUhp_mnD_DL613ffF1-HTL1OVB2PQ@mail.gmail.com>
 <1322557213-23565-1-git-send-email-j.weitzel@phytec.de>
 <1322728943.2332.13.camel@koala>
Date: Fri, 2 Dec 2011 12:20:52 +0200
Message-ID: <CANOLnOOE3a0BP0TcLnRAmq5YAiHLZTpkbriDh9WtkkBT7TotFA@mail.gmail.com>
Subject: Re: [PATCH] mdt nand: omap2+ use platform options
From: Grazvydas Ignotas <notasas@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-omap@vger.kernel.org, dedekind@infradead.org,
 Jan Weitzel <j.weitzel@phytec.de>, linux-mtd@lists.infradead.org,
 tglx@linutronix.de, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 1, 2011 at 10:42 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Tue, 2011-11-29 at 10:00 +0100, Jan Weitzel wrote:
>> Signed-off-by: Jan Weitzel <j.weitzel@phytec.de>
>
> Pushed to l2-mtd-2.6.git, thank you!

This breaks build here, did you really test it, Jan?

drivers/mtd/nand/omap2.c: In function 'omap_nand_probe':
drivers/mtd/nand/omap2.c:1078: error: 'struct omap_nand_platform_data'
has no member named 'options'


--=20
Gra=C5=BEvydas
