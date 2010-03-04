Received: from mail-px0-f181.google.com ([209.85.216.181])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NnHeF-0004Av-Uv
	for linux-mtd@lists.infradead.org; Thu, 04 Mar 2010 20:28:00 +0000
Received: by pxi11 with SMTP id 11so9625pxi.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Mar 2010 12:27:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <0554BEF07D437848AF01B9C9B5F0BC5D9BB7DEBC@dlee01.ent.ti.com>
References: <aecf5e531002221936q70f06a23j62046b180f490d60@mail.gmail.com>
	<0554BEF07D437848AF01B9C9B5F0BC5D9BB7DEBC@dlee01.ent.ti.com>
Date: Thu, 4 Mar 2010 21:27:54 +0100
Message-ID: <62cbdcd91003041227i5af7e246u381e1bf7802a8cb@mail.gmail.com>
Subject: Re: MLC nand driver for linux
From: massimo cirillo <maxcir@gmail.com>
To: "Paulraj, Sandeep" <s-paulraj@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Sasa Sasa <sasak.1983@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
Sorry my earlier message was rejected because of suspicious header.

Hi Paulraj,
I'm interested in testing Numonyx MLC Nand devices.
So, what kind of tests have you done with MLC NAND ?
File system level ? Driver level ?
Have you modified in any part the nand_base.c file ?
And what kernel version ?
thanks


2010/2/23 Paulraj, Sandeep <s-paulraj@ti.com>:
>
>
>> Hi,
>>
>> Regarding MLC nand devices, Is there any change or support required in
>> exiting kernel drivers basically nand_base and mtd drivers etc or they
>> simply support this device. Like for onenand there are different read
>> and write calls for mlc as we see in onenand_base.c file.
>>
>> Regards
>> Sasa
>>
>
> I've used MICRON and SAMSUNG MLC NAND's without any problems.
>
> The MICRON NAND's were ONFI devices and even they worked well.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
