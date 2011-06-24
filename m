Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaCTk-00023a-BO
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 19:55:49 +0000
Received: by bwf12 with SMTP id 12so234750bwf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 12:55:46 -0700 (PDT)
Subject: Re: bbt and bitflip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 24 Jun 2011 22:55:36 +0300
In-Reply-To: <BANLkTimwOp4uPfQ0udLDycor2MjotUxiHw@mail.gmail.com>
References: <4DB033E4.6030105@parrot.com> <4DB06693.5000100@parrot.com>
	<1303460103.2757.48.camel@localhost>
	<BANLkTimwOp4uPfQ0udLDycor2MjotUxiHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1308945343.13493.25.camel@koala>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-23 at 09:36 -0700, Brian Norris wrote:
> I am interested in Artem's comments on the robustness of flash-based
> BBT (here, and more recently on
> http://lists.infradead.org/pipermail/linux-mtd/2011-June/036557.html).
> I recently have moved to using flash-based BBT (in-band, actually),
> and it seemed like several NAND drivers use flash-based BBT as well.
> Is it really that un-trustworthy?

If you confirm that everything is great and robust when the on-flash BBT
gets corrupted - the NAND core for sure notices any corruptions and
falls-back to the traditional scanning method and restores the on-flash
BBT - then I apologize for saying that I do not trust it. Also, I do not
really know the details of this, so I may be completely wrong.

> "The bbt should be protected with CRC and if it gets corrupted we
> should re-scan the flash and re-create it."
> 
> Wouldn't CRC just be a lesser replacement for proper ECC protection?
> Or am I missing something?

I'd say ECC and CRC play different roles. ECC is about handling NAND
PITAs like read/write/erase disturb, and CRC is about noticing any
corruption and recover, instead of reporting inaccurate information up -
e.g., reporting a good block as bad.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
