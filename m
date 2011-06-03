Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSPH4-0000pL-GQ
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 07:58:31 +0000
Received: by yxh35 with SMTP id 35so829020yxh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 00:58:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTikt4y3ZKJD2Ld_hxAAzjOpevEqFfA@mail.gmail.com>
References: <1307086473.7474.1.camel@phoenix>
	<BANLkTikt4y3ZKJD2Ld_hxAAzjOpevEqFfA@mail.gmail.com>
From: Axel Lin <axel.lin@gmail.com>
Date: Fri, 3 Jun 2011 15:58:07 +0800
Message-ID: <BANLkTikEEMGwsACR0404r54jpFKZxX5S=w@mail.gmail.com>
Subject: Re: [PATCH] mtd: pxa3xx_nand: remove unused variable 'mtd'
To: Daniel Mack <zonque@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Eric Miao <eric.y.miao@gmail.com>, linux-kernel@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	linux-mtd@lists.infradead.org, Lei Wen <adrian.wenl@gmail.com>
Reply-To: axel.lin@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Do you actually use this driver? I'm asking because there's some sort
> of nasty regression in the changes between 2.6.38 and 2.6.39 which
> makes the driver fail to work on my PXA300 based board. Lei and me
> tried to nail these issues down, but we didn't succeed yet.

hi Daniel,

I no longer have the device handy.
Last time I use this driver on a pxa310 device is running on 2.6.37 kernel.

Regards,
Axel
