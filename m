Received: from wx-out-0506.google.com ([66.249.82.229])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GVvX5-0000Kc-0P
	for linux-mtd@lists.infradead.org; Fri, 06 Oct 2006 15:38:58 -0400
Received: by wx-out-0506.google.com with SMTP id t11so974480wxc
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 Oct 2006 12:38:53 -0700 (PDT)
Message-ID: <782515bb0610061232g19bf27e5r386228312a52c69b@mail.gmail.com>
Date: Fri, 6 Oct 2006 14:32:46 -0500
From: "nishanth menon" <menon.nishanth@gmail.com>
To: "z l" <zql@glomationinc.com>
Subject: Re: Problem with developing Samsung K9F1G08U0A MTD driver
In-Reply-To: <20061006140500.6723.qmail@web210.biz.mail.re2.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4525E60D.1030006@gmail.com>
	<20061006140500.6723.qmail@web210.biz.mail.re2.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/6/06, z l <zql@glomationinc.com> wrote:
> > might help, on the R1 device is 128M, the U device
> is 256M(so am not too
> > sure abt ur mtd.size param), on this device,
> page1,page2 offset 0 had
> > badblock info, so am not sure if mtd is putting ecc
> over there..
> I doubled checked the datasheet, R is 1.8v device, U
> is 3.3v.
check page 13 again, table on top, K9K2G08U1A NVB 2008 - 2048 Blocks
(2048*64*2048 = 256M), R1 is 1024blocks.

Regards,
Nishanth Menon
