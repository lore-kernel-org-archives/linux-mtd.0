Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1F643n-000259-7Y
	for linux-mtd@lists.infradead.org; Mon, 06 Feb 2006 05:57:39 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Kroff <kroff2@free.fr>
In-Reply-To: <43E729C6.3010801@free.fr>
References: <43E729C6.3010801@free.fr>
Content-Type: text/plain
Date: Mon, 06 Feb 2006 13:56:53 +0300
Message-Id: <1139223413.4090.2.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Test on NAND Flash
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-02-06 at 11:49 +0100, Kroff wrote:
> Hello,
> 
> I work now on NAND Flash and I have to do measurements on it. I would 
> like to know how you access to the memory ? On Linux you use the mtd 
> API, isn't it ? For windows any idea ? Do you have direct access so that 
> you can do your own GC and wear leveling qnd bypass the FTL? You do your 
> test with a standard USB Key or something else ?
> 
1. Yes, we use MTD
2. No idea about Windows
3. Base flash devices have no built-in FTL and we work with them
directly.
4. I personally use flash simulators: mtdram and nandsim.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
