Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqvLD-0000Li-Bw
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2010 21:59:36 +0000
Received: by vws11 with SMTP id 11so7662732vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Sep 2010 14:59:34 -0700 (PDT)
Subject: Re: [PATCH v2] mtd-www: NAND-DATA: Added NAND support table
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <4C7D8D57.3060103@gmail.com>
References: <4C75FF39.9010709@gmail.com> <1282802549.24044.267.camel@localhost>
	<1283171651.12995.58.camel@brekeke>
	<4C7C5E43.3070409@gmail.com> <4C7C6120.3080805@gmail.com>
	<4C7D8D57.3060103@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 00:59:31 +0300
Message-ID: <1283378371.2209.37.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Philip Rakity <prakity@yahoo.com>,
	Kevin Cernekee <cernekee@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-08-31 at 16:16 -0700, Brian Norris wrote:
> Included new NAND Flash support table. This table includes data about
> various NAND chips as well as information about the MTD subsystem's
> support for these chips. The table is provided in CSV format and is
> sorted, formatted, and output to an HTML page via a Python script
> (added to Makefile). New entries can simply be added as new rows in
> the CSV document.
> 
> Note: I did not link this into the main site yet. I can follow-up later
> if you'd like, or feel free to do so yourself.
> 
> Philip Rakity contributed to fixing the build script.

Pushed to mtd-www, thanks:

http://linux-mtd.infradead.org/nand-data/nanddata.html

And since you did not add a reference to this table anywhere, I had find
it a good place, and found it here:

http://linux-mtd.infradead.org/doc/nand.html

but I'm not sure it is the good place.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
