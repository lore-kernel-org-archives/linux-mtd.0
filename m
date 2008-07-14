Received: from an-out-0708.google.com ([209.85.132.247])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KIUk2-0002Jl-9w
	for linux-mtd@lists.infradead.org; Mon, 14 Jul 2008 20:33:50 +0000
Received: by an-out-0708.google.com with SMTP id c24so880149ana.99
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Jul 2008 13:33:48 -0700 (PDT)
Message-ID: <acd2a5930807141333u1266830dvd2ca57a9d2729d04@mail.gmail.com>
Date: Tue, 15 Jul 2008 00:33:48 +0400
From: "Vitaly Wool" <vitalywool@gmail.com>
To: "Divyanshu Verma" <dverma@broadcom.com>
Subject: Re: Regarding NAND driver based on PrimeCell Static Memory Controller
	(PL350 series)
In-Reply-To: <E06E3B7BBC07864CADE892DAF1EB0FBD095146C0@NT-SJCA-0752.brcm.ad.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080711223448.f5826678.yoichi_yuasa@tripeaks.co.jp>
	<20080711141053.GD13593@linux-mips.org>
	<1215797959.11567.448.camel@pmac.infradead.org>
	<E06E3B7BBC07864CADE892DAF1EB0FBD095146C0@NT-SJCA-0752.brcm.ad.broadcom.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/14/08, Divyanshu Verma <dverma@broadcom.com> wrote:
>
>  Hi,
>  I am trying to implement a NAND driver for our SOC. The problem I am
>  facing is that, our NAND controller does not allow me to have access to
>  hardware specific control line. In other words, I cannot follow the
>  mechanism given on http://www.linux-mtd.infradead.org/ for NAND driver
>  as I cannot write  "my_nand_hwcontrol"  function. The H/w guys say that
>  all this is taken care in the controller itself.

As far as I recall, PrimeCell thingies fit well into the _new_
MTD/NAND subsystem.
Please provide more detail on your one and I hope I'll be able to give
you some guidance.

Vitaly
