Received: from smtp05.smtpout.orange.fr ([80.12.242.127]
 helo=smtp.smtpout.orange.fr)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFVyb-0002fY-W4
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2013 21:11:31 +0000
Message-ID: <52210A67.5080807@wanadoo.fr>
Date: Fri, 30 Aug 2013 23:11:03 +0200
From: Michel Stempin <michel.stempin@wanadoo.fr>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2] mtd: m25p80: add support for PMC SPI flash
References: <1376783055-18370-1-git-send-email-luka@openwrt.org>
 <CAN8TOE9PreuyaDHHPeHaB0906c6T=-Vz76By-PmX2whAdMWjgA@mail.gmail.com>
 <20130821100322-1880@mutt-kz>
 <1377895857.22372.89.camel@shinybook.infradead.org>
In-Reply-To: <1377895857.22372.89.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: =?windows-1252?Q?Marek_Va=9Aut?= <marex@denx.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Luka Perkov <luka@openwrt.org>, Gabor Juhos <juhosg@openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Le 30/08/2013 22:50, David Woodhouse a écrit :
> On Wed, 2013-08-21 at 12:03 +0200, Luka Perkov wrote:
>>
>> On Wed, Aug 21, 2013 at 02:12:42AM -0700, Brian Norris wrote:
>>> I just noticed this version of Michel's patch (it was filtered to my
>>> spam for some reason). I pushed Michel's version,
>>
>> Ok, I have only changed commit message.
> 
> And I'm going to change it a little more to make it make sense, I think.
> Can someone confirm the accuracy of the following (fixing non-standard
> terms, and also I think fixing the comment about Pm25LQ032 block size):

I can't get used to these IEC prefixes vs. the customary ones, but you are right,
this is the international standard.

> 
> -commit ac36246d7c8684128c5879219c3178838983fbd0
> +commit ab50c34679ca03929fbc313da378b4f934e706ea
>  Author: Michel Stempin <michel.stempin@wanadoo.fr>
>  Date:   Mon Jul 15 12:13:56 2013 +0200
>  
>      mtd: chips: Add support for PMC SPI Flash chips in m25p80.c
>      
> -    Add support for PMC (now Chingis, part of ISSI) Pm25LV512 (512 kBbit),
> -    Pm25LV010 (1 Mbit) and Pm25LQ032 (32 Mbit) SPI Flash chips.
> +    Add support for PMC (now Chingis, part of ISSI) Pm25LV512 (512 Kib),
> +    Pm25LV010 (1 Mib) and Pm25LQ032 (32 Mib) SPI Flash chips.
>      
>      This patch addresses two generations of PMC SPI Flash chips:
>      
> -     - Pm25LV512 and Pm25LV010: these have 4KB sectors and 32KB
> -       blocks. The 4KB sector erase uses a non-standard opcode
> +     - Pm25LV512 and Pm25LV010: these have 4KiB sectors and 32KiB
> +       blocks. The 4KiB sector erase uses a non-standard opcode
>         (0xd7). They do not support JEDEC RDID (0x9f), and so they can only
>         be detected by matching their name string with pre-configured
>         platform data. Because of the cascaded acquisitions, the datasheet
> @@ -20,7 +20,7 @@ Date:   Mon Jul 15 12:13:56 2013 +0200
>         only public datasheet available seems to be on GeoCities:
>         <http://www.geocities.jp/scottle556/pdf/Pm25LV512-010.pdf>
>      
> -     - Pm25LQ032: a newer generation flash, with 4KB sectors and 32KB
> +     - Pm25LQ032: a newer generation flash, with 4KiB sectors and 64KiB

Yes, this is a 64KiB block size indeed.

>         blocks. It uses the standard erase and JEDEC read-ID
>         opcodes. Manufacturer's datasheet is here:
>         <http://www.chingistek.com/img/Product_Files/Pm25LQ032C%20datasheet%20v1.6.1.pdf>
> @@ -46,6 +46,7 @@ Date:   Mon Jul 15 12:13:56 2013 +0200
>      Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>
>      [Brian: fixed conflict]
>      Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> +    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
>  
> 
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

-- Michel
