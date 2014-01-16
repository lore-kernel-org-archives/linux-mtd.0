Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3hEv-0006cs-N0
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2014 07:19:46 +0000
Message-ID: <1389856759.26808.52.camel@sauron.fi.intel.com>
Subject: Re: UBIFS seeing corrupt blank pages when image flashed via u-boot
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Thu, 16 Jan 2014 09:19:19 +0200
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA620BD@DBDE04.ent.ti.com>
References: <20980858CB6D3A4BAE95CA194937D5E73EA5DBFA@DBDE04.ent.ti.com>
 <1388753970.25123.124.camel@sauron.fi.intel.com>
 <CAEhpT-W-aBkackmUb860vex2LxGzkBQ6hu1KGvUzjmTWTeQgxg@mail.gmail.com>
 <1389617894.2259.270.camel@sauron.fi.intel.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA61199@DBDE04.ent.ti.com>
 <1389625608.2259.357.camel@sauron.fi.intel.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA620BD@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "Stefan Roese <sr@denx.de> \(sr@denx.de\)" <sr@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Calvin Johnson <linux.cj@gmail.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-01-15 at 21:29 +0000, Gupta, Pekon wrote:
> Hi Artem,
> 
> >From: Artem Bityutskiy [mailto:artem.bityutskiy@linux.intel.com]
> <snip>
> >Conclusion: all UBIFS needs is a way to ask the driver - is this NAND
> >page blank or not? UBIFS does not really has to compare to all 0xFFs.
> >
> Thanks for details. Yes, I understand the concept in general that you
> want to recover last bit of user-data written on NAND (without corruption).
> 
> Now, as NAND driver itself does differentiation between and erased-page
> v/s programmed-page. Can we use different error codes to pass this
> information to upper layers like;

I thought the ECC is something which could be used to differentiate.


> *For MTD layer*
> 0: data valid, length of data is determined by 'read_len'  (currently)
> -EUCLEAN: correctable bit-flips found, data is valid
> -EBADMSG: un-correctable bit-flips, data *may-be* invalid.
> -ENODATA: detected erased-page. *Actual* data determined by read_len.
> -ENOMSG:  detected erased-page with bit-flips. *Actual* data determined by read_len.

Not sure this is a good idea. If NAND driver cannot do the
differentiation, then it should not be done by the MTD layer, I think.

Then just improve UBI and UBIFS and make the function which compares
buffers with all 0xFFs allow for bit-flips. We know the maximum possible
bit-flips per min. I/O unit, right? Just allow for that amount.

-- 
Best Regards,
Artem Bityutskiy
