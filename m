Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HROzj-0003YE-TC
	for linux-mtd@lists.infradead.org; Wed, 14 Mar 2007 08:38:06 +0000
Message-ID: <45F7B311.3070109@nokia.com>
Date: Wed, 14 Mar 2007 10:32:17 +0200
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
To: haver@vnet.ibm.com
Subject: Re: [RFC] [PATCH] UBI: rewrite of sysfs.c
References: <200703131610.20161.alexs@linux.vnet.ibm.com>	
	<45F6D46C.8030100@nokia.com>
	<1173860695.4114.5.camel@localhost.localdomain>
In-Reply-To: <1173860695.4114.5.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Alexander Schmidt <alexs@linux.vnet.ibm.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Frank Haverkamp <haver@linux.vnet.ibm.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Frank Haverkamp wrote:
> Josh is representing some users too. But just in case I suggest, that we
> wait at least 2-3 days before we commit such interface changes, to give
> yet anomymous (in the world which are not in the German/Finish/US
> eastcoast timzone) users a chance to comment on this. I also discussed
> with Alex that we might want to enhance our ubi-utils to support the old
> and new interfaces to avoid possible trouble before we include the
> changes.

When I said "you" I meant IBM-ers :-)

Well, I actually suggest not to change it and just keep trying to get into
mainline. If somebody complain, we will ask him why and how. For now,
lets preserve sysfs as it is.

Comments?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
