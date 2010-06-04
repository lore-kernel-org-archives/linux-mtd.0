Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OKZbI-0003Sa-8n
	for linux-mtd@lists.infradead.org; Fri, 04 Jun 2010 16:18:29 +0000
Received: by bwz5 with SMTP id 5so432569bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 04 Jun 2010 09:18:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1275579127.9729.6.camel@localhost.localdomain>
References: <AANLkTilGg81TGnkS2VwF6xdFCvsB_AF_8rLYVqTr-81g@mail.gmail.com>
	<1275575118.9729.2.camel@localhost.localdomain>
	<AANLkTim4K_-kJc4x7mlgyXG3DPgcWUR5-nb46SEpn3pG@mail.gmail.com>
	<1275579127.9729.6.camel@localhost.localdomain>
Date: Fri, 4 Jun 2010 18:18:26 +0200
Message-ID: <AANLkTinzLo7e5sHOn7sFKRAZNZHWoi3TMMG-FslG-CVv@mail.gmail.com>
Subject: Re: CRC error when mounting UBIFS
From: Leo Barnes <barnes.leo@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

You were completely right that the errors were driver related. I
created a test that tested page-aligned/unaligned reads of different
lengths and then managed to spot the error in the driver. I will send
in the test once I have cleaned up the code a bit. Might be useful for
someone else.

A new question:
Background:
The driver in use in the device does all communication with the
NAND-chipset/controller via DMA. Some of the problems I had with the
driver was that UBI in some cases sends vmalloc'd buffers to the
mtd-driver for reading and writing which failed spectacularly (it
might have been kmalloc'd buffers that were not allocated with
GFP_DMA, I'm unsure if DMA would succeed in this case). Since I dont
know exactly how UBI manages it's memory buffers, my question might be
impossible to implement efficiently.

Question:
Would it be possible to make all buffers that are sent to mtd->read()
DMA-friendly?

Best regards,
//Leo

On Thu, Jun 3, 2010 at 5:32 PM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> On Thu, 2010-06-03 at 17:14 +0200, Leo Barnes wrote:
>> Hmm, ok. I would have thought the paranoid UBI checks would be able to
>> find driver related problems. I have however now tried creating and
>> mounting ubi/ubifs through nandsim on the device, so ubifs seems to be
>> working well.
>
> Well, with extra self-checks, UBI reads all it writes and verifies, but
> since all writes are aligned, all UBI reads are aligned too.
>
>> I have tried mtd_readtest on the driver which fails when I allow
>> OOB-reads. Since the driver handles ECC in hardware and I dont need to
>> read the OOB-data for the sake of UBI/UBIFS, this should be no
>> problem. When removing the oob-reads from the test, it works
>> perfectly.
>>
>> You are probably right that what fails is unaligned/short reads, since
>> this is exactly the functionality that I had to add to the driver.
>> Does any of the mtd-tests test these kinds of reads? Might be a good
>> addition if not.
>
> I do not remember, you'd need to look into the test. And of course
> patches are welcome.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
