Received: from longford.logfs.org ([213.229.74.203])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V76vH-0006sG-0k
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 16:49:20 +0000
Date: Wed, 7 Aug 2013 11:16:12 -0400
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jussi Kivilinna <jussi.kivilinna@iki.fi>
Subject: Re: [PATCH] alauda: do not use stack for URB transfer_buffers
Message-ID: <20130807151612.GA18545@logfs.org>
References: <20130806120329.8864.36301.stgit@localhost6.localdomain6>
 <20130806164913.GD10535@logfs.org> <5201E03D.30306@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5201E03D.30306@iki.fi>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-usb@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 7 August 2013 08:50:53 +0300, Jussi Kivilinna wrote:
> On 06.08.2013 19:49, Jörn Engel wrote:
> > On Tue, 6 August 2013 15:03:29 +0300, Jussi Kivilinna wrote:
> >>
> >> Patch fixes alauda not to use stack as URB transfer_buffer. URB buffers need to
> >> be DMA-able, which stack is not.
> >>
> >> Patch is only compile tested.
> > 
> > I have tested the driver back when I wrote it.  Not sure why it worked
> > then, maybe the chip in my notebook back then didn't care about
> > alignment or I just got lucky with the memory allocations.
> 
> You might not see problems with your hardware/architecture.
> 
> "Documentation/DMA-API-HOWTO.txt" discusses about "What memory is DMA'able?".

Makes sense.  I've read your patch over and it also makes sense.
Acked-by: Joern Engel <joern@logfs.org>

Jörn

--
It's just what we asked for, but not what we want!
-- anonymous
