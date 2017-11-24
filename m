Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <sha@pengutronix.de>) id 1eIBpx-0002nH-PD
 for linux-mtd@lists.infradead.org; Fri, 24 Nov 2017 12:08:01 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.84_2)
 (envelope-from <sha@pengutronix.de>) id 1eIBpx-0000iU-HN
 for linux-mtd@lists.infradead.org; Fri, 24 Nov 2017 12:08:01 +0100
Date: Fri, 24 Nov 2017 12:08:01 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Confusing UBI warning
Message-ID: <20171124110801.ntr634h5tyytlsne@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I'm frequently asked about the meaning of the following message:

ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 126976 bytes from PEB 1771:4096, read only 126976 bytes, retry

The confusing part of this message is that UBI seems to expect a short
read in case of an ECC error and the wording of the message seems to
imply that all data has been read successfully.

I digged into the NAND layer to see if there's any chance for a short
read and saw that the NAND layer always reads the full amount of data,
no chance for a short read.

Now there's not only NAND of course. Are there any other mtd devices
where a real short read can happen? Otherwise I would just patch the
"read only xx bytes" part away.

If the "read only" indeed can carry useful information then instead we
might change the message that the part is only printed when the read
number of bytes is actually less than the desired number of bytes.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
