Received: from smtp.fh-landshut.de ([193.175.141.50])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BGeZ9-0003KJ-Ca
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2004 14:48:35 +0100
Message-ID: <4087CCDF.2050004@fh-landshut.de>
Date: Thu, 22 Apr 2004 15:47:11 +0200
From: Oliver Korpilla <okorpil@fh-landshut.de>
MIME-Version: 1.0
To: Dmitry Konyshev <dmitry.konyshev@auriga.ru>
References: <4087C0EF.7090202@fh-landshut.de> <4087C999.4000805@auriga.ru>
In-Reply-To: <4087C999.4000805@auriga.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Kernel panic on ftl_format
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dmitry Konyshev wrote:
> Oliver Korpilla wrote:
> 
>> I'm trying to get my Linux to boot its root filesystem from flash
>> (JFFS2) on the following hardware:
>>
>    There's no need in ftl when using jffs2, it is only needed when using 
> "traditional" filesystems upon mtds.
>    Just mount jffs2 on the block mtd device (don't forget to previously 
> erase the device using erase(all) utility) and you're done.

Thanks, and I'll keep that in mind, but eraseall failed, too, the same
way. I'll try again, though, just to be sure.

Oliver Korpilla
