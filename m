Received: from mtagate1.de.ibm.com ([195.212.29.150])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IGwAP-0000Cp-QO
	for linux-mtd@lists.infradead.org; Fri, 03 Aug 2007 13:22:06 +0100
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate1.de.ibm.com (8.13.8/8.13.8) with ESMTP id l73CM0cW780100
	for <linux-mtd@lists.infradead.org>; Fri, 3 Aug 2007 12:22:00 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com
	[9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.4) with
	ESMTP id l73CLxkD1093650
	for <linux-mtd@lists.infradead.org>; Fri, 3 Aug 2007 14:21:59 +0200
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l73CLuOC004147
	for <linux-mtd@lists.infradead.org>; Fri, 3 Aug 2007 14:21:56 +0200
Message-ID: <46B31DE2.3050804@de.ibm.com>
Date: Fri, 03 Aug 2007 14:21:54 +0200
From: Carsten Otte <cotte@de.ibm.com>
MIME-Version: 1.0
To: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
References: <1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
	<20070801121800.GB2747@lazybastard.org> <46B083B3.80009@de.ibm.com>
	<6934efce0708011337g32169212v329c778bb7700aea@mail.gmail.com>
	<46B18D89.1010207@de.ibm.com>
	<6934efce0708021455h29c9151aw7aab2245df0062e5@mail.gmail.com>
	<46B2E055.9010305@de.ibm.com>
	<20070803091747.GA18735@lazybastard.org>
	<46B30B95.4070706@de.ibm.com>
	<20070803113134.GA19049@lazybastard.org>
In-Reply-To: <20070803113134.GA19049@lazybastard.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: carsteno@de.ibm.com, dhowells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: carsteno@de.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=C3=B6rn Engel wrote:
> On Fri, 3 August 2007 13:03:49 +0200, Carsten Otte wrote:
>> I see. Trouble for "real time" applications ;-). But once we're=20
>> receiving a lot of page faults we end up suspending the erase forever.=
=20
>> We need a deterministic end of the erase cycle as well, don't we?
> Absolutely.
Hmm. At least this does'nt seem like something that the xip=20
infrastructure should be concerned with: it will ask for=20
get_xip_page() [or get_xip_pfn()], and return temporary references via=20
put_xip_page/pfn(). The mtd layer has to decide when to pospone=20
get_xip_page() calls and when to ask for references being returned. On=20
the other hand, I think we should make sure get_xip_page() targets may=20
call schedule() in case the page we ask for is currently unavailable=20
while an erase operation is in progress.
