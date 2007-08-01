Received: from mtagate5.de.ibm.com ([195.212.29.154])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IGDnu-00036A-7Z
	for linux-mtd@lists.infradead.org; Wed, 01 Aug 2007 13:59:55 +0100
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate5.de.ibm.com (8.13.8/8.13.8) with ESMTP id l71Cxj1q805868
	for <linux-mtd@lists.infradead.org>; Wed, 1 Aug 2007 12:59:45 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com
	[9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.4) with
	ESMTP id l71Cxj3T1974414
	for <linux-mtd@lists.infradead.org>; Wed, 1 Aug 2007 14:59:45 +0200
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l71Cxc7H030248
	for <linux-mtd@lists.infradead.org>; Wed, 1 Aug 2007 14:59:39 +0200
Message-ID: <46B083B3.80009@de.ibm.com>
Date: Wed, 01 Aug 2007 14:59:31 +0200
From: Carsten Otte <cotte@de.ibm.com>
MIME-Version: 1.0
To: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
	<20070801121800.GB2747@lazybastard.org>
In-Reply-To: <20070801121800.GB2747@lazybastard.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: dhowells <dhowells@redhat.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
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
> Neither am I.  My missing puzzle piece is how to zap all page mappings
> for the chip in question.  Maybe the fs/vm meeting at lce will clear
> things up.
I don't think that one is particular hard to do. All you need is:
- count refernces in the driver
- make the xip code return its references after use
- a callback that the driver can call to get its references that are
   mapped to userland back which would simply boil down to=20
filemap_xip_unmap()
- the driver should stop handing out new references for file=20
operations when calling the callback, and the reference count should=20
become zero pretty soon.
I'd be happy to do the xip infrastructure parts of this.
