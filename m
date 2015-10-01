Received: from s159.web-hosting.com ([68.65.121.203])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhYyd-0004eF-DV
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2015 08:12:31 +0000
Received: from mail-la0-f43.google.com ([209.85.215.43]:33068)
 by server159.web-hosting.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.85) (envelope-from <jteki@openedev.com>) id 1ZhYyF-00276i-Fr
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2015 04:12:08 -0400
Received: by lahh2 with SMTP id h2so69905936lah.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Oct 2015 01:12:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150928231346.GN31505@google.com>
References: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
 <1441137435-52862-4-git-send-email-computersforpeace@gmail.com>
 <CAD6G_RTpucYCnbNxnTs1xionz4pYukAmvys6x45EjYc=n7PNFw@mail.gmail.com>
 <20150928004644.GD34421@google.com>
 <CAD6G_RQazifzcjDhUk8dWQUDz4yzxmxb+86nrypYv-m8e2QiKg@mail.gmail.com>
 <20150928231346.GN31505@google.com>
Date: Thu, 1 Oct 2015 13:42:05 +0530
Message-ID: <CAD6G_RS=rDtar07bUYMejiKCy0WtTE6PDr=M-MBoJT2-Xg7BiQ@mail.gmail.com>
Subject: Re: [PATCH 03/10] mtd: spi-nor: add SPI NOR manufacturer IDs
From: Jagan Teki <jteki@openedev.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29 September 2015 at 04:43, Brian Norris <computersforpeace@gmail.com> wrote:
> On Mon, Sep 28, 2015 at 02:42:24PM +0530, Jagan Teki wrote:
>> On 28 September 2015 at 06:16, Brian Norris <computersforpeace@gmail.com> wrote:
>> > The whole point of this patch is that some mfrs use different IDs for
>> > different classes of flash, so we shouldn't force our programming
>> > patterns into looking like CFI (i.e., parallel NOR [1]) when we're
>> > talking about serial NOR.
>> >
>> > If you'd rather, I can just copy the values into this header (e.g.,
>> > 0x01, 0x89, etc.) and completely remove all references to CFI.
>>
>> Understand your intention,
>
> Do you? It really doesn't seem like it.
>
>> but if what are the mfrs id's same then
>> it's better to use already defined CFI notation because we may get
>> into impression that the mfrs uses same id for CFI and SPINOR
>
> CFI is really unrelated, for the most part. Parallel and serial NOR
> evolved quite differently. Why would we want that impression, again?
>
> Really, is it that hard to understand why we'd want two separate MFR ID
> lists -- one for CFI and one for SPI NOR -- when it's quite clear that
> those lists are NOT the same? Why should you needlessly ask programmers
> to jump between using CFI_MFR_* and SNOR_MFR_* in the same framework?
> What if someone starts trying to use CFI_MFR_WINBOND (which is NOT
> correct for SPI NOR)? I'm trying *clarify* the ID namespace here, not
> convolute it...

You're correct if the MFR ID's were different in CFI and SPI-NOR, i'm
referring there are some mfr's have same id's for cfi and spi-nor like
atmel, intel, micron, macronix, sst, spansion, is true right?

For these mfr's I'm suggesting we may reuse the CFI's as it is, do you
see any concerns/issues for this?

>
>> (as cfi
>> and spinor are NOR complaint flash memories) - IMHO.
>
> That doesn't make any sense. "NOR" is not anything to be "compliant" to;
> it's a type of flash technology (i.e., electrical design).

--  Jagan.
