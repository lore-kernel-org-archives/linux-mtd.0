Received: from yw-out-1718.google.com ([74.125.46.154])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KNsAf-0000b2-Rm
	for linux-mtd@lists.infradead.org; Tue, 29 Jul 2008 16:35:34 +0000
Received: by yw-out-1718.google.com with SMTP id 5so2186877ywm.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Jul 2008 09:35:32 -0700 (PDT)
Message-ID: <6934efce0807290935m1a89629es12da643914b4f1d7@mail.gmail.com>
Date: Tue, 29 Jul 2008 09:35:31 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: Darius <augulis.darius@gmail.com>
Subject: Re: XIP Kernel freeze
In-Reply-To: <g6776j$n5p$1@ger.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <g6776j$n5p$1@ger.gmane.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

You can turn on MTD_XIP "XIP aware MTD support"

> kernel freezes when booting on this line from cfi_probe.c:
>
> cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
> cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
> --->>> cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
>
When you issue that last command it will trigger the Flash to output
status instead of data.


> This board has two 16bit NOR Flahs devices configured as one 32bit memory.
> Overall 32Mbytes Flash. Memory chips are Spansion S29PL127.

If the flash has multiple hardware partitions you might be able to
simply move the kernel to the end of the chip instead of the
beginning.
