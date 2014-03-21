Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQtir-0002cI-AS
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 07:18:34 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>, Kent Li <Kent.Li@radisys.com>
Subject: RE: Corrupt empty space
Date: Fri, 21 Mar 2014 07:18:06 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB4DAF@DBDE04.ent.ti.com>
References: <D2D3E4C4A672E847B422D1E5F695E1A402E61608@sreublc136.eu.labinal.snecma>
 <aadf057c868c47128845c19d69933c46@BLUPR08MB103.namprd08.prod.outlook.com>
 <1394524000.6302.217.camel@sauron.fi.intel.com>
In-Reply-To: <1394524000.6302.217.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: =?iso-8859-1?Q?HOUR_Fr=E9deric?= <frederic.hour@safran-engineering.com>,
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

>From: Artem Bityutskiy
>>On Tue, 2014-03-11 at 05:31 +0000, Kent Li wrote:
>> Frederic,
>>
>> I'm not sure if this is the unstable bit issue, but I just resolved such=
 issue by enhancing my Nand driver in both Uboot code and Linux
>code.
>>
>> The main idea is:
>> Read a page
>> If ( ECC fail ) ;then
>> 	Check the how many 0 bit there is.
>> 	If ( 0 bit number > tolerance value) //tolerance value is depends on th=
e ECC correctable bits.
>> 		Print "Fail to recover by ECC"
>> 	Else
>> 		Force change the 0 bits to 1
>> 	fi
>> fi
>
>Off the top of my head, this sounds reasonable. Too bad people people do
>not just go and fix this in upstream...
>
It's still getting discussed in [a] and [b]. But there are multiple issues =
to it.

 (1) Many hardware controllers cannot parse ECC errors in blank-pages.
   So, checking number of 0-bits in a page is done in software by comparing
   each byte with 0xff.

(2) Counting number of 0-bits in a page in software, brings down your read-=
performance.

(3) Some controller required specific sequence for reading pages, hence get=
ting
  a generic driver solution for this problem, is becoming tough.=20


*Thread on NAND Driver changes*
[a] http://lists.infradead.org/pipermail/linux-mtd/2014-March/052507.html
[b] http://lists.infradead.org/pipermail/linux-mtd/2014-March/052625.html


*Thread on UBIFS changes*
http://lists.infradead.org/pipermail/linux-mtd/2014-March/052499.html


with regards, pekon
