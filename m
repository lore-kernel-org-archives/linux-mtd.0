Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2cKb-0006uj-OD
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 07:53:10 +0000
Received: by mail-pd0-f175.google.com with SMTP id r10so3080186pdi.6
 for <linux-mtd@lists.infradead.org>; Sun, 12 Jan 2014 23:52:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20140113065914.GA26113@shlinux2.ap.freescale.net>
References: <1389581697-28309-1-git-send-email-b32955@freescale.com>
 <CAGWqfiiRtRoT_qE4SjrkMDspxEWePRbX9krZxXM-TtVSxuhSLg@mail.gmail.com>
 <20140113065914.GA26113@shlinux2.ap.freescale.net>
Date: Mon, 13 Jan 2014 08:52:48 +0100
Message-ID: <CAGWqfiiZMaH1i9aTLQpqjMFnnXqi0xHoFquOLjZ_FNNYkg_AhA@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: gpmi: fix the bitflips for erased page
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Vikram.Narayanan@in.bosch.com, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, bpringlemeir@nbsps.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 13, 2014 at 7:59 AM, Huang Shijie <b32955@freescale.com> wrote:
> On Mon, Jan 13, 2014 at 08:20:24AM +0100, Elie De Brauwer wrote:
>> On Mon, Jan 13, 2014 at 3:54 AM, Huang Shijie <b32955@freescale.com> wrote:
>> > +       /* Read out the page without ECC enabled, and check it again */
>> > +       chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
>> > +       chip->read_buf(mtd, (uint8_t *)buf, mtd->writesize);
>> > +
>> > +       /* Count the bitflips for the no ECC buffer */
>> > +       for (i = 0; i < mtd->writesize / 8; i++)
>> > +               flip_bits_noecc += hweight64(~buf[i]);
>>
>> Is it safe to assume that all these chunks will be 8-byte-aligned ? I
>> also thought about this optimization but didn't find any indication
>> that this might be safe.
>
> Firstly the page size is 8-tyte-aligned. do you meet a nand which is not
> 8-byte-aligned?

My bad, I missed the point that you're dealing with entire pages/chunks now
while I'm still used to thinking into the data chunks.

>
> Secondely, even the page size is not 8-byte-aligned, it is okay too.
> why? the gpmi will split the nand layout as:
>     +---+----------+-+----------+-+----------+-+----------+-+-----+
>     | M |   data   |E|   data   |E|   data   |E|   data   |E|     |
>     +---+----------+-+----------+-+----------+-+----------+-+-----+
>
>     E stands for the ECC parity area.
>
> For the page contains the all 0xff data, the "E" is not 0xff, and
> we can get the enough bitflips from only one "E" area.
>
>
>>
>> > +
>> > +       if (flip_bits_noecc <= threshold) {
>> > +               /* Tell the upper layer the bitflips we corrected. */
>> > +               *max_bitflips = max_t(unsigned int, *max_bitflips, flip_bits);
>> > +
>> > +               /*
>> > +                * The geo->payload_size maybe not equal to the page size
>> > +                * when the Subpage-Read is enabled.
>> > +                */
>> > +               memset(data, 0xff, geo->payload_size);
>> > +               ret = true;
>> > +       }
>> > +       dev_dbg(this->dev, "The page(%d) %s an erased page(%d,%d,%d,%d).\n",
>> > +                       page, ret ? "is" : "isn't", chunk, threshold,
>> > +                       flip_bits, flip_bits_noecc);
>> > +       return ret;
>> > +}
>> > +
>> >  static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>> >                                 uint8_t *buf, int oob_required, int page)
>> >  {
>> > @@ -1007,6 +1057,10 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>> >                         continue;
>> >
>> >                 if (*status == STATUS_UNCORRECTABLE) {
>> > +                       if (gpmi_erased_check(this, payload_virt, i,
>> > +                                               page, &max_bitflips))
>> > +                               break;
>> > +
>> >                         mtd->ecc_stats.failed++;
>> >                         continue;
>> >                 }
>> > --
>> > 1.7.2.rc3
>> >
>>
>> A second note, you patch v2 is a lie, there in the v1->v2 you mention
>> you return the number of bitflips to the upper layer, however your
>> code was not modified accordingly, gpmi_erase_check still does not
>> return the number of bitflips. Unless I'm missing something there too.
> I added a new argument @max_bitflips for gpmi_erased_check which will
> return the number of bitflips.

True, but if you look just  below your patch you see that
mtd->ecc_stats.correct will not
get properly updated. It normally gets updated with the number of
bitflips reported
through the status. (Well to be honest the entire switching between chunks and
pages confused me a lot on this monday morning, it could be me but when
iterating over chunks, switching to pages and breaking out of the for
loop isn't
something I would consider very clean, I think some more elaborate comment
on the erased check might help.).

                      mtd->ecc_stats.failed++;
                      continue;
               }
               mtd->ecc_stats.corrected += *status;             //
<<<---- ecc stats get upgrade here.
               max_bitflips = max_t(unsigned int, max_bitflips, *status);
       }



-- 
Elie De Brauwer
