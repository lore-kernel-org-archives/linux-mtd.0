Received: from lizzard.sbs.de ([194.138.37.39])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cIuHn-0005Gb-7a
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 09:31:12 +0000
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id uBJ9UiI1004980
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 19 Dec 2016 10:30:44 +0100
Received: from DEFTHW99ERJMSX.ww902.siemens.net
 (defthw99erjmsx.ww902.siemens.net [139.22.70.135])
 by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id uBJ9Ueps021439
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 19 Dec 2016 10:30:44 +0100
From: "Leto, Enrico" <enrico.leto@siemens.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: mtd, nand, omap2: how to pass the NAND device name to mtdparts ?
Date: Mon, 19 Dec 2016 09:30:32 +0000
Message-ID: <87CEE11E4E15344BAFE0FAC01C1671FB244857@DEFTHW99EI1MSX.ww902.siemens.net>
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

I'm trying to port some projects to kernel 4.4. It crashes because the driv=
er name given by mtdparts (omap2-nand.0) is no more accepted. It's running =
fine if I replace it with the device name (e.g. S34ML04G1).

We use different NANDs from different manufacturers. I'm searching for a co=
nvenient solution to pass the device name to mtdparts.

Should I read the device name from u-boot and to pass it to mtdparts?
Or some other suggestion or recommendation how to do that ?
