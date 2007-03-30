Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HXG9e-0005Z9-Je
	for linux-mtd@lists.infradead.org; Fri, 30 Mar 2007 08:24:31 -0400
Message-ID: <460D015F.6080305@nokia.com>
Date: Fri, 30 Mar 2007 15:23:59 +0300
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
Subject: Re: [RFC] [PATCH] UBI: refine wear leveling logic
References: <200703281547.18851.alexs@linux.vnet.ibm.com>
	<1175164591.19966.20.camel@sauron>
	<200703291359.25593.alexs@linux.vnet.ibm.com>
In-Reply-To: <200703291359.25593.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexander Schmidt wrote:
> While writing this i assumed that erase and WL procedures are performed
> sequentially (either by the background thread or, if the bgt is disabled,
> by the produce_free_peb() function). Thank to your comment below I now
> realised that erase/wl procedures could happen concurrently if the free
> tree is empty and there are pending works (this is the only way that
> could lead to your error scenario, right?).

Yes, kind of.

> If so then i propose to make get_peb() wait until the bgt produces a free
> peb and not mix synchronous/asynchronous operations, as this would make
> the code easier, IMO.

It already does this AFAIK.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
