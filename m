Received: from mail-ew0-f43.google.com ([209.85.215.43])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Prkfv-00071v-I2
	for linux-mtd@lists.infradead.org; Tue, 22 Feb 2011 05:20:40 +0000
Received: by ewy22 with SMTP id 22so1031278ewy.16
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Feb 2011 21:20:37 -0800 (PST)
Subject: Re: UBIFS recovery stops
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <20110221165517.15e897ea@wker>
References: <20110221165517.15e897ea@wker>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 22 Feb 2011 07:20:33 +0200
Message-ID: <1298352033.20562.2.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-02-21 at 16:55 +0100, Anatolij Gustschin wrote:
> 
> The small corrupted data area in the flash seems to result
> from an uncompleted write operation: repeated reading from
> this area shows, that the bit values flip. 


Sounds like the unstable bits issue reported by Matthieu CASTET
<matthieu.castet@parrot.com>. This needs some fixes both in UBI and
UBIFS. I tried to describe the issue here:
http://git.infradead.org/ubi-2.6.git/blobdiff/a87f29cbbcbd5bd1e4990367cd18967e9bbeacff..a20a51b6d779463b0f1f2fcc81b6fa1225c49e92:/drivers/mtd/ubi/scan.c

I am going to work on this as soon as I have some time. But any help is
appreciated.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
