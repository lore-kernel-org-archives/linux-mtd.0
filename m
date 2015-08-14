Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQ3aB-0002b9-S5
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 01:14:56 +0000
Received: by pdbfa8 with SMTP id fa8so25301066pdb.1
 for <linux-mtd@lists.infradead.org>; Thu, 13 Aug 2015 18:14:34 -0700 (PDT)
Date: Thu, 13 Aug 2015 18:14:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Antony Pavlov <antonynpavlov@gmail.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V3] mtd: spi-nor: add Spansion S25FL204K support
Message-ID: <20150814011431.GL60523@google.com>
References: <1434443824-27077-1-git-send-email-antonynpavlov@gmail.com>
 <CACna6rz2XAEBXYuZ_xqnsSN4vrjvAFqUTaLC2mCfj4QCfMrA0w@mail.gmail.com>
 <20150723094757.e08d4cbf7cf0db060ba8c6f0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150723094757.e08d4cbf7cf0db060ba8c6f0@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 23, 2015 at 09:47:57AM +0300, Antony Pavlov wrote:
> On Tue, 16 Jun 2015 10:49:36 +0200
> Rafał Miłecki <zajec5@gmail.com> wrote:
> 
> > On 16 June 2015 at 10:37, Antony Pavlov <antonynpavlov@gmail.com> wrote:
> > > Spansion S25FL204K is a 4-Mbit 3.0V Serial Flash Memory
> > > with Uniform 4 kB Sectors.
> > >
> > > Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> > 
> > Acked-by: Rafał Miłecki <zajec5@gmail.com>
> > 
> > Thanks Antony!
> 
> Hmmm... I can't find this patch (https://patchwork.ozlabs.org/patch/484846/) in l2-mtd.git.

"Acked" does not mean "applied"; it was never applied, as my backlog is
large.

Applied now to l2-mtd.git, with Rafal's ack.

BTW, it looks like this device supports dual mode (but not quad), so it
might be nice to get the SPI_NOR_DUAL_READ flag added to it. If someone
acks it, I can add that on to the patch.

Thanks,
Brian
