Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIjmu-0000o7-1o
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2005 05:24:22 -0400
Message-ID: <4333C997.80004@yandex.ru>
Date: Fri, 23 Sep 2005 13:23:35 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: zhao forrest <zhao_fusheng@hotmail.com>
References: <BAY17-F4A95E389D8C2DAC614952E8960@phx.gbl>
In-Reply-To: <BAY17-F4A95E389D8C2DAC614952E8960@phx.gbl>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Adding eraseblock header support(revised version)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao forrest wrote:
>> It is supposed that you eliminated cleanmarkers completely, right?
>> Why then I still see functions like jffs2_check_nand_cleanmarker()?
> 
> We'll allow mount old JFFS2 image if it used 1:1 mapping. So
> during mount scan we need to scan both cleanmarker and eraseblock
> header. So I don't change the name. Maybe a new name like
> jffs2_check_nand_cleanmarker_ebh() is better.
> 
Ah, pardon... Then OK, IMO, no need to rename.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
