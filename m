Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHcCV-0005TJ-Ln
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 15:42:16 +0000
Message-ID: <514735D5.3010105@parrot.com>
Date: Mon, 18 Mar 2013 16:42:13 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: nand: subpage write support for hardware based ECC
 schemes
References: <1363352378-2825-1-git-send-email-pekon@ti.com>,
 <51431F08.7050103@parrot.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9A288C@DBDE01.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9A288C@DBDE01.ent.ti.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gupta, Pekon a écrit :
> Hi,
> 
>> On which controller was it tested ?
> 
> [Pekon]: I tested it on TI's omap controller itself :-)
> However I ran following, to confirm..
> (1) mtd_subpagetest: part of MTD tests
> (2) ubiattach & ubiformat of ubi image built with Volume Header at 512 offset
> that is using -O 512.
> (3) nand raw read / write with non-page aligned data.
> 
> Do you have any other tests in mind ?
> 
> 
>> The problem is that lot's of controller driver with hw ecc hack the ecc interface.
> 
>> For example the TI omap driver don't use the data pointer of ecc.calculate but
>> use the data send on the nand interface.
> 
> [Pekon]: Yes i agree. But what I see in TI's hack also that ECC is calculated for 
> each subpage separately. Its just that instead of using data in 
> chip->buffers->databuf
> TI's driver uses data which is present in controller's internal buffers, which 
> should be the way if we are depending on Hardware (controller) to do ECC.
> Is this something different from other Hardware based ECC implementations?
Yes for example some controller have ecc that for a 0xff page is not 0xff.
And this ecc is generated on the fly : you can't xor it before writing it to the
flash.

I know that omap driver with ELM error correction did not generated 0xff ecc for
a black page. I wonder if it works why your patch.


Matthieu
