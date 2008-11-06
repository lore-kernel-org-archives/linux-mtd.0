Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Ky1V9-0005fq-Vt
	for linux-mtd@lists.infradead.org; Thu, 06 Nov 2008 09:50:08 +0000
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-mx06.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	mA69nvuN030943
	for <linux-mtd@lists.infradead.org>; Thu, 6 Nov 2008 11:50:05 +0200
Subject: Re: [PATCH 4/4] [MTD] nandsim: add option to use a file to cache pages
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <483FF983.9050305@nokia.com>
References: <483FF983.9050305@nokia.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 06 Nov 2008 11:48:18 +0200
Message-Id: <1225964898.26460.27.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-05-30 at 15:56 +0300, Adrian Hunter wrote:
> Add a new optional module parameter 'cache_file' which causes
> nandsim to use that file instead of memory to cache nand data.
> Using a file allows the simulation of NAND that is bigger
> than the available memory.

Hi,

What is the fate of this patch?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
