Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Njmb0-0004YI-8n
	for linux-mtd@lists.infradead.org; Tue, 23 Feb 2010 04:42:11 +0000
Received: by pwj2 with SMTP id 2so2140080pwj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Feb 2010 20:42:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <0554BEF07D437848AF01B9C9B5F0BC5D9BB7DEBC@dlee01.ent.ti.com>
References: <aecf5e531002221936q70f06a23j62046b180f490d60@mail.gmail.com>
	<0554BEF07D437848AF01B9C9B5F0BC5D9BB7DEBC@dlee01.ent.ti.com>
Date: Tue, 23 Feb 2010 10:12:04 +0530
Message-ID: <aecf5e531002222042g2eb3ee79g53d05261054e07ee@mail.gmail.com>
Subject: Re: MLC nand driver for linux
From: Sasa Sasa <sasak.1983@gmail.com>
To: "Paulraj, Sandeep" <s-paulraj@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Paulraj..

I am also using micron mlc nand device.(4k page size)

Just for ref, could I refer your driver from mainline linux kernel if
available, i think it would be same for SLC and MLC.

Regards
Sasa



On Tue, Feb 23, 2010 at 9:22 AM, Paulraj, Sandeep <s-paulraj@ti.com> wrote:
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
