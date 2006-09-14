Received: from web30505.mail.mud.yahoo.com ([68.142.200.118])
	by pentafluge.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GNu9V-0008B8-Kj
	for linux-mtd@lists.infradead.org; Thu, 14 Sep 2006 17:33:26 +0100
Message-ID: <20060914163219.74505.qmail@web30505.mail.mud.yahoo.com>
Date: Thu, 14 Sep 2006 09:32:19 -0700 (PDT)
From: Justin Treon <justin_treon@yahoo.com>
Subject: Re: JFFS2 ECC options
To: Davide CASCONE <davide.cascone@st.com>, linux-mtd@lists.infradead.org
In-Reply-To: <000f01c6d0e8$145e1ce0$d204960a@nap.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> I'm working with JFFS2 on a NAND device. In order to
> disable the software ECC is it enough to set the mtd
> field "nand.eccmode" to "NAND_ECC_NONE"? 
> If I do this, I have some CRC errors if JFFS2 file
> system includes a bad block. Is it right? Does the
> CRC check depend on the ECC options?
> 
> In order to use the summary support, is it enough to
> set the macro "CONFIG_JFFS2_SUMMARY" in the file
> ".config"? Do I have to re-make the file system
> image (that I create using the mkfs.jffs2 utility)
> in order to use it with the summary support?
> 

I have no idea about your first question.  You may
want to ask it again.  

Regarding summary support I have never been able to
make a jffs2 filing system that used summary support
with the mkfs.jffs2 tool that worked.  I create the
filing system with summary support on an empty chip
and then transfer the files. Please let me knhwo if
you get it to work with the mkfs.jffs2 tool.

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
