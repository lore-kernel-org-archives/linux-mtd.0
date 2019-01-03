Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gf9hN-0000YI-Dd
 for linux-mtd@lists.infradead.org; Thu, 03 Jan 2019 20:34:39 +0000
From: Richard Weinberger <richard@nod.at>
To: Ron Bowes <ron@skullsecurity.net>, linux-mtd@lists.infradead.org
Subject: Re: Having trouble with a UBI filesystem
Date: Thu, 03 Jan 2019 21:34:34 +0100
Message-ID: <7370989.dTfg6tCZom@blindfold>
In-Reply-To: <CANNa7-XkT=PnK4P6g_T1NCSRC+2v_kpU2hNJJY8dv+UB0ifEdQ@mail.gmail.com>
References: <CANNa7-XH1Qm8A5fzUM29pDsmLke4SP-+=PoJtumai8jv1nqFBg@mail.gmail.com>
 <CAFLxGvw2QXVJ29mwJt-1WMkpXBrq4fAgzJPS2BQi+ErPZFL1Lg@mail.gmail.com>
 <CANNa7-XkT=PnK4P6g_T1NCSRC+2v_kpU2hNJJY8dv+UB0ifEdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ron,

Am Donnerstag, 3. Januar 2019, 21:30:59 CET schrieb Ron Bowes:
> I tried using mtdram and ubiattach, but I couldn't get it to work
> right. It always complained that the data started at 0x1000 instead of
> 0x840, and I couldn't figure out why:

I suggest using nandsim, since this is a NAND image.

Find the id bytes if the NAND chip and pass them to nandsim, then use ubiattach.
It has a "-O" parameter to set the offset of the VID header yourself.
This is often needed when the sub-page configuration is different.
 
Thanks,
//richard
