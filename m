Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NPkJt-0000NO-EX
	for linux-mtd@lists.infradead.org; Tue, 29 Dec 2009 22:13:41 +0000
Received: by ewy21 with SMTP id 21so3048767ewy.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Dec 2009 14:13:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4B3A725F.4050200@lambsys.com>
References: <dbdb2ea60912220614r656df531sae2be73e8f7f8163@mail.gmail.com>
	<dbdb2ea60912290626mc9a8ca4h48adf7bb1cfe815d@mail.gmail.com>
	<4B3A725F.4050200@lambsys.com>
Date: Tue, 29 Dec 2009 17:13:35 -0500
Message-ID: <dbdb2ea60912291413n2c05781du4bf0aaaa822261d0@mail.gmail.com>
Subject: Re: ubiattach taking very long time
From: twebb <taliaferro62@gmail.com>
To: David Lambert <dave@lambsys.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I got the following advice for a similar problem. I found I had debugging
> turned on.
>
> "Is your NAND slow? Have you configured UBI debugging checks turned on?
>
> Please, measure your nand throughput withmtd_speedtest:
>
> http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests
>

Thanks for the input.

I don't have any debugging turned on, but I'll try the speedtest.  It
doesn't appear to be a standard mtd-util; where can I find it?  And
any idea how I'll determine from the results that the nand throughput
is the problem?  i.e. what is considered acceptable or not?

twebb
