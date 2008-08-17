Received: from smtpauth01.csee.onr.siteprotect.com ([64.26.60.145])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KUrhW-00015P-RA
	for linux-mtd@lists.infradead.org; Sun, 17 Aug 2008 23:30:23 +0000
Message-ID: <48A8B486.5070900@boundarydevices.com>
Date: Sun, 17 Aug 2008 16:30:14 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: frans <fransmeulenbroeks@gmail.com>
Subject: Re: [RESUBMIT] [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved
	performance
References: <alpine.DEB.0.99.0807311031390.6774@frans-desktop>
	<1218472202.2977.12.camel@pmac.infradead.org>
	<ac9c93b10808120153m7435424ci3e49a70d3599cc06@mail.gmail.com>
	<1218535872.2977.133.camel@pmac.infradead.org>
	<alpine.DEB.0.99.0808142007340.6572@frans-desktop>
	<48A48330.70105@boundarydevices.com>
	<ac9c93b10808150141o6627e350pd23895d56426d59c@mail.gmail.com>
	<1218789997.3184.64.camel@pmac.infradead.org>
	<ac9c93b10808150223h6fb6032co61ffa7babba57884@mail.gmail.com>
	<1218793271.3184.77.camel@pmac.infradead.org>
	<ac9c93b10808150304k14f054faw402a7f67e868d2a@mail.gmail.com>
	<1218795140.3184.84.camel@pmac.infradead.org>
	<48A5D154.2000409@boundarydevices.com>
	<alpine.DEB.0.99.0808152300300.9220@frans-desktop>
In-Reply-To: <alpine.DEB.0.99.0808152300300.9220@frans-desktop>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> +	if (nr_bits == 11) {	/* correctable error */

This is a necessary, but NOT sufficient condition to
determine that it is a 1 bit error.


Big MAYBE below

This is probably why you passed the big endian test.
It was seeing every read as a single bit error
and silently correcting. Adding a debug print
when correcting or failing to correct would be
useful.

Troy
