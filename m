Received: from smtp.innovsys.com ([66.115.232.196] helo=mail.innovsys.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JeDNn-0007pH-AR
	for linux-mtd@lists.infradead.org; Tue, 25 Mar 2008 17:56:23 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: OF compatible MTD platform RAM driver ?
Date: Tue, 25 Mar 2008 12:56:13 -0500
Message-ID: <DCEAAC0833DD314AB0B58112AD99B93B0427706A@ismail.innsys.innovsys.com>
In-Reply-To: <200803251823.32039.laurentp@cse-semaphore.com>
References: <200803101606.39184.laurentp@cse-semaphore.com><200803251744.46001.laurentp@cse-semaphore.com><47E93010.5090904@ru.mvista.com>
	<200803251823.32039.laurentp@cse-semaphore.com>
From: "Rune Torgersen" <runet@innovsys.com>
To: "Laurent Pinchart" <laurentp@cse-semaphore.com>,
	"Sergei Shtylyov" <sshtylyov@ru.mvista.com>
Cc: ben@simtec.co.uk, linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	David Gibson <david@gibson.dropbear.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Laurent Pinchart wrote:
> On Tuesday 25 March 2008 18:02, Sergei Shtylyov wrote:
>> Laurent Pinchart wrote:
>>=20
> Regarding non-volatility nothing prevents a user from using a=20
> volatile RAM as an MTD device, but there's little point in doing so.
> Would it be acceptable for the "linear-nvram" specification
> not to include > volatile RAM ? ROM chips would be excluded too. Is
that an issue ?

We actually use a volatile ram (SRAM) as an MTD device. We use it to
store info from bootloader and system specific values between resets.
