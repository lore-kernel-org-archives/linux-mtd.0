Received: from nf-out-0910.google.com ([64.233.182.191])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KfSWK-0001Wu-BD
	for linux-mtd@lists.infradead.org; Tue, 16 Sep 2008 04:50:38 +0000
Received: by nf-out-0910.google.com with SMTP id d21so1600674nfb.22
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Sep 2008 21:50:35 -0700 (PDT)
Message-ID: <33a7f1bc0809152050s6b2afd4doa81f9b281cee7709@mail.gmail.com>
Date: Tue, 16 Sep 2008 11:50:45 +0800
From: "chen gong" <clumsycg@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH 3/3] [MTD] m25p80.c
In-Reply-To: <1221462398.3201.33.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1218080495-2653-1-git-send-email-g.chen@freescale.com>
	<1218080495-2653-2-git-send-email-g.chen@freescale.com>
	<1218080495-2653-3-git-send-email-g.chen@freescale.com>
	<1218080495-2653-4-git-send-email-g.chen@freescale.com>
	<1221462398.3201.33.camel@macbook.infradead.org>
Cc: linux-mtd@lists.infradead.org, viro@ftp.uk.linux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/9/15 David Woodhouse <dwmw2@infradead.org>:
> On Thu, 2008-08-07 at 11:41 +0800, Chen Gong wrote:
>> @@ -547,6 +550,7 @@ static struct flash_info *__devinit jedec_probe(struct spi_device *spi)
>>         u8                      code = OPCODE_RDID;
>>         u8                      id[3];
>>         u32                     jedec;
>> +       u16                     ext_jedec;
>>         struct flash_info       *info;
>>
>>         /* JEDEC also defines an optional "extended device information"
>         * string for after vendor-specific data, after the three bytes
>         * we use here.  Supporting some chips might require using it.
>         */
>        tmp = spi_write_then_read(spi, &code, 1, id, 3);
>        if (tmp < 0) {
>                DEBUG(MTD_DEBUG_LEVEL0, "%s: error %d reading JEDEC ID\n",
>                        spi->dev.bus_id, tmp);
>                return NULL;
>        }
>        jedec = id[0];
>        jedec = jedec << 8;
>        jedec |= id[1];
>>         jedec = jedec << 8;
>>         jedec |= id[2];
>>
>> +       ext_jedec = id[3] << 8 | id[4];
>> +
>
> You're trying to read off the end of the id[] array, which has only
> three elements. And you didn't ask spi_write_then_read() to read that
> many bytes _anyway_. And if you did... would it fail on chips which
> don't have the extended device information?
>

Sorry for late. Last day is Mid-autumn Festival in our Country. We have a
nice holiday.
It is a stupid error that I forget to fix it from my branch. I will
send a new patch
to fix it soon.

> Please test and send a fix, since this is already in the git tree.
>
> --
> David Woodhouse                            Open Source Technology Centre
> David.Woodhouse@intel.com                              Intel Corporation
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
