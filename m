Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cuqxm-0001sY-9c
	for linux-mtd@lists.infradead.org; Sat, 29 Jan 2005 06:40:27 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1106946232.7542.33.camel@windu.rchland.ibm.com>
References: <1106946232.7542.33.camel@windu.rchland.ibm.com>
Content-Type: text/plain
Date: Sat, 29 Jan 2005 14:39:53 +0300
Message-Id: <1106998793.17802.3.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: haverkam@de.ibm.com, linux-mtd@lists.infradead.org
Subject: Re: NAND partitioning
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> This concept extends to any sort of "binary" data that one would want on
> the device.  To access the data contained in said eraseblocks, one could
> write a device driver that understood the data and presented it to the
> user via a MTD device.
Josh,

Am I correct that you are thinking about the idea to have "binary" data
on flash which does not belong to JFFS2 and JFFS2 should just move it
iact from time to time reusing their blocks for better wear-leveling?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
