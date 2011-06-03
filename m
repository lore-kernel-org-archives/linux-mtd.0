Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSP3f-0000aR-Aa
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 07:44:40 +0000
Received: by pvh11 with SMTP id 11so1048322pvh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 00:44:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307086473.7474.1.camel@phoenix>
References: <1307086473.7474.1.camel@phoenix>
Date: Fri, 3 Jun 2011 09:44:36 +0200
Message-ID: <BANLkTikt4y3ZKJD2Ld_hxAAzjOpevEqFfA@mail.gmail.com>
Subject: Re: [PATCH] mtd: pxa3xx_nand: remove unused variable 'mtd'
From: Daniel Mack <zonque@gmail.com>
To: Axel Lin <axel.lin@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Eric Miao <eric.y.miao@gmail.com>, linux-kernel@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	linux-mtd@lists.infradead.org, Lei Wen <adrian.wenl@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alex,

On Fri, Jun 3, 2011 at 9:34 AM, Axel Lin <axel.lin@gmail.com> wrote:
> Remove unused variable 'mtd' to eliminate below warning.
>
> =A0CC =A0 =A0 =A0drivers/mtd/nand/pxa3xx_nand.o
> drivers/mtd/nand/pxa3xx_nand.c: In function 'pxa3xx_nand_suspend':
> drivers/mtd/nand/pxa3xx_nand.c:1167: warning: unused variable 'mtd'
> drivers/mtd/nand/pxa3xx_nand.c: In function 'pxa3xx_nand_resume':
> drivers/mtd/nand/pxa3xx_nand.c:1180: warning: unused variable 'mtd'

Do you actually use this driver? I'm asking because there's some sort
of nasty regression in the changes between 2.6.38 and 2.6.39 which
makes the driver fail to work on my PXA300 based board. Lei and me
tried to nail these issues down, but we didn't succeed yet.


Daniel
