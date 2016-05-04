Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axs9e-00081m-A4
 for linux-mtd@lists.infradead.org; Wed, 04 May 2016 08:27:35 +0000
Subject: Re: [ANNOUNCE] MLC support for UBI/UBIFS
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <57221E28.9050102@nod.at>
 <A765B125120D1346A63912DDE6D8B6310BF700B9@NTXXIAMBX02.xacn.micron.com>
Cc: Alexander Kaplan <alex@nextthing.co>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Gstir <david@sigma-star.at>,
 David Oberhollenzer <goliath@sigma-star.at>,
 Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5729B259.9010207@nod.at>
Date: Wed, 4 May 2016 10:27:05 +0200
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF700B9@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bean,

Am 04.05.2016 um 09:40 schrieb Bean Huo 霍斌斌 (beanhuo):
> Hi, Richard 
> Do you need our Micron 70s and 80s MLC NAND sample?
> Current code only enable Hynix MLC NAND, can I send patch about this our MLC
> NAND paired page distance to you? I already tested them on your codes.

Patches are always welcome. :-)

Does your MLC have a mapping other than dist3 or dist6
as implemented in Boris' "[PATCH 2/4] mtd: nand: implement two pairing scheme"
patch?

Thanks,
//richard
