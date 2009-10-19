Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MzyC1-0001pm-Uc
	for linux-mtd@lists.infradead.org; Mon, 19 Oct 2009 19:47:03 +0000
Received: from az33smr02.freescale.net (az33smr02.freescale.net [10.64.34.200])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id
	n9JJkrt6018069 for <linux-mtd@lists.infradead.org>;
	Mon, 19 Oct 2009 12:46:53 -0700 (MST)
Received: from az33exm25.fsl.freescale.net (az33exm25.am.freescale.net
	[10.64.32.16])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id n9JJksaU002259
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Oct 2009 14:46:54 -0500 (CDT)
Message-ID: <4ADCC247.6080107@freescale.com>
Date: Mon, 19 Oct 2009 14:47:19 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Felix Radensky <felix@embedded-sol.com>
Subject: Re: UBIFS problem on MPC8536DS
References: <4AD5ADC9.30503@embedded-sol.com> <4AD5C5B4.3060303@nokia.com>
	<4AD5D053.9000901@embedded-sol.com> <4AD5FFE7.7080703@nokia.com>
	<4AD60EF4.4080306@embedded-sol.com>
	<4AD614E4.6030005@freescale.com> <4AD7811A.6040501@freescale.com>
	<4AD7FE37.1060705@embedded-sol.com>
	<20091016153128.GA11838@loki.buserror.net>
	<4ADAE205.7070106@embedded-sol.com>
	<20091019154002.GC19074@loki.buserror.net>
	<4ADCC08D.5080207@embedded-sol.com>
In-Reply-To: <4ADCC08D.5080207@embedded-sol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Felix Radensky wrote:
> OK, no problem. I just wanted to get an idea of what should be done.
> Should the NOR code poll some eLBC register to wait for completion of
> NAND special operation ? Can you tell what register is relevant ?

I was thinking you'd just share a mutex with the NAND code.

-Scott
