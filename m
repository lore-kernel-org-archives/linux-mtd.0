Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBO5g-00036F-NI
	for linux-mtd@lists.infradead.org; Sun, 17 Apr 2011 09:16:25 +0000
Received: by eyh6 with SMTP id 6so1284443eyh.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Apr 2011 02:16:22 -0700 (PDT)
Subject: Re: UBI memory usage on large page nand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nicholas <ciliwung36@gmail.com>
In-Reply-To: <BANLkTin=dfsO9N02oVZg=kU3ghfymbzJWA@mail.gmail.com>
References: <AANLkTi=GsmJOjurETG930t-TW7uXLR1M6yKXWBSk7ebV@mail.gmail.com>
	<AANLkTik5qKMM3onfv=wsJFFHhO4t0C_8gAXUoGca2fKE@mail.gmail.com>
	<1301671910.2789.98.camel@localhost>
	<BANLkTi=pZqEwWYy=7mYQ_p73cHQ4rA6Rbg@mail.gmail.com>
	<1302873226.3220.43.camel@localhost>
	<1302873423.3220.45.camel@localhost>
	<BANLkTin=dfsO9N02oVZg=kU3ghfymbzJWA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 17 Apr 2011 12:16:14 +0300
Message-ID: <1303031774.2308.13.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-04-17 at 17:03 +0800, Nicholas wrote:
> Dear Artem,
> 
> Thanks for the advices. I'll try start for UBI first.
> 
> Reducing peb_buf would mean i need to modify the ubi IO for read/write.
> As i know, ubi did an erase for a whole block before start writing,
> 
> Please correct me if i've written in a wrong way.

Yes, when you investigate the code, you'll even find that if extra self
checks are enabled, UBI will verify that the area it writes to contains
only 0xFFs - it will read the area, compare with 0xFFs, and if all bytes
are 0xFFs it will proceed, otherwise it will shout loudly. See:

ubi_io_write() - all writes go through this function, and
ubi_dbg_check_all_ff - does the verification I talked about, but only in
debugging mode, because it is too costly to do it in production mode.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
