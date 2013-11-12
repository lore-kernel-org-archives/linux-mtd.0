Received: from mail-vb0-x229.google.com ([2607:f8b0:400c:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vg5X3-0002G4-DX
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 04:24:54 +0000
Received: by mail-vb0-f41.google.com with SMTP id w8so4046875vbj.28
 for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2013 20:24:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAOMZO5BzXhrbDtkFMPmYPnQp+X2=gSEJGc+3U8H+QrGdgRgCxw@mail.gmail.com>
References: <1384189727-19563-1-git-send-email-festevam@gmail.com>
 <20131111182324.GE20061@ld-irv-0074.broadcom.com>
 <528196CF.9090404@freescale.com>
 <CAOMZO5BzXhrbDtkFMPmYPnQp+X2=gSEJGc+3U8H+QrGdgRgCxw@mail.gmail.com>
Date: Mon, 11 Nov 2013 20:24:32 -0800
Message-ID: <CAN8TOE9pSy_ZtNCTz6Rpfr+cxbEsbTsVCv4CMF5GOmWvpvPvKA@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Fix NULL pointer dereference
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 11, 2013 at 7:44 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Tue, Nov 12, 2013 at 12:47 AM, Huang Shijie <b32955@freescale.com> wrote:
>> 于 2013年11月12日 02:23, Brian Norris 写道:
>
>> For imx23, the work flow is like this:
>> [1] first check the fingerprint, if we can find it, we will return
>> immediately.
>> [2] if [1] failed, such as you erase all the partitions, the gpmi will call
>> mx23_write_transcription_stamp() to write the fingerprint.
>>
>> So the @chip->buffer is not only used by the
>> mx23_check_transcription_stamp(),
>> but _also_ used by the mx23_write_transcription_stamp() when the gpmi
>> can not find any
>> fingerprint in the NAND page.
>>
>>
>> That's why i use the NAND_OWN_BUFFERS, the buffer can be used by both
>> the mx23_check_transcription_stamp()
>> and mx23_write_transcription_stamp().
>
> Understood.
>
> What if we just allocate the 4-byte buffer once on probe?
>
> Like this:
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index a9830ff..647da1b 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
...
> @@ -1728,6 +1726,10 @@ static int gpmi_nand_probe(struct platform_device *pdev)
>          return -ENOMEM;
>      }
>
> +    this->buffer = devm_kzalloc(&pdev->dev, strlen(fingerprint), GFP_KERNEL);
> +    if (!this->buffer)
> +        return -ENOMEM;
> +
>      platform_set_drvdata(pdev, this);
>      this->pdev  = pdev;
>      this->dev   = &pdev->dev;
...

As Huang noted, this approach is still very fragile. I think it's best
if we rework GPMI's init sequence so that we don't have to do these
kind of fragile dodges any more; just do all the BBT scanning after
nand_scan_tail(). Let's wait for Huang's version of my suggestion.

Brian
