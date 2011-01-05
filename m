Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PaOsW-0001EK-9g
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2011 08:37:57 +0000
Received: by fxm19 with SMTP id 19so14153380fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 05 Jan 2011 00:37:55 -0800 (PST)
Subject: Re: [PATCH] txx9ndfmc: limit transfer bytes to 512 (ECC provides 6
	bytes max)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ralf =?ISO-8859-1?Q?R=F6sch?= <ralf.roesch@rw-gmbh.de>
In-Reply-To: <4D1C5123.4050804@rw-gmbh.de>
References: <4D1C5123.4050804@rw-gmbh.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 Jan 2011 10:37:51 +0200
Message-ID: <1294216671.2179.10.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-12-30 at 10:30 +0100, Ralf Rösch wrote:
> See commit: c0cbfd0e81d879a950ba6f0df3f75ea30c5ab16e
> Using __nand_correct_data() helper function, this driver can read 512
> byte (with 6 byte ECC) at a time.
> 
> This is correct, but not more:
> With NAND chips providing page sizes > 512 Bytes
> chip->ecc.bytes are calculated > 6 in txx9ndfmc_nand_scan.
> According the data sheet there are (only) 6 bytes ECC available.
> 
> After applying the patch a Hynix 512M*8 with 2k page size could be
> successfully formatted and used with an ubifs file system.
> 
> Signed-off-by: Ralf Roesch <ralf.roesch@rw-gmbh.de>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
