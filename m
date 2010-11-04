Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDuJF-00022M-Td
	for linux-mtd@lists.infradead.org; Thu, 04 Nov 2010 07:32:35 +0000
Received: by bwz5 with SMTP id 5so1349451bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Nov 2010 00:32:31 -0700 (PDT)
Subject: Re: ubi deadlock on .36+
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grazvydas Ignotas <notasas@gmail.com>
In-Reply-To: <AANLkTimKc_EtT6NEwbga8g7AKoGnDSt7UMQwgou_jCXD@mail.gmail.com>
References: <AANLkTimKc_EtT6NEwbga8g7AKoGnDSt7UMQwgou_jCXD@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 04 Nov 2010 09:29:09 +0200
Message-ID: <1288855749.2075.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-11-03 at 23:30 +0200, Grazvydas Ignotas wrote:
> Hi,
> 
> there seems to be some issue with NAND on my OMAP3 board that causes
> CRC errors on 2.6.36 and 2.6.37-rc1. Those seem to be triggering a bug
> in UBI that makes it loop forever (or very long) printing this:
> 
> uncorrectable error :
> UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes
> from PEB 0:512, read 512 bytes
> uncorrectable error :
> UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes
> from PEB 68:512, read 512 bytes
> UBI: run torture test for PEB 68
> UBI: PEB 68 passed torture test, do not mark it a bad
> 
> 
> here is full log of one minute session, after which I killed power:
> http://notaz.gp2x.de/misc/pnd/logs/linux_20101103_ubi_lockup

Hmm, could you please enable UBI debugging and provide me the logs? See
here for some hints:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_how_send_bugreport

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
