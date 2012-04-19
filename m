Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKuYX-0006mJ-Tx
 for linux-mtd@lists.infradead.org; Thu, 19 Apr 2012 16:50:06 +0000
Message-ID: <4F904238.4070600@newsguy.com>
Date: Thu, 19 Apr 2012 09:50:00 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: computersforpeace@gmail.com
Subject: Re: [PATCH 1/2] mtd: nand: add OOB argument to NAND {read, write}_page
 interfaces
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
 <1334615755-15418-2-git-send-email-computersforpeace@gmail.com>
 <4F8D20C4.9010607@parrot.com>
 <CAN8TOE8d8w6EQZkF8hgBqzgY-Q80gb=wSwUijFjt2sq+7mqC8g@mail.gmail.com>
In-Reply-To: <CAN8TOE8d8w6EQZkF8hgBqzgY-Q80gb=wSwUijFjt2sq+7mqC8g@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On 04/17/2012 08:44 PM, Brian Norris wrote:

> Now, in future revisions of this ASIC, it may be possible to access
> OOB via DMA as well, but even if this happens, it doesn't make a lot
> of sense on this hardware to *always* pull OOB data. 


No, it doesn't.  In fact, I'm not aware of any code within or on top of mtd that
does anything with the oob data when a page is read.  If oob is needed,
mtd_read_oob() is used.  Coincidentally, I recxently discovered that my docg4
driver is technically broken because I don't fill the chip->oob_poi buffer when
I read a page, but it never caused a problem with UBI/ubifs.  And the mtdutils
are fine because mtdchar requires use of an ioctl for oob access, and the
handler for this ioctl uses mtd_read_oob().


> As mentioned
> previously, most normal applications (i.e., UBI(FS)) don't need to
> access this OOB data at all, so it seems silly to go to extra work to
> have the DMA controller return it to the MTD/NAND layers. I'm not
> familiar with the OOB/ECC schemes on enough other hardware to
> determine whether other drivers could make use of this same
> optimization. It would require hardware with internal buffers for
> error correction and an access mode that easily returns page data
> only...


The Freescale nand controllers might fall into this category.  Hardware handles
error detction *and* correction, so there's no need to read the oob at all if
it's not needed.  And fsl_ifc_nand was just mainlined, BTW.

Thanks,
Mike
