Received: from mail-yh0-x229.google.com ([2607:f8b0:4002:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtpGL-0003Kh-4H
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 01:52:25 +0000
Received: by mail-yh0-f41.google.com with SMTP id f11so508397yha.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2013 17:52:02 -0800 (PST)
Date: Thu, 19 Dec 2013 17:50:31 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: tests: oobtest: fix test failures for oobsize which
 are not multiples of 4
Message-ID: <20131220015031.GA18175@norris-Latitude-E6410>
References: <1382947607-27077-1-git-send-email-george.cherian@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA57EE5@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA57EE5@DBDE04.ent.ti.com>
Cc: "Cherian, George" <george.cherian@ti.com>,
 "Mike Frysinger \(vapier@gentoo.org\)" <vapier@gentoo.org>,
 Akinobu Mita <akinobu.mita@gmail.com>, "Balbi, Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Stefan Roese <sr@denx.de> \(sr@denx.de\)" <sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Akinobu

On Thu, Dec 19, 2013 at 11:20:20AM +0000, Pekon Gupta wrote:
> >From: 'George Cherian <george.cherian@ti.com>'
> >Date: Monday, October 28, 2013 1:37 PM
> >Subject: [PATCH] mtd: tests: oobtest: fix test failures for oobsize which are not multiples of 4
> >
> >If oobsize is not multiple of 4 then the generated data to write to flash
> >and data generated to verify are not same. This imapcts test cases 2,3 and 5.
> >If mtd->ecclayout->oobavail is not a multiple of 4 then while generating psuedo
> >random numbers to write to flash prandom_bytes_state () generates the extra
> >random bytes which wont be done if we do for the whole length. So check
> >for mtd->ecclayout->oobavail if its multiple of 4 then generate for full len
> >(mtd->ecclayout->oobavail * pgcnt)
> >else generate prandom of mtd->ecclayout->oobavail bytes pgcnt times.
> >
> >Signed-off-by: George Cherian <george.cherian@ti.com>
...
> 
> I think this patch never saw the linux-mtd list. so just fwding ..

I cannot apply or review this patch as-is. Please resend it as a
standard inline patch.

That being said, from a first glance, I doubt this patch is correct.
I'll take a look if I get a proper patch.

Brian
