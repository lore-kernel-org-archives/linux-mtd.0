Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EexAw-0007A6-BA
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 11:08:54 -0500
From: "Heiko Schocher" <hs@denx.de>
To: "David Woodhouse" <dwmw2@infradead.org>
Date: Wed, 23 Nov 2005 17:08:43 +0100
Message-ID: <AHEILKONAKAEJPHNMOPNMEMKCDAA.hs@denx.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-Reply-To: <1132750986.15117.252.camel@baythorne.infradead.org>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
Subject: RE: [PATCH]	MTD:	Add support for the PM82x Boards.
Reply-To: hs@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello David,

On Wednesday, November 23, 2005 2:03 PM David Woodhouse wrote:
>> now without drivers/mtd/devices/docprobe.c
>
> Thanks. Are those Intel chips really not CFI-compliant?

I ported this code from the 2.4er Kernel, so I didn´t know
the background, why this code uses the jedec-probe. What
exactly bothers you?

> Please could you also correct each instance of 'MB' to 'MiB'?

OK, i send a new patch.

thanks
Heiko
