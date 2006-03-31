Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FPF3G-0000UM-1u
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 03:32:19 -0500
Message-ID: <442CE8ED.2020501@yandex.ru>
Date: Fri, 31 Mar 2006 12:31:41 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Alexander Belyakov <alexander.belyakov@intel.com>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>	<20060330121156.GA31749@wohnheim.fh-wedel.de>
	<442CD1CB.7050509@intel.com> <442CE0E8.1080105@yandex.ru>
	<442CE431.5050700@intel.com>
In-Reply-To: <442CE431.5050700@intel.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexander Belyakov wrote:
> I followed the already existing example for partitions.h in the same 
> mphysmap.c file. Just thought it's OK. I'll try to fix that, thanks.

You know, Linux is eveloping, and older code is not always the best 
coding example. If you read LKML, you should have noticed how strict 
people are, a lot of those patches which would had been accepted in the 
past are blamed and rejected now. And this is normal IMO, people study 
on their own mistakes.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
