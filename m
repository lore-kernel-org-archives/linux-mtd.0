MIME-Version: 1.0
In-Reply-To: <20130704191216.GK27646@sirena.org.uk>
References: <CAHSAbzPNDSr_6N79fh0DTWSEg8buRRPyiw8SPodtKLPjzWXJsg@mail.gmail.com>
 <20130704143645.GA27646@sirena.org.uk>
 <20130704180656.GA1974@sig21.net>
 <20130704191216.GK27646@sirena.org.uk>
Date: Fri, 5 Jul 2013 17:41:57 +0800
Message-ID: <CAHSAbzNBkZPFOfGHqFxZH_id=PFj=BmZ4Q302zGKeM-0yJBtHg@mail.gmail.com>
Subject: Re: SPI: DUAL/QUAD support
From: yuhang wang <wangyuhang2014@gmail.com>
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Grant Likely <grant.likely@secretlab.ca>,
 spi-devel-general@lists.sourceforge.net, Johannes Stezenbach <js@sig21.net>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> Flash data sheets use the terms Dual and Quad I/O Mode,
>> e.g. for MX25L25635E
>> http://www.macronix.com/QuickPlace/hq/PageLibrary4825740B00298A3B.nsf/h_Index/6F878CF760C559BD482576E00022E6CC/?OpenDocument&EPN=MX25L25635E
>
> OK, but this is not a flash specific feature but rather something at the
> SPI level and even with flash are they typically written in all caps?
> This really needs to be described at the SPI level for the SPI subsystem,
> not in terms of the specific application.
>

Yes. I agree with you. This should be described in SPI level.
So to SPI controller, if it has the ability to transfer in 2x or 4x, but
what a pity no device can tell this info to it. No matter what the slave
is and no matter whether they will use the spi transfer width member,
firstly SPI controller should provide these members. If the slave do
not set the member, that means the slave wants to communicate
in 1 line traditionally.
