Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MddVn-0005w4-R4
	for linux-mtd@lists.infradead.org; Wed, 19 Aug 2009 05:15:08 +0000
Subject: Re: about ubifs question
From: Artem Bityutskiy <dedekind@infradead.org>
To: tommy <jiujin.hong@mid-fun.com>
In-Reply-To: <1250656786.11476.2.camel@tommy-desktop>
References: <1250656786.11476.2.camel@tommy-desktop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 19 Aug 2009 08:13:14 +0300
Message-Id: <1250658794.3885.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-08-19 at 12:39 +0800, tommy wrote:
> about ubifs work under Kernel suspend and resume
> 
> When Kernel resume from suspend by apm -s ,
> 
> i touch file in nand flash and sync,but when Kernel restart ,my touched
> file didn't occur!

How do you restart your kernel? Do you unmount cleanly?

> After Kernel resume ,i guess my touched file isn't in nand flash but
> memory !

Try typing sync before restarting.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
