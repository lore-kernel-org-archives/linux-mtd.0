Received: from bay17-f4.bay17.hotmail.com ([64.4.43.54] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIdvu-0003X8-Cd
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 23:09:18 -0400
Message-ID: <BAY17-F4A95E389D8C2DAC614952E8960@phx.gbl>
In-Reply-To: <43329ED5.7070909@yandex.ru>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: dedekind@yandex.ru
Date: Fri, 23 Sep 2005 11:08:55 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
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


>
>zhao forrest wrote:
> > Your comments for the revised patch are welcome :)
>
>It is supposed that you eliminated cleanmarkers completely, right?
>Why then I still see functions like jffs2_check_nand_cleanmarker()?
>--

We'll allow mount old JFFS2 image if it used 1:1 mapping. So
during mount scan we need to scan both cleanmarker and eraseblock
header. So I don't change the name. Maybe a new name like
jffs2_check_nand_cleanmarker_ebh() is better.

Thanks,
Forrest
