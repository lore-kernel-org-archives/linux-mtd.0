Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aSrNP-0001XP-5P
 for linux-mtd@lists.infradead.org; Mon, 08 Feb 2016 19:21:35 +0000
Received: by mail-pa0-x22b.google.com with SMTP id ho8so78050783pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 08 Feb 2016 11:21:14 -0800 (PST)
Date: Mon, 8 Feb 2016 11:21:11 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: brcmnand (iproc): bitflips and ECC errors due to ignored ECC
 config
Message-ID: <20160208192111.GA62607@google.com>
References: <CACna6rxZCkeCijReQDSr2Jc7m8q0J7qp=nhNgnkFFzk312wSdg@mail.gmail.com>
 <CACna6rz9ppFXqhh6=m7cnmQ58y=4w4X8f_DM_8Y0ePZ71BoL3g@mail.gmail.com>
 <CAC=U0a1vj1020X8BjvYGSOi7GrJCAad3A8wCeosuEo+7i4Rk3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC=U0a1vj1020X8BjvYGSOi7GrJCAad3A8wCeosuEo+7i4Rk3A@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 08, 2016 at 02:15:16PM -0500, Kamal Dasu wrote:
> When SECTOR_SIZE = 512B, SPARE_AREA_SIZE  = 16, ECC_LEVEL = 15 enables
> 1-bit Hamming ECC protection. So the ecc_level field is the SoC
> internal representation for 1-bit hamming. If you mean by "removing
> handling" you made strength=ecc_level=1, then you are now using 1-bit
> BCH.

It kinda sounds like Rafal is suggesting this product uses 1-bit BCH.
I didn't even remember such a thing existed on this controller.
Unfortunately, we don't really have a way to clearly differentiate 1-bit
Hamming and 1-bit BCH in DT, do we? Both could equally well be described
by:

	nand-ecc-strength = <1>;
	nand-ecc-step-size = <512>;

Maybe we need a custom BRCM property?

Brian
