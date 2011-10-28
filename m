Received: from eu1sys200aog101.obsmtp.com ([207.126.144.111])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RJkNQ-0004fF-Gy
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2011 11:13:34 +0000
Message-ID: <4EAA8E51.301@st.com>
Date: Fri, 28 Oct 2011 12:13:21 +0100
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [RFC] Change ECC algorithm from userspace
References: <CAAwP0s059H3BGhYbYLux2gR6ZNb+sFDue676OM2Evz5cA2q6DA@mail.gmail.com>
	<0A40042D85E7C84DB443060EC44B3FD33254FA3BBC@dekaexchange07.deka.local>
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD33254FA3BBC@dekaexchange07.deka.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: martinez.javier@gmail.com, Angus CLARK <angus.clark@st.com>,
	aschmidt@dekaresearch.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Javier, Atlant,

NAND Flash, coupled with an appropriate ECC scheme, is every bit (excuse the
pun!) reliable as NOR Flash (which typically does not employ any ECC).

Many of the current SLC devices that recommend 4-bit ECC, also guarantee block
zero to be good with 1-bit ECC, allowing the part to be used with existing 1-bit
Hamming ECC boot-loaders.  However, this is only valid if your boot-code can fit
into 1 block.

We also faced a similar issue in the past, requiring different ECC schemes for
the boot code and for the remainder of the Flash.  Our approach was based on MTD
partitions - each partition could have different ECC scheme, with the respective
'nand_ecc_ctrl' structures swapped in and out as necessary.

However, as suggested by others, computing the ECC in software, and using raw
programming is much simpler!

Cheers,

Angus

On 10/28/2011 11:43 AM, Atlant Schmidt wrote:
> Javier:
> 
>   That's why most people boot from NOR Flash
>   where a 1-bit ECC is adequate.
> 
>   I don't see how you can possibly expect to
>   reliably, successfully boot from a NAND Flash
>   using just 1 bit ECC; you've either got to
>   change the boot loader to allow more ECC or
>   use more-reliable Flash hardware.
> 
>                             Atlant
> 
> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Javier Martinez Canillas
> Sent: Friday, October 28, 2011 05:43
> To: linux-mtd@lists.infradead.org; linux-omap@vger.kernel.org
> Cc: Enric Balletbo i Serra
> Subject: [RFC] Change ECC algorithm from userspace
> 
> Hello,
> 
> We've a custom board using an ARM OMAP DM3730 whose ROM boot loader
> only supports 1-bit ECC correction using Hamming algorithm.
> 
> So, in order to be able to boot from the NAND, we have to configure
> the GPMC (OMAP's memory controller that interfaces with NAND devices)
> to use 1-bit HW ECC and write the loader binary to the first NAND
> sector. That way the ROM boot will take this sector as valid and load
> the loader binary to RAM.
> 
> The problem is that the SLC NAND device that we are using has a
> minimum required ECC of 4-bit correction per each 512 bytes.
> 
> I want to be able to use 1-bit ECC for the first partition where I
> save the loader binary and has to be accessed by the ROM boot but use
> a 4-bit ECC for my rootfs partition.
> 
> Does anyone have this same issue?
> 
> What is the best approach to store data in a NAND device using
> different ECC techniques?
> 
> I've think of two approaches:
> 
> 1- Adding an ioctl to mtdchar (something like ECCSETBITS) to change
> the ECC technique used.
> 2- Use a platform data field to notify the omap2 nand driver that the
> ROM boot only supports 1-bit ECC. So it can use a 1-bit ECC to write
> and read the first 4 sectors but a 4-bit ECC for the rest.
> 
> Of course both approaches can only be used if the none of the nand
> memory partitions are mounted.
> 
> Thank you and best regards,
> 
> --
> Javier Martínez Canillas
> (+34) 682 39 81 69
> Barcelona, Spain
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
>  Click https://www.mailcontrol.com/sr/y76zW8+ioPrTndxI!oX7Ulvwl1GqFAPr!F7OwTKhhUGNVQ5EfYl!2UQwm7gCP9RqaL!eAyER2lwjp+mmMV7JIw==  to report this email as spam.
> 
> This e-mail and the information, including any attachments, it contains are intended to be a confidential communication only to the person or entity to whom it is addressed and may contain information that is privileged. If the reader of this message is not the intended recipient, you are hereby notified that any dissemination, distribution or copying of this communication is strictly prohibited. If you have received this communication in error, please immediately notify the sender and destroy the original message.
> 
> Thank you.
> 
> Please consider the environment before printing this email.
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
