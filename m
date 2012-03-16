Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S8gOI-000681-Ua
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 23:16:59 +0000
Received: by yenm10 with SMTP id m10so5393808yen.36
 for <linux-mtd@lists.infradead.org>; Fri, 16 Mar 2012 16:16:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201203161505.03858.brian.foster@maxim-ic.com>
References: <201203161505.03858.brian.foster@maxim-ic.com>
Date: Fri, 16 Mar 2012 16:16:56 -0700
Message-ID: <CAN8TOE9FyJ8UJyx3hoaKcqYtie-BrmGJ3SwRgzVjgph=1tow6A@mail.gmail.com>
Subject: Re: how to support 4096+224 page size with plat_nand ?
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Foster <brian.foster@maxim-ic.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, timothy.stotts@transport.alstom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 16, 2012 at 7:05 AM, Brian Foster <brian.foster@maxim-ic.com> w=
rote:
> =A0We have also used 4K + 224 NAND (not sure if the
> =A0same part or not) with =91plat_nand=92 (and also with
> =A0our own driver which uses our chip's ECC engine),
> =A0in a v2.6.36-based Linux kernel. =A0(The kernel's
> =A0version _may_ be important, since I _think_ some
> =A0later kernels directly support 224 (and 218 and
> =A0maybe 256) OOB sizes; =A0and/or correctly detecting
> =A0the eraseblock size.)

Timothy's part is an ONFI-compliant device, and I think ONFI support
was added after 2.6.36.

> =A0We didn't bother using the full 224-byts of OOB,
> =A0but instaed are treating the device as having
> =A0only 128-bytes of OOB. =A0Works fine, albeit we
> =A0did have to add the part to the nand_flash_ids[]
> =A0table since the eraseblock size wasn't correctly
> =A0detected.

In recent kernels, you shouldn't have to modify anything for the
size/eraseblock/etc. to be *detected* properly since ONFI will find
it, but depending on the driver, the OOB size may not be supported.
For instance, since the plat_nand driver uses the nand_base layouts
(as you noticed), you need to at least supply *some* ECC layout that
is valid. Just make sure the ECC strength is high enough for your
device...

Brian
