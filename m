Received: from mga03.intel.com ([143.182.124.21])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HLp13-0005Xe-Iw
	for linux-mtd@lists.infradead.org; Mon, 26 Feb 2007 18:12:24 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Maturity of JFFS2 + MTD NAND Flash Support?
Date: Mon, 26 Feb 2007 15:12:17 -0800
Message-ID: <B1EDF20A6EAAD74EA65E46F774F17845E93644@orsmsx413.amr.corp.intel.com>
In-Reply-To: <625fc13d0702261421w32be087el4f0a23efef3fa4ad@mail.gmail.com>
From: "Johnson, Charles F" <charles.f.johnson@intel.com>
To: "Josh Boyer" <jwboyer@gmail.com>, "David Woodhouse" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Of the ONFI 1.0 spec, section 5, page 39 describes the command set.  I
assume you'd need a MTD driver to implement this command set ?=20


Charles Johnson
Ultra-Mobility Group
Platform Software Engineering
Intel Corporation
charles.f.johnson@intel.com
503-712-5181

-----Original Message-----
From: Josh Boyer [mailto:jwboyer@gmail.com]=20
Sent: Monday, February 26, 2007 2:22 PM
To: David Woodhouse
Cc: Johnson, Charles F; linux-mtd@lists.infradead.org
Subject: Re: Maturity of JFFS2 + MTD NAND Flash Support?

On 2/26/07, David Woodhouse <dwmw2@infradead.org> wrote:
> > Any support yet in MTD for ONFI 1.0 ??  (I couldn't find anything in
> > the 2.6.20rc6 kernel I was browsing.)
>
> I've not heard of ONFI. What's that?

I assume this:

http://www.onfi.org/

But that looks more like a hardware interface than software.  Which
means MTD has nothing to do with it.

josh
