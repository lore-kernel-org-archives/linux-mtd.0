Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axsxW-0004tR-G1
 for linux-mtd@lists.infradead.org; Wed, 04 May 2016 09:19:07 +0000
Subject: Re: [ANNOUNCE] MLC support for UBI/UBIFS
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <57221E28.9050102@nod.at>
 <A765B125120D1346A63912DDE6D8B6310BF700B9@NTXXIAMBX02.xacn.micron.com>
 <5729B259.9010207@nod.at>
 <A765B125120D1346A63912DDE6D8B6310BF70101@NTXXIAMBX02.xacn.micron.com>
Cc: Alexander Kaplan <alex@nextthing.co>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Gstir <david@sigma-star.at>,
 David Oberhollenzer <goliath@sigma-star.at>,
 Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5729BE71.5090708@nod.at>
Date: Wed, 4 May 2016 11:18:41 +0200
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF70101@NTXXIAMBX02.xacn.micron.com>
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

Am 04.05.2016 um 10:55 schrieb Bean Huo 霍斌斌 (beanhuo):
> Hi, Richard
> Yes , different with "dis6 and dis3", but I think this is not a perfect 
> Solution on paired-page distance detect. Because different vendor and different series NAND with different such paired-page distance function. as a result, this table will be bigger and bigger. I now want to do if we can probe this information from DTS.

Not sure if I understand you correctly.
Is it not possible to describe your pairing scheme in an algorithmic way?
Did you check Boris' paired pages patches for MTD?
Please try to implement it.
Having the pairing table in DT is IMHO not a good thing.

Thanks,
//richard
