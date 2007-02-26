From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Julianne C.'" <juliannerc@gmail.com>,
	"'linux-mtd'" <linux-mtd@lists.infradead.org>
References: <e167438e0702220835gbc5562fl4dc0bc4bd879f649@mail.gmail.com>
Subject: RE: OneNAND: Rate of write errors
Date: Mon, 26 Feb 2007 09:41:21 +0900
Message-ID: <016401c7593e$d88fb6d0$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <e167438e0702220835gbc5562fl4dc0bc4bd879f649@mail.gmail.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

> 
> Further thought about the numerous write errors to the 
> OneNAND part got me thinking about the symptoms, i.e., when 
> we see the -EBADMSG error return, there is no corresponding 
> fault reported in the ECC status register.  Consequently, we 
> concluded that the bufferram may be getting corrupted before 
> the data is ever committed to the NAND array.
> 
> Hence, we rewrote the code for the setup as follows in the 
> onenand_write procedure:
> 
>         do
>         {
>             this->write_bufferram (mtd,
>                                    ONENAND_DATARAM,
>                                    wbuf,
>                                    0,
>                                    mtd->writesize);

write_bufferram does just copy data from host to internal bufferram (SRAM).

> 
>             ret = onenand_do_check_bufferram (mtd,
>                                               ONENAND_DATARAM,
>                                               wbuf,
>                                               0,
>                                               mtd->writesize);

So I think it's just delay function. 

> 
>             if (ret != 0) // then
>             {
>                 retrys = retrys + 1;
> 
>                 printk (KERN_WARNING
>                         "onenandwrite: bad buffer ram, 
> retrying (%d)\n",
>                         retrys);
>             } // end if
>         } while (ret != 0 &&
>                  retrys < max_retrys);
> 
>         if (retrys >= max_retrys) // then
>         {
>             ret = -EBADMSG;
> 
>             break;
>         } // end if
> 
> With max_retrys set to three (we have seen double attempts) 
> to make this work all the time.  There are no more errors 
> reported back to the
> JFFS2 system, and the file system cleanly mounts and unmounts.
> 
> This does verify the suspicion that the buffer was corrupted 
> before it was committed.  Does anyone have any idea how or 
> why the data in the bufferram might be corrupted?
> 

Then we can assume that 

Case 1: the interrnal buffer ram is corrupted because of some reasons. such
as memory timings, or hardware failure.
In my experiences, if some onenand pin is connected wrongly. it's possible,
but it's rare.
As you know internal bufferram is SRAM. it's means it's not changed if the
power is connected.

Case 2: verify failure. since we have too short write time.
Because of too short write time the write is failed without error report.
The write verify function acts like this.
1. write data
2. read written data to another buffer ram
3. verify two data
It means even though write is passed, the verification can be failed.

So I would recommend that
First check the interrnal bufferram changes then check write data.

Thank you,
Kyungmin Park
