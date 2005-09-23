Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIjrC-0000zi-KR
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2005 05:28:51 -0400
Message-ID: <4333CAF3.3070004@inf.u-szeged.hu>
Date: Fri, 23 Sep 2005 11:29:23 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: zhao forrest <zhao_fusheng@hotmail.com>
References: <BAY17-F141EA92F45DB70328CE1C5E8960@phx.gbl>
In-Reply-To: <BAY17-F141EA92F45DB70328CE1C5E8960@phx.gbl>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
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

Hi Zhao,

First of all: your implementation of EBH summary support a good job,
congratulation!

I noticed only two things:

+        case JFFS2_NODETYPE_ERASEBLOCK_HEADER:
+            s->sum_size +=
JFFS2_SUMMARY_EBH_SIZE(je16_to_cpu(item->eh.dsize)*4);

Here I think you should use sizeof(uint32_t) instead of simple 4, as you
used it otherwhere. I's a very small thing, I know.

The other is related to it: if I were you I would store eh.dsize in
bytes, not in uint32. In every other places of JFFS2 the size is stored
byte based (if I am right), and there is no need to always multible by
sizeof(uint32_t) if the real size is needed.

I have only one big problem with this patch. I'm strongly against to
introduce INCOMPAT nodes JFFS2_NODETYPE_DIRENT_EBH and
JFFS2_NODETYPE_INODE_EBH just to make unusable new JFFS2 images for old
JFFS2 code on NAND devices, too. Do I understand well: is this the only
reason?

Ferenc
