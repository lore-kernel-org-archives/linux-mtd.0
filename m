Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LUcOS-0000eC-M0
	for linux-mtd@lists.infradead.org; Wed, 04 Feb 2009 07:41:59 +0000
Subject: Re: Regarding UBI scalability
From: Artem Bityutskiy <dedekind@infradead.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <ly7i47iwv1.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <31956721.196931233319535527.JavaMail.weblogic@epml10>
	<1233567078.7085.62.camel@localhost.localdomain>
	<618F1BB69C6C43C895C260C527C4F159@sisodomain.com>
	<4986D3F6.5030208@nokia.com>
	<1233572259.7085.64.camel@localhost.localdomain>
	<4986D677.3020500@nokia.com>
	<71cd59b00902021544w594d4acandc0183bc523aafb0@mail.gmail.com>
	<6b5362aa0902030235t4175ec11re9b6335df558e6a@mail.gmail.com>
	<1233658130.24809.107.camel@localhost.localdomain>
	<ly7i47iwv1.fsf@ensc-virt.intern.sigma-chemnitz.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 04 Feb 2009 09:41:40 +0200
Message-Id: <1233733300.5138.29.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-02-03 at 12:27 +0100, Enrico Scholz wrote:
> Artem Bityutskiy <dedekind@infradead.org> writes:
> 
> > For UBI2 I would just forget about static volumes support. They
> > are not so necessary, and a rare user needs them
> 
> I store my kernel, the 2nd level bootloader and bootenv in such
> volumes.  Having the number of used bytes available without
> introducing special storage formats simplifies things in the
> initial bootloader and when writing images into the volumes.
> 
> This is nothing which can not be changed, but static volumes are
> not a rare needs imo.

Ok, thanks for this information. Probably static volumes are not that
useless as I thought.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
