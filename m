Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FsbxG-0005iB-69
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 04:51:38 -0400
Message-ID: <4497B6ED.3050701@yandex.ru>
Date: Tue, 20 Jun 2006 12:50:53 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: haver@vnet.ibm.com
Subject: Re: [UBI] Remove autotools from ubi-utils
References: <625fc13d0606142102j46277f81gf45a6bf784dc6c90@mail.gmail.com>
	<1150720046.6087.34.camel@localhost.localdomain>
In-Reply-To: <1150720046.6087.34.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@wohnheim.fh-wedel.de>,
	Josh Boyer <jwboyer@gmail.com>,
	Linux-MTD Mailing List <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Frank Haverkamp wrote:
> * ubiwritevol - Artem liked the name ubiupdatevol better
Indeed, UBI allows only "update" operations from, userspace, not random 
writes...

> Artem wanted to beautify libubi, but that is something different.
Butify is not really suitable word here. I'd say to write it from 
scratch cleanly :-)

Yes, I've finished most UBI TODOs, and now I want to write few 
user-space tests. I certainly want to have them on top of a decent UBI 
library.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
