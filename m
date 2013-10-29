Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbSNL-0001kn-AJ
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 09:47:44 +0000
From: Marek Vasut <marex@denx.de>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCH] drivers: mtd: m25p80: Add quad read support.
Date: Tue, 29 Oct 2013 19:24:27 +0100
References: <1382693145-15750-1-git-send-email-sourav.poddar@ti.com>
 <201310291808.58939.marex@denx.de> <526FEC7D.6060403@ti.com>
In-Reply-To: <526FEC7D.6060403@ti.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201310291924.28110.marex@denx.de>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org, balbi@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Sourav Poddar,

[...]

> >>> This way, you can check if the SPI read failed and if so, handle it in
> >>> some way. The return value would only be valid if this function
> >>> returned 0.
> >> 
> >> I got this, but do you think its necessary to have two checks for
> >> verifying whether read passed. ?
> > 
> > Yes of course it is necessary, how else would you be able to tell if the
> > value is valid ? Sure, you can depend on negative integer here and on
> > the fact that the u8 will never be 32-bits wide (to produce a negative
> > integer when the return value is valid), but personally I think this is
> > error-prone as hell.
> > 
> >> If I go by your code above, after returning from above,
> >> check for return value for successful read
> >> and then check the respective bit set(SR_*). ?
> > 
> > Yes, you will be checking the bit in SR only if you are sure the value is
> > valid.
> 
> hmm..alrite I will do the cleanup and send v2.

Brian, does this make sense? I'd hate to misguide someone.

Best regards,
Marek Vasut
