Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dzkcs-0001io-6z
 for linux-mtd@lists.infradead.org; Wed, 04 Oct 2017 14:26:20 +0000
From: Richard Weinberger <richard@nod.at>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 "Mario J. Rugiero" <mrugiero@gmail.com>
Subject: Re: [PATCH 1/2] mtd: Make sure MTD objects always have a valid
 debugfs dir
Date: Wed, 04 Oct 2017 16:26:21 +0200
Message-ID: <16207457.a1XvOnd0Ms@blindfold>
In-Reply-To: <20171004155653.46a246b1@bbrezillon>
References: <20171004135239.16316-1-boris.brezillon@free-electrons.com>
 <20171004155342.32e096b8@bbrezillon> <20171004155653.46a246b1@bbrezillon>
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

Am Mittwoch, 4. Oktober 2017, 15:56:53 CEST schrieb Boris Brezillon:
> On Wed, 4 Oct 2017 15:53:42 +0200
> 
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> > On Wed,  4 Oct 2017 15:52:38 +0200
> > 
> > Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> > > Master MTD devices are not registered to MTD subsystem if they are
> > > exposing MTD partitions unless the CONFIG_MTD_PARTITIONED_MASTER option
> > > is enabled.
> > > 
> > > This lead to a weird situation where some MTD device drivers are trying
> > > to add debugfs files to the master MTD device, but this device has no
> > > valid debugfs directory.
> > > 
> > > Rework the core logic to do most of the MTD registration steps
> > > (including debugfs dir creation) except the registration to the device
> > > model, so that master devices are never exposed to the outside world
> > > but are still able to expose debugfs entries.
> > > 
> > > These devices will be exposed as mtd-hiddenX in the mtd debugfs dir.
> > > Note that X is unique within the hidden MTD device pool but can collide
> > > with ids of exposed MTD devs.
> > > 
> > > This commit fixes a bug introduced by commit e8e3edb95ce6 ("mtd: create
> > > per-device and module-scope debugfs entries") which is preventing
> > > nandsim from loading when CONFIG_DEBUG_FS is enabled.
> > > 
> > > Fixes: e8e3edb95ce6 ("mtd: create per-device and module-scope debugfs
> > > entries")> 
> > Oops, I forgot
> > 
> > Reported-by: Richard Weinberger <richard@nod.at>
> 
> and
> 
> Cc: <stable@vger.kernel.org>
> 
> :-/

Tested-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
