Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Ct1XF-0008Nr-Nq
	for linux-mtd@lists.infradead.org; Mon, 24 Jan 2005 05:33:31 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Vahid Fereydunkolahi <fereydunk@yahoo.com>
In-Reply-To: <20050121181719.56377.qmail@web51007.mail.yahoo.com>
References: <20050121181719.56377.qmail@web51007.mail.yahoo.com>
Content-Type: text/plain
Date: Mon, 24 Jan 2005 13:32:57 +0300
Message-Id: <1106562777.4650.7.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Performance of the MTD device and JFFS2
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-01-21 at 10:17 -0800, Vahid Fereydunkolahi wrote:
> I erased the whole flash. I copied a 500KB file to the
> NAND flash. Then I copied the file from the NAND flash
> to the same directory with different name. This means
> read and write operation on empty flash. With the old
> version it takes around 2 seconds, with the new
> version it takes more than 12 seconds (I am using the
> ZLIB for compression).
> 
> I wish I had the version iformation of the old MTD and
> JFFS2, but I do not (It should be from 4 month ago).
> 
> --vahid
> 
Sorry Vahid, don't know what happened. May only suggest:
1. Check may be your NAND flash driver has degraded. Why do you think
the reason is JFFS2?
2. Try to profile your linux system.
3. Try to find your old linux..
