Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNOYc-00030d-NP
 for linux-mtd@lists.infradead.org; Mon, 28 May 2018 20:15:56 +0000
From: Richard Weinberger <richard@nod.at>
To: Mathieu Malaterre <malat@debian.org>
Cc: MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>,
 linux-mtd@lists.infradead.org, boris.brezillon@bootlin.com
Subject: Re: ubi: refuse attaching mtd3 - MLC NAND is not supported
Date: Mon, 28 May 2018 22:15:35 +0200
Message-ID: <9878779.9ArrsalhVU@blindfold>
In-Reply-To: <CA+7wUsx27-K+XFt0_TqzeAdpydQ8cr7rXbCa8S8tDhGonzO-kQ@mail.gmail.com>
References: <CA+7wUsy+2AWtty+Eow3kkw5Y9XdTZFnKHp05m46zuv9HPZngrA@mail.gmail.com>
 <2323678.8uickzfJaD@blindfold>
 <CA+7wUsx27-K+XFt0_TqzeAdpydQ8cr7rXbCa8S8tDhGonzO-kQ@mail.gmail.com>
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

Mathieu,

Am Freitag, 25. Mai 2018, 12:12:02 CEST schrieb Mathieu Malaterre:
> > No. MLC is simply not supported and not safe to use.
> > With that commit we reflect the state of the code and stop giving wrong promises.
> 
> ACK. Would you recommend an alternate filesystem then ?

There is none.

One option you have is putting the MLC NAND into SLC mode, some support this.
This needs to be achieved by a vendor specific command which is often undocumented.

Boris and I experimented also with software SLC mode in UBI.
If you want you can revive our work.
 
> > I can hardly believe that it has been working great so far, did you
> > ever do power-cut tests?
> > Or are there other mechanisms on your board that make MLC usable by UBI?
> > For example SLC-emulation.
> 
> Looking quickly at the tech specs:
> 
> https://www.elinux.org/CI20_Hardware#ROM.2FNAND
> 
> ...
> Is provided by a single Samsung K9GBG08UOA NAND flash, using an 8bit
> data interface to the SoC.
> ...
> 
> So my understanding is that "it just worked" so far. I've tried
> contacting some of the people involved with the design of CI20 to get
> confirmation.

"just worked" in terms of nobody gave it a decent testing, I fear. ;-\

Thanks,
//richard
