Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PrkwA-0007Cm-Po
	for linux-mtd@lists.infradead.org; Tue, 22 Feb 2011 05:37:27 +0000
Received: by eyh6 with SMTP id 6so1183469eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Feb 2011 21:37:24 -0800 (PST)
Subject: Re: UBIFS recovery stops
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <20110221165517.15e897ea@wker>
References: <20110221165517.15e897ea@wker>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 22 Feb 2011 07:37:21 +0200
Message-ID: <1298353041.20562.6.camel@koala>
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
> The small corrupted data area in the flash seems to result
> from an uncompleted write operation: repeated reading from
> this area shows, that the bit values flip. 

The first quick band-aid could be re-trying reading several times when
CRC error happens. This could improve things somewhat.

The proper solution is to make sure every LEB which could be being
written to at the power cut time gets erased on the next mount. Namely,
we need to do "atomic LEB change" for all journal heads when recovering.

Also, we need to be able to simulate unstable bits to efficiently test.
This is where I wanted to start from.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
