Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCl0u-00055w-JG
 for linux-mtd@lists.infradead.org; Tue, 14 Jun 2016 09:52:05 +0000
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Stefano Babic <sbabic@denx.de>
Subject: UBIFS Encryption
Cc: richard@nod.at, ezequiel@vanguardiasur.com.ar
Message-ID: <575FD3A7.4050905@denx.de>
Date: Tue, 14 Jun 2016 11:51:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have the necessity to encrypt UBIFS - I have read that there is some
movement about this, for example here:

	http://lists.infradead.org/pipermail/linux-mtd/2016-March/066277.html

and some years ago there was another attempt:

	https://patchwork.ozlabs.org/patch/150160/

It looks like from patchwork that the above patch was merged, but it is
not. Anyway, this looks as a starting point to add encryption /
decryption routine, for example using crypto hardware, to the compress /
decompress functions. In my understanding (I have a i.MX6 with CAAM
crypto hardware), this can be possible - but I am asking here if there
are some progress and which could be the best long term solution.

Best regards,
Stefano Babic

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================
