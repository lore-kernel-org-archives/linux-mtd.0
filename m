Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIa8B-0001Pe-R0
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 13:36:46 +0000
Date: Tue, 15 May 2018 15:36:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cardoen Pieter <P.Cardoen@TELEVIC.com>
Cc: "han.xu@nxp.com" <han.xu@nxp.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "richard@nod.at" <richard@nod.at>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: GPMI nand flash ECC errors with mainline kernel
Message-ID: <20180515153622.738a3f53@xps13>
In-Reply-To: <HE1PR0702MB36288289EA58B7D0B5368A9FFF930@HE1PR0702MB3628.eurprd07.prod.outlook.com>
References: <HE1PR0702MB362877849767B637814CF9B6FF930@HE1PR0702MB3628.eurprd07.prod.outlook.com>
 <20180515135900.3bf24b98@xps13>
 <HE1PR0702MB36288289EA58B7D0B5368A9FFF930@HE1PR0702MB3628.eurprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cardoen,

First, can you please subscribe to the MTD mailing-list [1] or fix
your mailer, it looks like your issue did not reach the community and
only the cc:'ed people received it (It was bumped to me).

[1] http://www.linux-mtd.infradead.org/mail.html

> I was a little behind the current master (I started on this a month ago).=
 This commit wasn't yet applied so this couldn't be the cause of the issue.=
 I'll retried with the current master branch and had the same result.

Can you please share the exact kernel version you are testing?
Do you apply patches on top of it?
What is your device tree?

> I will revert these commits and try again but I don't think this will hel=
p as i had it already before these patches were applied.

You can test with the latest patches [2] to verify the problem is still
there but no need to try to revert these commits if the problem was
already present before.

[2] http://git.infradead.org/linux-mtd.git/shortlog/refs/heads/master

Thanks,
Miqu=C3=A8l
