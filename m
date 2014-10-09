Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XcGov-0006d6-R2
 for linux-mtd@lists.infradead.org; Thu, 09 Oct 2014 16:44:07 +0000
Message-ID: <5436BB39.8030907@nod.at>
Date: Thu, 09 Oct 2014 18:43:37 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Wei Wang <wangw8210@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: Questions about MTD + flash file system
References: <CAF-d49R64tbzk_2QnX3uwMc2LnpyzKmdfmY2D4P1=r+_DMi0fg@mail.gmail.com>
In-Reply-To: <CAF-d49R64tbzk_2QnX3uwMc2LnpyzKmdfmY2D4P1=r+_DMi0fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dedeking1@gmail.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 09.10.2014 18:40, schrieb Wei Wang:
> Hi all,
> 
> I have a question about the MTD device for embedded applications. As typically designers are more likely to use an eMMC or block interface-based flash devices + a block-oriented
> file system for the storage system on an embedded system, what's the typical use case for the MTD + flash file system? What's the advantage of the later one against eMMC +
> block-oriented file system?
> 
> If an eMMC becomes more powerful, is there any merits that is provided by using an raw flash device + flash file system?

Power cut resistance.

Thanks,
//richard
