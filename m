Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PnYRV-0005e1-78
	for linux-mtd@lists.infradead.org; Thu, 10 Feb 2011 15:28:26 +0000
Received: by eyd9 with SMTP id 9so726762eyd.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Feb 2011 07:28:23 -0800 (PST)
Subject: Re: [PATCH 2/2] mtd: cfi: fix writebufsize initialization
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <AANLkTi=Jtc7cUZ3puU_krmxm34P1LB605i8FE6Rti1jp@mail.gmail.com>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
	<1297350106-16383-3-git-send-email-agust@denx.de>
	<AANLkTi=Jtc7cUZ3puU_krmxm34P1LB605i8FE6Rti1jp@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Feb 2011 17:27:18 +0200
Message-ID: <1297351638.6563.20.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Anatolij Gustschin <agust@denx.de>, linux-mtd@lists.infradead.org,
	Detlev Zundel <dzu@denx.de>, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-02-10 at 16:13 +0100, Guillaume LECERF wrote:
> Hi Anatolij.
> 
> 2011/2/10 Anatolij Gustschin <agust@denx.de>:
> > When initializing mtd->writebufsize, we must take into account
> > possible flash chip interleaving. Wrong writebufsize initialization
> > caused UBIFS recovery issues resulting in unmountable UBIFS file
> > system on NOR flash partitions.
> > -       mtd->writebufsize = 1 << cfi->cfiq->MaxBufWriteSize;
> > +       mtd->writebufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
> 
> 
> This is exactly what I told you (
> http://lists.infradead.org/pipermail/linux-mtd/2010-December/033559.html
> ).

Hehe, indeed :-) Anatolij came to that hard way instead :-)))

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
