Date: Thu, 13 Nov 2008 13:48:36 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH][nandsim]Fix RAM wasting via kmalloc (take 2)
In-Reply-To: <1226581562.16925.44.camel@sauron>
Message-ID: <alpine.LFD.2.00.0811131342400.31593@casper.infradead.org>
References: <alpine.LFD.1.10.0810291313140.30280@casper.infradead.org>
	<1226581562.16925.44.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,


> 
> Would you please send a version which checks return pointer of
> kmem_cache_alloc() for NULL?

Thank for reminder. I've just found your message you sent just before the holidays. It was about kmem_cache_create function. 
Sorry I missed it. I've sent the updated-patch.

Thanks,
Alexey
