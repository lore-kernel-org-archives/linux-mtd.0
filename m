Received: from as-smtp3.itc.alstom.com ([159.245.16.38] helo=itc.alstom.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S9dlg-0003OL-MU
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 14:41:06 +0000
From: STOTTS Timothy <timothy.stotts@transport.alstom.com>
To: Brian Norris <computersforpeace@gmail.com>, Brian Foster
 <brian.foster@maxim-ic.com>
Subject: RE: how to support 4096+224 page size with plat_nand ?
Date: Mon, 19 Mar 2012 14:40:51 +0000
Message-ID: <6E13A53B51111A48A6299DFACA193D4A8612FB@041-DB3MPN1-015.041d.mgd.msft.net>
References: <201203161505.03858.brian.foster@maxim-ic.com>
 <CAN8TOE9FyJ8UJyx3hoaKcqYtie-BrmGJ3SwRgzVjgph=1tow6A@mail.gmail.com>
In-Reply-To: <CAN8TOE9FyJ8UJyx3hoaKcqYtie-BrmGJ3SwRgzVjgph=1tow6A@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thank you Brian (Norris).

Yes, the chip appears to be correctly detected, including all metrics. I am=
 using kernel 3.0.8-ADI-2011R1.

How can I determine a valid ECC layout for OOB size of 224? A copy-and-past=
e of a layout found on the Internet resulted in the driver marking all bloc=
ks as "bad block" on the NAND Flash. (We have additional chips to work with=
.) My chip uses software ECC. Does it require BCH?

My datasheet does not specify ECC as number of OOB bytes per 4096 bytes, as=
 such, but rather as a number of bits per a smaller number of bytes. Does t=
hat matter?

Timothy

-----Original Message-----
From: Brian Norris [mailto:computersforpeace@gmail.com]
Sent: Friday, March 16, 2012 7:17 PM
To: Brian Foster
Cc: STOTTS Timothy; linux-mtd@lists.infradead.org
Subject: Re: how to support 4096+224 page size with plat_nand ?

On Fri, Mar 16, 2012 at 7:05 AM, Brian Foster <brian.foster@maxim-ic.com> w=
rote:
>  We have also used 4K + 224 NAND (not sure if the
>  same part or not) with 'plat_nand' (and also with
>  our own driver which uses our chip's ECC engine),
>  in a v2.6.36-based Linux kernel.  (The kernel's
>  version _may_ be important, since I _think_ some
>  later kernels directly support 224 (and 218 and
>  maybe 256) OOB sizes;  and/or correctly detecting
>  the eraseblock size.)

Timothy's part is an ONFI-compliant device, and I think ONFI support
was added after 2.6.36.

>  We didn't bother using the full 224-byts of OOB,
>  but instaed are treating the device as having
>  only 128-bytes of OOB.  Works fine, albeit we
>  did have to add the part to the nand_flash_ids[]
>  table since the eraseblock size wasn't correctly
>  detected.

In recent kernels, you shouldn't have to modify anything for the
size/eraseblock/etc. to be *detected* properly since ONFI will find
it, but depending on the driver, the OOB size may not be supported.
For instance, since the plat_nand driver uses the nand_base layouts
(as you noticed), you need to at least supply *some* ECC layout that
is valid. Just make sure the ECC strength is high enough for your
device...

Brian

________________________________
CONFIDENTIALITY : This e-mail and any attachments are confidential and may =
be privileged. If you are not a named recipient, please notify the sender i=
mmediately and do not disclose the contents to another person, use it for a=
ny purpose or store or copy the information in any medium.
