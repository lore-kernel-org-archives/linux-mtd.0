Received: from exprod6ob111.obsmtp.com ([64.18.1.26] helo=psmtp.com)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MeF5g-0005fX-SS
	for linux-mtd@lists.infradead.org; Thu, 20 Aug 2009 21:22:41 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Driver support new NOR flash JS28F256P30BF
Date: Thu, 20 Aug 2009 17:22:30 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901BEA625@mi8nycmail19.Mi8.com>
In-Reply-To: <2A01FDEB56E1DF45B111D0FF5949526F2F1A7938@USNAVSXCHMBSA2.ndc.alcatel-lucent.com>
References: <2A01FDEB56E1DF45B111D0FF5949526F2F1A7938@USNAVSXCHMBSA2.ndc.alcatel-lucent.com>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: "Spinelli, Claudio (Claudio)" <claudio@alcatel-lucent.com>,
	<linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, August 20, 2009 1:42 PM, Spinelli, Claudio wrote:
> I am wondering if anybody has kernel driver support for the
> following NOR flash part number JS28F256P30BF, this component
> is replacing JS28F256P30B85 which is going obselete.

It appears this change is due to a process migration from 130nm
to 65nm.

http://www.numonyx.com/Documents/PCN/PCN109030-02_P30_130_65nm_conversion=
.pdf

The new 256Mb part appears to be compatible with the older version
except for a slower initial access time. It also adds a couple new
features:

* 512-word buffer vs. 32-word buffer
* password access
* blank check

Overall it appears the current driver (physmap.c) should work fine.
It might need some tweaking in order to take advantage of the larger
buffer size and the password access and blank check commands.

Just my 0.02...

Regards,
Hartley
