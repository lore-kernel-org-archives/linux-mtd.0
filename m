Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OYgci-0005JS-Pw
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 14:38:20 +0000
Subject: Re: ubifs : corruption after power cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4C3C56D1.7060201@parrot.com>
References: <4C346D5B.2000609@parrot.com>
	<1279019274.31639.39.camel@localhost>  <4C3C56D1.7060201@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jul 2010 17:33:05 +0300
Message-ID: <1279031585.31639.95.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-13 at 14:06 +0200, Matthieu CASTET wrote:
> > You also wan this (new) patch I think:
> > http://git.infradead.org/ubifs-2.6.git/commit/6fb4374f6b1b3932f3acfe9d353568d3d8599cad
> > 
> Yes I managed to trigger this case :)
> I also taken 
> http://git.infradead.org/ubifs-2.6.git/commitdiff/276de5d2a18bcdc69e6d48a4d96afc14cfef9dcb

But this is a good lesson for me - it does not matter how much you test,
other people will find bugs. I mean, the recovery is something we really
tested a lot. There is even debugging mode which emulates various
failures, we used that as well as random power cuts while running stress
tests.

Nevermind, just a though which crossed my mind :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
