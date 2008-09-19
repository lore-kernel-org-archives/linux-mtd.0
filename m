Received: from hs-out-0708.google.com ([64.233.178.245])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KghLM-0001AD-UG
	for linux-mtd@lists.infradead.org; Fri, 19 Sep 2008 14:52:25 +0000
Received: by hs-out-0708.google.com with SMTP id k27so114106hsc.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Sep 2008 07:52:24 -0700 (PDT)
Message-ID: <e8775dd00809190752t45f211cl83ea425671a460b@mail.gmail.com>
Date: Fri, 19 Sep 2008 22:52:24 +0800
From: "Jason Liu" <liu.h.jason@gmail.com>
To: "Ricard Wanderlof" <ricard.wanderlof@axis.com>
Subject: Re: Problem with Hynix HY27UF081G2A 1Gb NAND flash?
In-Reply-To: <Pine.LNX.4.64.0809191409210.29177@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <Pine.LNX.4.64.0809191409210.29177@lnxricardw.se.axis.com>
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

please send reset command(0xFF) to nand flash first then read id.

2008/9/19 Ricard Wanderlof <ricard.wanderlof@axis.com>:
>
> I'm testing the above mentioned NAND flash chip in a design which has
> previously used the corresponding 1Gb parts from Samsung and Numonyx (ST)
> without problems. However, with the Hynix chip, mtd won't even read the I=
D
> code, it's just as if the chip wasn't there (it fails with
>
> nand_get_flash_type: second ID read did not match 01,ec against ec,7a .
>
> Before deciding on a course of action, I was wondering if anyone else has
> had a similar problem. I've skimmed through the data sheet and cannot fin=
d
> anything that is obviously different (save for the manufacturer's ID code
> which is expected of course).
>
> Kernel version is 2.6.26.
>
> /Ricard
> --
> Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30
>    "With Free Software you are employing the best programmers on the plan=
et"
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
