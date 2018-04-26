Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBa3X-0001wg-VK
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 06:07:03 +0000
Date: Thu, 26 Apr 2018 08:06:42 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Steve deRosier
 <derosier@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Tobi Wulff
 <Tobi.Wulff@alliedtelesis.co.nz>
Subject: Re: NAND timeout issues with blank chip and Marvell NFC
Message-ID: <20180426080642.7fc9b8ba@bbrezillon>
In-Reply-To: <d9eff05a579344d9a569e5bc0e1ec6bf@svr-chch-ex1.atlnz.lc>
References: <cf834bbf9ac14cfc8ad07e4921245f6f@svr-chch-ex1.atlnz.lc>
 <CALLGbRJOGq_3xtWRojPtjVSgnxt-GhwYKUvwEgQKLct=XtEjAw@mail.gmail.com>
 <20180424180837.398957ba@xps13>
 <72ff5349ac6e48a9ab74986947572108@svr-chch-ex1.atlnz.lc>
 <7cd09dc2689643e9a8e0751e1cba3e11@svr-chch-ex1.atlnz.lc>
 <d9eff05a579344d9a569e5bc0e1ec6bf@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Chris,

On Thu, 26 Apr 2018 05:16:57 +0000
Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> > 
> >    ret = marvell_nfc_wait_op(chip,
> >                              chip->data_interface.timings.sdr.tPROG_max);
> > 
> > Based on the datasheet that number is 600 microseconds(us) not the
> > milliseconds expected by marvell_nfc_wait_op().
> >   
> 
> So naturally throwing in some PSEC_TO_MSEC() calls stopped the really 
> long timeouts but then the probe would fail. It seems that I'm getting 
> some "page done" and "command done" interrupts indications (NDSR = 
> 0x0000500) while attempting to write the oob data.
> 
> I've also re-done some of my initial tests and it seems that 4.17-rc2 
> cannot mount this chip. The 4.16.4 kernel can.

Hm, I suspect 07ad5a721484 ("mtd: nand: add ->setup_data_interface()
support for Marvell NFCv1") to be the source of our problems.

Can you add the 'marvell,nand-keep-config' property to your nand node?
Looks like we'll need another way to extract the NFC version in case
old bindings are in use (maybe by parsing the compatible of the root
node).

Regards,

Boris
