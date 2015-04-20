Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YkAgU-0003Ch-KA
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2015 12:20:19 +0000
Date: Mon, 20 Apr 2015 14:19:43 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: i.MX25 NFC with 8 bit ecc strength
In-Reply-To: <20150420045614.GC5428@tarshish>
Message-ID: <alpine.DEB.2.02.1504201417360.27750@lnxricardw1.se.axis.com>
References: <20150420045614.GC5428@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Cc: Shawn Guo <shawn.guo@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 20 Apr 2015, Baruch Siach wrote:

> Hi Shawn, Sascha, all,
> 
> I'm trying to get nand_ecclayout right on i.MX25 with the Micron 
> MT29F8G08ABABA (page size: 4096, oob size: 224). The large OOB size allows 
> using hardware ecc strength of 8bit per ecc step (512 bytes). The mxc_nand 
> driver code (get_eccsize()) and the reference manual seems to indicate that 
> enabling 8 bit ecc mode requires 26 oob bytes per ecc step.

Note sure if these really is relevant to this thread, but using BCH, 8 bit 
error correction per 512 byte ECC step requires 13 bytes of ECC codes per 
ECC step. (Depending on other factors, this will actually fit nicely even 
in a 64 byte OOB).

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
