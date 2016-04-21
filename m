Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atCCX-0003fG-8C
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2016 10:51:13 +0000
Message-ID: <1461235849.5533.8.camel@gmail.com>
Subject: Re: how to view mapping between a given ubifs volume, its set of
 LEBs, and its corresponding set of PEBS
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Davis Roman <davis.roman84@gmail.com>, linux-mtd@lists.infradead.org
Date: Thu, 21 Apr 2016 13:50:49 +0300
In-Reply-To: <CACfi_Z1cX47-BVAfQkkoKXsdrjSHU0V95pCBAaSWHm0=T7TZJA@mail.gmail.com>
References: <CACfi_Z1cX47-BVAfQkkoKXsdrjSHU0V95pCBAaSWHm0=T7TZJA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2016-04-20 at 22:13 -0400, Davis Roman wrote:
> Hello all,
> 
> I'm trying to understand the mapping between a ubifs volume and the
> set of LEBs that get mapped to it.
> 
> More so, I'd like to also understand the mapping between a given LEB
> and its designated PEB.
> 
> Although the mapping between LEBs and PEBs can change during runtime,
> I figure that there should be a way to see this mapping via the
> command line.
> 
> Does such a method exist ?
> 
> I've looked high and low though the mtd tools and I haven't been able
> to find a way to do this.

Technically it is easy to create an ioctl returning this information.
You can just do it for your research purposes. But if you want this
upstream, you should also provide a plausible use-case for this kind of
ioctl.

Artem.
