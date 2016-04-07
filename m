Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aoFK4-0000JJ-Gw
 for linux-mtd@lists.infradead.org; Thu, 07 Apr 2016 19:10:33 +0000
Received: by mail-wm0-x241.google.com with SMTP id y144so6784304wmd.0
 for <linux-mtd@lists.infradead.org>; Thu, 07 Apr 2016 12:10:11 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: m25p80: consider max_transfer_size when reading
To: Brian Norris <computersforpeace@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>
References: <56D22823.7090005@gmail.com> <20160405193952.GA5243@localhost>
 <57041B43.2000109@gmail.com> <20160405210727.GB5243@localhost>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut <marex@denx.de>,
 Han Xu <han.xu@nxp.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <5706B084.2070909@gmail.com>
Date: Thu, 7 Apr 2016 21:09:56 +0200
MIME-Version: 1.0
In-Reply-To: <20160405210727.GB5243@localhost>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 05.04.2016 um 23:07 schrieb Brian Norris:
> On Tue, Apr 05, 2016 at 10:08:35PM +0200, Heiner Kallweit wrote:
>> Am 05.04.2016 um 21:39 schrieb Brian Norris:
>>> On Sat, Feb 27, 2016 at 11:50:11PM +0100, Heiner Kallweit wrote:
>>>> Some controllers have transfer size limits. To allow to deal with this
>>>> max_transfer_size was introduced in the SPI core recently.
>>>> Use this new feature to read in chunks if needed.
>>>>
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>
>>> Michal has been working on a similar series, with some differences (I'll
>>> comment below). I think his latest work is here:
>>>
>>> http://lists.infradead.org/pipermail/linux-mtd/2015-December/063865.html
>>>
>>> Is there a particular reason you've continued on your series instead of
>>> reviewing/fixing his?
>>>
>> Latest version of Michal's patch set was sent beginning of December and has
>> received no comment since then, so I assumed it's dead.
>> If that's not the case, totally fine with me and I'll have a further look at it.
> 
> There was a comment about the loop bounds changing away from page
> alignment. I think otherwise it's about ready to go.
> 
I had a closer look at Michal's patch set, few remarks:

Patch 2 changes the semantics of the return value of m25p80_read/write and the
related change to spi_nor_read/write is part of patch 4.
Means if the first patches are applied only we get a faulty behavior.
Usually this is undesirable, not sure whether it's acceptable here.

Patch 2
+	ret = m.actual_length - cmd_sz;
+	if (ret < 0)
+		return -EIO;
I think we should add special handling for the case ret == 0.
Usually this would indicate an error however there might be
intentional zero-length read's (not sure about that).
Therefore I'd propose to change the error condition to
if (ret < 0 || (!ret && len))
If zero-length reads are not possible we can simply change it to
if (ret <= 0)

Patch 7
W/o the proposed change to patch 2 the case that nor->read()
returns 0 isn't handled correctly.
We'd bail out from the read loop but return 0.
Instead we should return an error in this case.

With the change to patch 2 the case that nor->read() returns 0
can't happen and we should change the error condition to
if (ret < 0) for the sake of clarity.

Patch 8
Made it to mainline already, can be removed.

Patch 10
1. min_t isn't needed here because both arguments are of type size_t.
2. At least in the case of fsl-espi the size limit refers to one
   physical transfer (including the command) and therefore to the sum
   of all transfers.
We should change
+	t[1].len = min_t(size_t, len, spi_max_transfer_size(spi));
to
+	t[1].len = min(len, spi_max_transfer_size(spi) - t[0].len);

Apart from that the patch set looks good to me.

Heiner

> If you or Michal don't take a look at it, I'll rebase and resubmit it.
> 
> Brian
> 
