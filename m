Received: from nproxy.gmail.com ([64.233.182.204])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EwOWh-0002n6-Nb
	for linux-mtd@lists.infradead.org; Tue, 10 Jan 2006 13:47:25 -0500
Received: by nproxy.gmail.com with SMTP id x30so163991nfb
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Jan 2006 10:47:21 -0800 (PST)
Message-ID: <6934efce0601101047q2d40d5ecic5205aad4743c341@mail.gmail.com>
Date: Tue, 10 Jan 2006 10:47:21 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: James Hughes <JHughes@linx.co.uk>
In-Reply-To: <DB1B6B12D0E2F0469EB35A9586066B6ECE7974@stivesemail.stives.linx.gbr>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <DB1B6B12D0E2F0469EB35A9586066B6ECE7974@stivesemail.stives.linx.gbr>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Trying to get MTD to do anything...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> However, although I have enabled MTD in the kernel config, and all variou=
s
> options I think I need, during kernel boot there is no indication that th=
e
> MTD driver(s) is being started up - no scanning, no flash finds etc.
> Documentation for the patches for this board says MTD should be working.
> Kernel version is 2.6.10.

> My question (amongst many) is how do I get the MTD system to start up - w=
hat
> have I missed?

Sounds like you are probably missing a map file for you system.=20
drivers/mtd/maps/*.c

You can use the mainstone.c as a template.
