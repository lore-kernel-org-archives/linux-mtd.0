Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TG4dM-0006rL-Vt
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2012 09:07:21 +0000
Received: by lbbgf7 with SMTP id gf7so6332700lbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 24 Sep 2012 02:07:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <505F1D72.6020306@gmail.com>
References: <1348401683-15698-1-git-send-email-hechtb@gmail.com>
 <1348401683-15698-2-git-send-email-hechtb@gmail.com>
 <505F1D72.6020306@gmail.com>
Date: Mon, 24 Sep 2012 11:07:19 +0200
Message-ID: <CABYn4szm3rjHYc=U3=jU4NNVROS8pBQwOkpJLqrVH7mB+Dtq7g@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: sh_flctl: Use DMA for data fifo FLTDFIFO when
 available
From: Bastian Hecht <hechtb@googlemail.com>
To: Vikram Narayanan <vikram186@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/9/23 Vikram Narayanan <vikram186@gmail.com>:
> On 9/23/2012 5:31 PM, Bastian Hecht wrote:
>>
>> Map and unmap DMA buffers, trigger the DMA and wait for the completion.
>> On failure we fallback to PIO mode.
>>
>>
>> +static void flctl_release_dma(struct sh_flctl *flctl);
>
>
> I don't think the above statement is required.
>
> ~Vikram

I've grouped things a bit thematically but you are right, I don't win
much (if anything at all) so I've reordered it in the v2 series.

Thanks,

 Bastian
