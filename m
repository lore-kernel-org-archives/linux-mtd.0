Received: from f152.pav1.hotmail.com ([64.4.31.152] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1891dH-00088R-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2002 11:12:31 +0000
From: "vijay vijay" <vijay_peshkar@hotmail.com>
To: joern@wohnheim.fh-wedel.de
Cc: linux-mtd@lists.infradead.org, vijay.peshkar@wipro.com
Subject: Re: mtd2 partition mapping on mtd1?...
Date: Tue, 05 Nov 2002 11:42:14 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F152wVn20lbhsKd6QR700003f5b@hotmail.com>
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

Jörn,

Thanks.

The fact that am hardcoding my root fs address in cramfs_read
instead of picking it up from mtd0(which am able to operate on after
bootup) still bothers me. Any (better) way of telling the kernel to
pick rootfs from mtd0?. Have tried with root=/dev/mtd0.
Am building an initrd image.

One more query:
My kernel and another partition will have raw data. What api's to
operate on them?. Tried __raw_writel etc., but that doesn't seem
to change the flash location data.

Regards,
Vijay

On Mon, 4 November 2002 10:50:05 +0000, vijay vijay wrote:
>
>Stupid me. Was all along trying to write without erasing!!.
>Now am able to write to desired partition after erasing the
>same.

Cool, I just wanted to take a closer look at your problem. Great
timing. ;-)

Jörn

--
Homo Sapiens is a goal, not a description.
-- unknown


_________________________________________________________________
Internet access plans that fit your lifestyle -- join MSN. 
http://resourcecenter.msn.com/access/plans/default.asp
