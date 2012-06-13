Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sep35-000463-Em
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 14:59:56 +0000
Date: Wed, 13 Jun 2012 16:59:47 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Ran Shalit <ranshalit@gmail.com>
Subject: Re: Q: Cramfs Vs. Ubifs
In-Reply-To: <CAJ2oMhL4Y-=sfWTzKuFvqr2Ci9MiVGWHx8sHpJLoZz9wzcgF1Q@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1206131656130.4247@lnxricardw.se.axis.com>
References: <CAJ2oMhJxM6UTfj3zX7DFnc8PPcNNLfnXeV68ELLaCY=_8inFTg@mail.gmail.com>
 <Pine.LNX.4.64.1206050837380.4247@lnxricardw.se.axis.com>
 <CAJ2oMhLn-FNqXgdTOSamQry1BBm+Otu3PdjEPCyj2qsS-F_=QA@mail.gmail.com>
 <Pine.LNX.4.64.1206130851420.4247@lnxricardw.se.axis.com>
 <CAJ2oMhL4Y-=sfWTzKuFvqr2Ci9MiVGWHx8sHpJLoZz9wzcgF1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: =?iso-8859-1?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 13 Jun 2012, Ran Shalit wrote:

>>> If I start several executable from ubifs in some start point, Is it
>>> right to assume that all of them are running in RAM, and there is no
>>> access to flash after this start point of execution ?
>>
>> As someone else mentioned on the mtd list, Linux is demand paged which m=
eans
>> that the code is loaded into memory when needed. If there's a chunk of c=
ode
>> (Linux uses a page size of 4 kbytes so that's the granularity of the pag=
ing)
>> that is not used until after a while after the start of execution, it wo=
n't
>> be loaded until it is actually run.
>>
>> I don't know if there's a way to force it all into memory when execution
>> starts; there probably is.
>>
> In embedded system it is desired to execute only from RAM, therefore
> it seems that ubifs is not best choice here.

The demand paging concept simply means that the code is copied to RAM from=
=20
the file system when needed, it is always executed from RAM. But yes, it=20
can mean that the application has to wait for data to get copied during=20
execution.

> It seems that in order to run completely from RAM I need to copy all
> the files in ubifs potion to RAM and then execute the application in
> RAM.

Even if you copy all files to a RAM-based file system, such as /tmp, they=
=20
still need to be copied from the file system to directly accessible=20
memory before execution. While it may be faster than performing the same=20
operation from flash, the demand paging functionality is still in=20
operation.

The only way to avoid it would be to force loading of all pages for a=20
program at its start, I've never had the need so I don't know how though.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
