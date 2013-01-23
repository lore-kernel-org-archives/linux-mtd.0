Received: from sting.hengli.com.au ([178.18.18.71] helo=fornost.hengli.com.au)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ty9fG-0008UO-Js
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2013 23:23:31 +0000
Date: Thu, 24 Jan 2013 10:23:16 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jan 23 (mtd/ubi and iio and crypto/crc32[c])
Message-ID: <20130123232316.GB25726@gondor.apana.org.au>
References: <20130123174336.47c0113740a14da7f6a92187@canb.auug.org.au>
 <51006DC9.30802@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51006DC9.30802@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 linux-mtd@lists.infradead.org, Jonathan Cameron <jic23@cam.ac.uk>,
 linux-crypto@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 23, 2013 at 03:10:01PM -0800, Randy Dunlap wrote:
> On 01/22/13 22:43, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20130122:
> > 
> 
> 
> on i386:
> 
> ERROR: "crc32_le" [drivers/mtd/ubi/ubi.ko] undefined!
> ERROR: "iio_triggered_buffer_setup" [drivers/iio/adc/max1363.ko] undefined!
> ERROR: "iio_triggered_buffer_cleanup" [drivers/iio/adc/max1363.ko] undefined!
> ERROR: "__crc32c_le" [crypto/crc32c.ko] undefined!
> ERROR: "crc32_le" [crypto/crc32.ko] undefined!

Weird.  You do have CONFIG_CRC32 selected, so did it compile
a lib/crc32.ko or not?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
