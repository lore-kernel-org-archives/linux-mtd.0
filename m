Received: from brvmst.brv.se ([148.160.26.95])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wzgs1-0001XR-Bw
 for linux-mtd@lists.infradead.org; Wed, 25 Jun 2014 06:39:50 +0000
Received: from sbs.brv.local ([192.168.100.20] helo=remote.brv.se)
 by brvmst.brv.se with esmtp (Exim 4.82)
 (envelope-from <Henric.Eriksson@brv.se>) id 1WzgrV-0006Tk-Fv
 for linux-mtd@lists.infradead.org; Wed, 25 Jun 2014 08:39:27 +0200
From: Henric Eriksson <Henric.Eriksson@brv.se>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Flash corruption when using UBIFS filesystem on m25p80
Date: Wed, 25 Jun 2014 06:39:16 +0000
Message-ID: <53AA6E94.8060509@brv.se>
References: <53A83529.9050007@brv.se>
In-Reply-To: <53A83529.9050007@brv.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5A6F64816312BB49A5F513F4E01096B6@brv.se>
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

Henric Eriksson skrev:
> Hello,
>
> We have a board with a Freescale i.MX28 running Linux kernel 3.14.3
> (Freescale mainline fork). This board has a Spansion S25FL512S Flash
> memory connected with support for Quad SPI communication. We've been
> working for a while now trying to use this as the main rootfs storage
> but have run into problems of Flash corruption when using UBIFS.
>
> $ mount -t ubifs /dev/ubi0_0 tmp/
> UBIFS: background thread "ubifs_bgt0_0" started, PID 480
> UBIFS error (pid 479): ubifs_scan: garbage
> UBIFS error (pid 479): ubifs_scanned_corruption: corruption at LEB 4:0
> UBIFS error (pid 479): ubifs_scanned_corruption: first 8192 bytes from
> LEB 4:0
> UBIFS error (pid 479): ubifs_scan: LEB 4 scanning failed
> UBIFS: background thread "ubifs_bgt0_0" stops
> mount: mounting /dev/ubi0_0 on tmp/ failed: Structure needs cleaning
>
> Subsequent mounts cause it to attempt recovery but it always inevitably
> fails with similar errors.
>

This turned out to be an issue with the underlying SPI driver spi-mxs=20
attempting to use DMA mxs-dma for transfers with over 32 bytes in size.=20
For some reason, this would corrupt the data. As a workaround we have=20
for now disabled DMA access from the SPI driver and have since not=20
experienced any issues whatsoever.

/Henric=
