Received: from mail-gg0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SqeT2-0007lJ-SU
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 06:07:42 +0000
Received: by ggcs5 with SMTP id s5so5089202ggc.36
 for <linux-mtd@lists.infradead.org>; Sun, 15 Jul 2012 23:06:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120626163738.14201df3@pixies.home.jungo.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-8-git-send-email-computersforpeace@gmail.com>
 <20120626163738.14201df3@pixies.home.jungo.com>
Date: Sun, 15 Jul 2012 23:06:31 -0700
Message-ID: <CAN8TOE9GmFmsdOhJTVsBhaiU1VELcTA3UbgfyPkbSigbbM9FHQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] mtd: nand_bbt: use string library
From: Brian Norris <computersforpeace@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, Ivan Djelic <ivan.djelic@parrot.com>,
 linux-mtd@lists.infradead.org, Akinobu Mita <akinobu.mita@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add Ivan, as omap2.c is one of the only NAND_BBT_SCANEMPTY users.

On Tue, Jun 26, 2012 at 6:37 AM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> On Fri, 22 Jun 2012 16:35:44 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
>>  static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_descr *td)
>>  {
>> -     int i, end = 0;
>> +     int end = 0;
>>       uint8_t *p = buf;
>>
>>       if (td->options & NAND_BBT_NO_OOB)
>>               return check_pattern_no_oob(buf, td);
>>
>>       end = paglen + td->offs;
>> -     if (td->options & NAND_BBT_SCANEMPTY) {
>> -             for (i = 0; i < end; i++) {
>> -                     if (p[i] != 0xff)
>> -                             return -1;
>> -             }
>> -     }
>> +     if (td->options & NAND_BBT_SCANEMPTY)
>> +             if (memchr_inv(p, 0xff, end))
>> +                     return -1;
>>       p += end;
>>
>
> A question regarding the original code:

This is another instance of a NAND_BBT_* option that I don't really
understand, but I'll provide my thoughts...

> Why the region validated for 0xff is [0 , paglen+td->of) ?
> I assume this buffer region contains the inband data. Why verify inband
> data is all 0xff?

If used on a flash-based BBT page, then it checks for an empty table
(why would you need this?), and if used for factory-marked bad blocks,
then it checks that all the non-marker locations are 0xff. I guess the
latter is at least more reasonable, but that still doesn't really
answer "why?" So I'm guessing this another ill-conceived option.

> Shouldn't the region validated be [paglen , paglen+td->of) ?

Dunno.

Anyway, it's only used in a single driver (omap2.c) in
"bb_descrip_flashbased" which, despite its name, does not use a
flash-based BBT - also used in "agand_flashbased". So the option is
*only* used for OOB bad block markers, ensuring that the non-marker
positions are 0xff. But I don't see how it's valid to assume that the
data will be 0xff, nor do I know why someone would want to check that.

Finally, I think that some of the "use" of NAND_BBT_SCANEMPTY is
obscured by the fact that omap2.c's main codepath involves
(permanently) clearing NAND_BBT_SCANEMPTY in nand_memory_bbt(). See:
bd->options &= ~NAND_BBT_SCANEMPTY;

So, is this another candidate for removal, as it is practically unused
and unmaintained? Or any comments on its purpose, Ivan?

Brian
