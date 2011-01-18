Received: from mail-fx0-f67.google.com ([209.85.161.67])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pf8DC-0004SK-2z
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 09:50:53 +0000
Received: by fxm17 with SMTP id 17so2520520fxm.6
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Jan 2011 01:50:46 -0800 (PST)
Subject: Re: validate_sb: bad superblock, error 8 (Minimum UBI volume size
	for UBIFS image)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andrew Murray <amurray@mpcdata.com>
In-Reply-To: <1295343055.2470.105.camel@koala>
References: <AANLkTikGddyMhxph92Dz7vpRNRKa2haQne7yxKBTKw3N@mail.gmail.com>
	<1295342200.2470.97.camel@koala>  <1295343055.2470.105.camel@koala>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Jan 2011 11:50:42 +0200
Message-ID: <1295344242.2470.117.camel@koala>
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

On Tue, 2011-01-18 at 11:30 +0200, Artem Bityutskiy wrote:
> On Tue, 2011-01-18 at 11:16 +0200, Artem Bityutskiy wrote:
> > Anyway, the only way for the user to affect the minimum FS size is the
> > --jrn-size option of mkfs.ubifs. How to calculate what will be the
> > minimum? Not sure, probably UBIFS_MIN_JNL_LEBS = 5 LEBs or something
> > close to this.
> 
> Ah, this is wrong, you can set the log size with --log-lebs as well.
> 
> So UBIFS journal = log + buds.
> 
> --log-lebs set the log size
> --jrn-size sets the buds size.

And note, strictly speaking --jrn-size is about buds size. This is
confusing naming. But I think we wanted to hide complexities from the
user and make him think that the journal is some area of fixed size, and
--jrn-size defines it. But probably that was a bad idea, not sure.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
