Received: from vps1.hno.se ([2a02:750:5::f0])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5fq8-000578-Ka
 for linux-mtd@lists.infradead.org; Tue, 21 Jan 2014 18:14:21 +0000
Message-ID: <1390328011.5046.16.camel@localhost>
Subject: Re: [linux-sunxi] Re: [RFC PATCH 0/9] mtd: nand: add sunxi NAND
 Flash Controller support
From: Henrik =?ISO-8859-1?Q?Nordstr=F6m?= <henrik@henriknordstrom.net>
To: linux-sunxi@googlegroups.com
Date: Tue, 21 Jan 2014 19:13:31 +0100
In-Reply-To: <6de6ead1-e437-410b-91c0-74afb37dbf39@googlegroups.com>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
 <52D1494E.9090303@overkiz.com> <1389449230.19197.2.camel@localhost>
 <52D1541F.4040400@overkiz.com> <1389456075.20989.11.camel@localhost>
 <1389474709.22660.4.camel@localhost> <52D3ABB6.9030204@overkiz.com>
 <1389606496.29053.16.camel@localhost>
 <6de6ead1-e437-410b-91c0-74afb37dbf39@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dev@linux-sunxi.org, linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

lör 2014-01-18 klockan 05:46 -0800 skrev Boris BREZILLON:

> Do you know which mode are used (X ECC strength / 512 or 1024 bytes ?)
> and
> when they are are selected  (does it depend on the connected NAND
> chip ?) ?

It seems to blindly try some modes until something usable is found.
Varying both chip address size and ECC layout.

Sorry I do not have the exact details on the ECC modes used. Only
analyzed nand controller command traces of A13 BROM trying to load
boot0. The trace can be found at
https://github.com/hno/Allwinner-Info/blob/master/NAND/boot0/A13-brom

>  
>         
>         > - boot0 code is stored only on the first ECC block of each
>         page (1024 
>         > bytes + ecc bytes) 
>         
>         No, it reads a whole page at a time in sequental mode 
>         (data,ecc,data,ecc,data,ecc,data,ecc...).
> 
> 
> Are you sure ?
> This thread says that only the first 1024 bytes of data (+ 96 bytes of
> ECC) of each page are used:

yes I am sure. There was no page access commands between the sectors,
only linear read of data,ecc,data,ecc.

> I'm not a big fan of this approach, because the real media is an MTD
> (NAND) device,
> not a block device.

Hit implementation acks this by not providing a block device.


>         iirc there is an interface for dynamically selecting ECC mode
>         and other 
>         parameers. Or maybe that's only u-boot mtd?
> 
> 
> Haven't found anything authorizing per partiton ECC config, though
> this could be an
> enhancement of the MTD framework.

u-boot have user selectable ecc scheme for some boards. I.e. omap3 based
ones.

other boards select based on NAND size etc.
 
Regards
Henrik
