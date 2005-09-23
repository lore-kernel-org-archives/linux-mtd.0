Received: from bay17-f31.bay17.hotmail.com ([64.4.43.81] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIklV-0004tH-2X
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2005 11:26:49 +0100
Message-ID: <BAY17-F3118D3CF10B5EEDFDB67CEE8960@phx.gbl>
In-Reply-To: <4333CAF3.3070004@inf.u-szeged.hu>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: havasi@inf.u-szeged.hu
Date: Fri, 23 Sep 2005 18:24:33 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: dedekind@yandex.ru, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Erase block header(revision 1)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
>I have only one big problem with this patch. I'm strongly against to
>introduce INCOMPAT nodes JFFS2_NODETYPE_DIRENT_EBH and
>JFFS2_NODETYPE_INODE_EBH just to make unusable new JFFS2 images for old
>JFFS2 code on NAND devices, too. Do I understand well: is this the only
>reason?

Yes. We have decided to remove JFFS2_NODETYPE_DIRENT_EBH and
JFFS2_NODETYPE_INODE_EBH.

I'll send out a patch to fix all these problems next week.

Have a happy weekend!

Forrest
