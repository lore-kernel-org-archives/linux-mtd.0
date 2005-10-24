Received: from smtprelay04.ispgateway.de ([80.67.18.16])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EU2PA-0001HS-29
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2005 09:30:26 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.89.151])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay04.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 24 Oct 2005 13:30:21 -0000
Message-ID: <435CE1ED.8020301@gmail.com>
Date: Mon, 24 Oct 2005 15:30:21 +0200
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: Holger Schurig <hs4233@mail.mn-solutions.de>
References: <434E7211.6020709@gmail.com>
	<200510140825.12934.hs4233@mail.mn-solutions.de>
In-Reply-To: <200510140825.12934.hs4233@mail.mn-solutions.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: /dev/mtd* not there with latest MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I made some old-fanshiond mknod-style device files there. They have the
> same names as devfs without devfsd had, so my software just runs fine.

/dev/mtdblockX works fine, but /dev/mtdX NOT.

Did you only create mtdblocks or mtds too?
Older MTD creates /dev/mtdX with minor numbers X*2; running flash_erase 
(for example) works fine.
Not so with same kernel, but latest CVS: creating exactly the same 
/dev/mtdX as mtdchar.c would do (e.g. older MTD would do), I cannot 
operate the flash properly. flash_erase results in an CFI error:

 > > flash_erase /dev/mtd4
 > Erase Total 1 Units
 > Performing Flash Erase of length 262144 at offset 0x0
 > H720X: block erase error: (status timeout)
 > MTD Erase failure: Input/output error
 > H720X: Waiting for chip to be ready timed out. Status 300080

Hm...

Regards,
Bernhard
