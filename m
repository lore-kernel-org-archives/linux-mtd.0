Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1ba6G8-0000xD-Lv
 for linux-mtd@lists.infradead.org; Wed, 17 Aug 2016 19:12:17 +0000
Received: by mail-wm0-x243.google.com with SMTP id o80so168598wme.0
 for <linux-mtd@lists.infradead.org>; Wed, 17 Aug 2016 12:11:55 -0700 (PDT)
Subject: Re: [PATCH 1/3] spi: introduce max message size flag in spi_master
To: Mark Brown <broonie@kernel.org>
References: <6c95366c-7fcc-ef4c-033a-f9f6e152a669@gmail.com>
 <20160816164204.GV9347@sirena.org.uk>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <09d8a91d-8187-abdc-33d0-622208fdb251@gmail.com>
Date: Wed, 17 Aug 2016 20:51:12 +0200
MIME-Version: 1.0
In-Reply-To: <20160816164204.GV9347@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 16.08.2016 um 18:42 schrieb Mark Brown:
> On Sun, Aug 07, 2016 at 09:47:18PM +0200, Heiner Kallweit wrote:
> 
>> As there are no (known) spi controller with differing size limits for
>> transfer and message, introduce a flag in spi_master to indicate that
>> the max transfer size is also the maximum message size.
> 
> This is a *really* cumbersome interface which will doubtless be found to
> be broken at some point by some hardware that does have separate
> restrictons on both.  Let's just specify the limit directly unless
> there's some pressing reason not to.
> 
> There's also something off with the way you're posting the patches, your
> patch series isn't threaded together.  
> 
Thanks for the feedback. I'll address both points and send a v2.
