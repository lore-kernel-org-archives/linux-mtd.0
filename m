Received: from fudo.makrotopia.org ([2001:41d0:8:c75d::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNc5L-0002Vy-2O
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 07:29:00 +0000
Date: Fri, 7 Aug 2015 09:28:25 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: shawn rose <shawn@ecoventsystems.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: Encrypting UBIFS Filesystem
Message-ID: <20150807072824.GA1972@makrotopia.org>
References: <CAKWcF8-LTkPQEjLR3gdiZ1ZLrmoZHqdo2tBkzZsnrxiVqK+oag@mail.gmail.com>
 <CAAEAJfC_iy=5GumEVJrY_V_7z2gTwXHwZHwzwt_YOzwn4sEsgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfC_iy=5GumEVJrY_V_7z2gTwXHwZHwzwt_YOzwn4sEsgg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!


On Fri, Aug 07, 2015 at 02:25:44AM -0300, Ezequiel Garcia wrote:
> Shawn,
> 
> On 6 August 2015 at 09:02, shawn rose <shawn@ecoventsystems.com> wrote:
> >
> > Anyone have experience, or know of people/company/contractors, that
> > have Encrypted UBIFS before?  If so, I'd like to be introduced.  I
> > have a IoT device which is currently using UBIFS and like to encrypt
> > the entire system.  I am looking for the lessons learned from those
> > who have done this before.
> >
> 
> You can use a regular block filesystem on top of UBI using the block
> interface (drivers/mtd/ubi/block.c), and then use standard encrypt stuff
> for block devices (dm-crypt for instance).
> 
> However, this has nothing to do with UBIFS, so maybe it's not an option for you.
> 
> If the filesystem you want to encrypt is read-only, then you may consider
> the UBI block option.

ecryptfs works fine on top of UBIFS.
Another option is having an encrypted disk-image as a file in UBIFS and
use cryptsetup with a loopback block device. However, this will most
likely not perform very well and I must admit that I never tried that.


Cheers


Daniel
