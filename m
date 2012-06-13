Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SepYe-0005fB-MV
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 15:32:33 +0000
Date: Wed, 13 Jun 2012 17:32:28 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Ran Shalit <ranshalit@gmail.com>
Subject: Re: Q: Cramfs Vs. Ubifs
In-Reply-To: <CAJ2oMhKGbvN5E9R_Ybw4OCDVtFq6sqhZ+R0qx68A_SzSLW-x5A@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1206131729540.4247@lnxricardw.se.axis.com>
References: <CAJ2oMhJxM6UTfj3zX7DFnc8PPcNNLfnXeV68ELLaCY=_8inFTg@mail.gmail.com>
 <Pine.LNX.4.64.1206050837380.4247@lnxricardw.se.axis.com>
 <CAJ2oMhLn-FNqXgdTOSamQry1BBm+Otu3PdjEPCyj2qsS-F_=QA@mail.gmail.com>
 <Pine.LNX.4.64.1206130851420.4247@lnxricardw.se.axis.com>
 <CAJ2oMhL4Y-=sfWTzKuFvqr2Ci9MiVGWHx8sHpJLoZz9wzcgF1Q@mail.gmail.com>
 <Pine.LNX.4.64.1206131656130.4247@lnxricardw.se.axis.com>
 <CAJ2oMhKGbvN5E9R_Ybw4OCDVtFq6sqhZ+R0qx68A_SzSLW-x5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 13 Jun 2012, Ran Shalit wrote:

>> Even if you copy all files to a RAM-based file system, such as /tmp, the=
y
>> still need to be copied from the file system to directly accessible memo=
ry
>> before execution. While it may be faster than performing the same operat=
ion
>> from flash, the demand paging functionality is still in operation.
>>
>> The only way to avoid it would be to force loading of all pages for a
>> program at its start, I've never had the need so I don't know how though=
=2E
>>
>>
> Yes, that what I meant. At the initialization stage we will copy all
> files from ubifs section into root file system in RAM and so I assume
> that there will be no any access to flash during application life for
> read or write (any desired access will be controlled by application).
> I wonder why I didn't find any information about disadvantage of using
> ubifs as root file system in embedded system in terms of access to
> flash during application life.

I think because it normally is not a problem. Also, the same goes for any=
=20
file system which resides on the flash, it's not a ubifs-specific problem.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
