Received: from tomts16-srv.bellnexxia.net ([209.226.175.4])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17CKoI-00011k-00
	for <linux-mtd@lists.infradead.org>; Mon, 27 May 2002 14:45:18 +0100
Date: Mon, 27 May 2002 09:45:15 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: =?gb2312?q?cytang?= <cytang_cn@yahoo.com.cn>
cc: linux-mtd@lists.infradead.org
Subject: Re: grub cannt  boot from doc millennium
In-Reply-To: <20020527123149.40310.qmail@web14405.mail.yahoo.com>
Message-ID: <Pine.LNX.4.44.0205270938250.8830-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Mon, 27 May 2002, [gb2312] cytang wrote:

> I searched the mail archive with keyword "grub"
> but I only find just one detailed howto : 

There is a short how-to in the README_DiskOnChip file created by the
patch.

> 4. rm configure;
>    autoconf
> 5. make ; make install;

Run 

    ./configure --enable-diskonchip-mil512

or

    ./configure --enable-diskonchip-mil256

depending on the type of the DoC Millennium flash parts.  You may want to
explicitly disable unused file system drivers and leave only required one.

> 6. cp stage2/pre_stage2 /usr/src/mtd/grub

This and the next step are no longer needed.  The README_DiskOnChip file
suggests to obtain the GRUB bootloader firmware from stage2/grub_firmware.

Ilguiz
