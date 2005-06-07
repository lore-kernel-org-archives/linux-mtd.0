Received: from rt-soft-2.moscow.itn.ru ([80.240.96.70] helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DfZxz-0004R7-QY
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2005 05:01:49 -0400
Message-ID: <42A5627B.6060609@ru.mvista.com>
Date: Tue, 07 Jun 2005 13:01:47 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
References: <426F719A.2000903@ipi.ac.ru>	<20050606133406.GD31739@wohnheim.fh-wedel.de>	<42A4572C.8020107@ipi.ac.ru>	<20050606141453.GF31739@wohnheim.fh-wedel.de>	<42A460BB.50800@ipi.ac.ru>	<20050606162648.GJ31739@wohnheim.fh-wedel.de>	<42A47E7D.2060302@ipi.ac.ru>	<20050606174443.GA24857@wohnheim.fh-wedel.de>
	<42A55B15.8000506@ipi.ac.ru>
In-Reply-To: <42A55B15.8000506@ipi.ac.ru>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: misaligned memory access in cmdlinepart.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Timofei,
I guess you should use a mail client that doesn't expand tabs to spaces, 
like sylpheed or pine.

Best regards,
   Vitaly

Timofei V. Bondarenko wrote:

> Jörn Engel wrote:
>
>> On Mon, 6 June 2005 20:49:01 +0400, Timofei V. Bondarenko wrote:
>>
>>> Jörn Engel wrote:
>>>
>>>> Hmm.  Well, I just don't care enough, let's keep it.
>>>>
>>>> Can you test the current patch and see if it works for you?  Once
>>>> you've confirmed that, I'll commit it.
>>>
>>>
>>> Yes. I've tested it on the uclinux-bf533.
>>
>>
>>
>> Doesn't apply with patch -p1.  Can you respin the patch against mtd
>> cvs and make sure it does?  If in doubt, read:
>> http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt
>
>
> Ok, sorry for noise.
> Is it good enough?
>
> diff -u -p -r1.17 cmdlinepart.c
> --- mtd/drivers/mtd/cmdlinepart.c    26 Nov 2004 11:18:47 -0000    1.17
> +++ mtd/drivers/mtd/cmdlinepart.c    7 Jun 2005 08:02:00 -0000
> @@ -239,7 +239,8 @@ static int mtdpart_setup_real(char *s)
>                  &num_parts,    /* out: number of parts */
>                  0,        /* first partition */
>                  (unsigned char**)&this_mtd, /* out: extra mem */
> -                mtd_id_len + 1 + sizeof(*this_mtd));
> +                mtd_id_len + 1 + sizeof(*this_mtd) +
> +                                sizeof(void*)-1 /*alignment*/);
>          if(!parts)
>          {
>              /*
> @@ -252,7 +253,10 @@ static int mtdpart_setup_real(char *s)
>               return 0;
>           }
>
> -        /* enter results */   
> +        /* align this_mtd */
> +                this_mtd = (struct cmdline_mtd_partition *)
> +                    ALIGN((unsigned long)this_mtd, sizeof(void*));
> +        /* enter results */
>          this_mtd->parts = parts;
>          this_mtd->num_parts = num_parts;
>          this_mtd->mtd_id = (char*)(this_mtd + 1);
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
