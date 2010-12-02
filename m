Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PO0Cx-0000tW-L6
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 03:51:48 +0000
Received: by bwz5 with SMTP id 5so7111250bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Dec 2010 19:51:45 -0800 (PST)
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
In-Reply-To: <4CF4D4CA.8040906@aimvalley.nl>
References: <20101129195014.19224240@wker>  <4CF4D4CA.8040906@aimvalley.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Dec 2010 05:51:39 +0200
Message-ID: <1291261899.14534.15.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Eric_Holmberg@Trimble.com, Anatolij Gustschin <agust@denx.de>,
	linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-11-30 at 11:41 +0100, Norbert van Bolhuis wrote:
> Did you read the mail discussions
> "UBIFS Corrupt during power failure"
> dated april 2009 from Eric Holmberg.
> 
> He did some great work in making UBIFS on NOR flash
> more reliable for power-cuts.
> 
> One of the problems was UBI/UBIFS assumes a (CFI) write
> buffer size of 8 bytes. Maybe this is still the case.
> I think for your NOR flash it is 64 bytes though.

Would be nice if someone exposed this write buffer size in struct
mtd_info, then UBI/UBIFS could just use it.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
