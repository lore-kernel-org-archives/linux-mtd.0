Received: from mail-gx0-f10.google.com ([209.85.217.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KnOiI-0000hB-Hv
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 02:23:47 +0000
Received: by gxk3 with SMTP id 3so7768061gxk.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Oct 2008 19:23:46 -0700 (PDT)
Message-ID: <e8775dd00810071923p1b570432k4f5fae04de2fa9af@mail.gmail.com>
Date: Wed, 8 Oct 2008 10:23:45 +0800
From: "Jason Liu" <liu.h.jason@gmail.com>
To: "Curt Scott" <curt_scott@yahoo.com>
Subject: Re: OOB questions
In-Reply-To: <825594.10285.qm@web81806.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <825594.10285.qm@web81806.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/10/8 Curt Scott <curt_scott@yahoo.com>:
> Hi Jason,
>
> Thank you for your answers they are very helpful.  I now understand that the system I am working with is comparable to an MLC NAND system.  I have a couple more questions.
>
> Q1.) From what I can find looking around, my only option is to incorporate a NAND MLC patch (support for NOP=1), Is this my only option?
> Example (http://patchwork.ozlabs.org/patch/623/)
>
Jffs2 will only use oob to store the cleanmarker.You can search for a
patch with "jffs2 not use oob patch"

> Q2.) I did try and report through add_mtd_device() that mtd->oobsize=0 and mtd->oobavail=0.  After I did that, I found that the JFFS2/MTD system was calling the write/writev functions with less than a page size.
> Example:
> - write: addr=0, size=44
> - write: addr=44, size=32
>
> Is this expected behavior?
>
This is correct since jffs2 has one page cache machanism.

> Q3.) I have heard that it is possible to disable the OOB functionality.  Is this true?  If so, is there a way to make it work for the MLC NAND model?
>
Jffs2 does not support MLC nand flash if not apply some patch. I have
found two patches so far. I once use the patch with not use oob. With
this patch, jffs2 will not use oob to store cleanmarker.

> Thank you for your help,
> Curt
>
>
>
>
> ----- Original Message ----
> From: Jason Liu <liu.h.jason@gmail.com>
> To: Curt Scott <curt_scott@yahoo.com>
> Cc: linux-mtd@lists.infradead.org
> Sent: Monday, October 6, 2008 9:04:33 PM
> Subject: Re: OOB questions
>
> 2008/10/7 Curt Scott <curt_scott@yahoo.com>:
>> Hi,
>>
>> I am writing a MTD NAND (2K page) driver module for Linux 2.6.23.
>> My NAND hardware controller performs all the ECC control
>> under-the-hood.  Although is has OOB bytes available there are some
>> limitaitions...
>>
>> L1.) Page data and OOB data must be written at the same time.
> Not only your NFC but also some others require to written page data
> and oob data
> at the same time espically for large page size nand flash since it use oob to
> store the ECC data.
>> L2.) OOB data is limited to 16 bytes / page (of a 2k page).
>>
> It should be ok for jffs2 filesystem.
>
>> I have some questions about the OOB requirements for MTD/JFFS2 combo.
>>
>> Q1.) Does MTD/JFFS2 require the ability to read/write OOB bytes?
>>     Or can the system be set up operate with no OOB available?
> jffs2 can work without oob.
>> Q2.) Is it a requirement for OOB and non-OOB writes to happen independently?
>>
> May provide the interface to MTD layer. For MLC Nand flash, it's
> impossible to write data and oob indepently since NOP is 1.
> The file system should take care not  to write it without erase it for MLC.
>
>> thank you for you help,
>> Curt
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
