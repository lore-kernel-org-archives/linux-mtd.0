Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTYAO-0006jw-M4
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 09:31:28 +0000
Subject: Re: UBI FS mounting time
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bosi Daniele <Daniele.Bosi@mta.it>
In-Reply-To: <531B6536C9F737458807DF75064873C8303DD7D768@mta-digimail.MTA.INT>
References: <531B6536C9F737458807DF75064873C8303DD7D768@mta-digimail.MTA.INT>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 22 Jul 2009 12:30:42 +0300
Message-Id: <1248255042.24676.60.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-07-21 at 19:00 +0200, Bosi Daniele wrote:
> We have a UBI+UBIFS 1GB partition on a NAND chip, which takes around 6s to mount.
> 
> We'd like to have the data available at least read-only earlier than that.
> 
> We know UBI on principle needs to read the map of all blocks in order to rebuild the logical view of the memory, but maybe there's another way around it to make it available earlier...
> 
> Someone know how?

I've just created a FAQ entry where I put several ideas:
http://www.linux-mtd.infradead.org/faq/ubi.html#L_attach_faster

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
