Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9vlE-0000PU-Pf
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 08:49:17 +0000
Received: by vxd2 with SMTP id 2so341385vxd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Apr 2011 01:49:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1302683341.2768.12.camel@localhost>
References: <1302646496-32261-1-git-send-email-maksim.rayskiy@gmail.com>
	<1302683190.2768.11.camel@localhost>
	<1302683341.2768.12.camel@localhost>
Date: Wed, 13 Apr 2011 01:49:15 -0700
Message-ID: <BANLkTinwRXGTSP+zhzY2jMiX_ymwabkc3w@mail.gmail.com>
Subject: Re: [PATCH v2] Fix gcc-4.5.2 "statement with no effect" warnings in
	UBIFS
From: Maksim Rayskiy <maksim.rayskiy@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

>> This patch does not compile and does not apply to the current tree. I'll
>> need to do a lot of massage as well because I dislike the "tabs as
>> dynamic spaces" style which you use, and the whole UBIFS code does not
>> use this approach, so I would like to maintain consistency.
>
> Sorry, it does compile with older UBIFS, but not with the current one.
>
>

I checked it against Linus tree. What tree you want me to use?
I am not clear what you want me to do with formatting.

Thanks,
Maksim.
