Received: from mail.dsa-ac.de ([62.112.80.99] helo=k2.dsa-ac.de)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19vFT6-0004Tm-Ci
	for <linux-mtd@lists.infradead.org>; Fri, 05 Sep 2003 13:13:36 +0100
Received: from komserver.dsa-ac.de (KOMSERVER2.dsa-ac.de [172.28.1.4])
	731874B25	for <linux-mtd@lists.infradead.org>;
	Fri,  5 Sep 2003 14:13:13 +0200 (CEST)
Received: from PCGL.dsa-ac.de (PCGL.dsa-ac.de [172.29.17.23])
	id 2CD4D1D3E	for <linux-mtd@lists.infradead.org>;
	Fri,  5 Sep 2003 14:13:04 +0200 (CEST)
Date: Fri, 5 Sep 2003 14:13:03 +0200 (CEST)
From: Guennadi Liakhovetski <gl@dsa-ac.de>
To: linux-mtd@lists.infradead.org
In-Reply-To: <Pine.LNX.4.56.0309051408170.2669@pcgl.dsa-ac.de>
Message-ID: <Pine.LNX.4.56.0309051412000.2669@pcgl.dsa-ac.de>
References: <Pine.LNX.4.56.0309051408170.2669@pcgl.dsa-ac.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: Re: Reading from flash in kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Forgot:

On Fri, 5 Sep 2003, Guennadi Liakhovetski wrote:

> mtd = get_mtd_device(NULL, MTD_MINOR);
> ret = MTD_READ(mtd, ppos, len, &retlen, kbuf);
> put_mtd_device(mtd);
>
> MTD_READ() returns 0,

... and retlen == len. (I started with 128 bytes).

Guennadi
---------------------------------
Guennadi Liakhovetski, Ph.D.
DSA Daten- und Systemtechnik GmbH
Pascalstr. 28
D-52076 Aachen
Germany
