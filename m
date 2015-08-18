Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRVji-0002Vq-Q7
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 01:30:47 +0000
Received: by pabyb7 with SMTP id yb7so120189829pab.0
 for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2015 18:30:25 -0700 (PDT)
Date: Mon, 17 Aug 2015 18:30:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jonas Gorski <jogo@openwrt.org>
Cc: Zhiqiang Hou <B48286@freescale.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Mingkai.Hu@freescale.com,
 Rafa?? Mi??ecki <zajec5@gmail.com>, mike@steroidmicros.com
Subject: Re: [PATCH V6] mtd: m25p80: Modify the name of mtd_info
Message-ID: <20150818013019.GB17499@localhost>
References: <1439785625-36183-1-git-send-email-B48286@freescale.com>
 <CAOiHx=mFoke2sTQGsjyNF+k8DFq4GAt9AgU8ednxn5Kx4R7SNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOiHx=mFoke2sTQGsjyNF+k8DFq4GAt9AgU8ednxn5Kx4R7SNw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 17, 2015 at 06:27:36PM +0200, Jonas Gorski wrote:
> On Mon, Aug 17, 2015 at 6:27 AM, Zhiqiang Hou <B48286@freescale.com> wrote:
> > From: Hou Zhiqiang <B48286@freescale.com>
> >
> > Set the mtd_info's name to a fixed one, so spi flash layouts can
> > be specified by "mtdparts=..." in kernel cmdline, because the
> > cmdlinepart's parser will match the name of mtd_info with the name
> > given in cmdline.
> >
> > So far, if DT is used, the mtd_info's name will be set to the name
> > of spi->dev. It includes spi_master->bus_num, and the bus_num may
> > be dynamically allocated. So, replace the component bus_num with
> > the physical address of spi controller.
> 
> You can easily enforce fixed bus numers in linux using aliases in the
> DT, this is supported
> by the spi core since v3.9 or so.

Interesting. Thanks for the suggestion. I haven't verified it myself,
but if this is a workable solution, then I'd much prefer that to
fiddling with the name here. So, tentative NAK.

> Also won't this change break it for everyone relying on the old naming
> in their commandline mtdparts?

Yes, and that's been my comment on the first several versions. I didn't
have time to bother repeating it on these latter revisions.

Brian
