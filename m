Received: from fmr19.intel.com ([134.134.136.18] helo=orsfmr004.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EL9YY-00017P-Bo
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 21:19:34 -0400
From: root <forrest.zhao@intel.com>
To: dedekind@yandex.ru, joern@wohnheim.fh-wedel.de
In-Reply-To: <BAY17-F344C9EEA6AC6CEF83CBE2E88D0@phx.gbl>
References: <BAY17-F344C9EEA6AC6CEF83CBE2E88D0@phx.gbl>
Content-Type: text/plain
Date: Fri, 30 Sep 2005 09:15:29 +0800
Message-Id: <1128042929.13141.9.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase block header(revision 4)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-09-28 at 15:33 +0800, zhao forrest wrote:
> Hi,
> This is the forth version. Compared with version 3, the
> main changes are:
> 1 move "priv->jeb->has_ebh = 1;" from jffs2_erase_callback()
> to jffs2_erase_succeeded() to prevent eCos from being broken.
> 2 define ebh at the top of erase.c and this ebh is shared
> by jffs2_write_nand_ebh() in wbuf.c
> 3 remove unnecessary PAD() stuff
> 4 change has_ebh from uint32_t to one bit of flags
> 5 remove unnecessary dsize field from struct jffs2_raw_ebh{}
> 6 use ref_totlen() instead of directly getting __totlen.
> 
> The patch is at:
> http://www.infradead.org/~forrest/eraseblock_header_r4.patch
> 

I would assume the patch is accepted if there're no further
review comments for it........

Thanks,
Forrest
