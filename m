Received: from gate.aminocom.com
	([193.132.141.181] helo=aminocom.com ident=0)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16x8Hb-0006dC-00
	for <linux-mtd@lists.infradead.org>; Mon, 15 Apr 2002 16:20:43 +0100
Message-ID: <3CBAEF5E.A537C893@aminocom.com>
Date: Mon, 15 Apr 2002 16:18:54 +0100
From: Elizabeth Clarke <eclarke@aminocom.com>
MIME-Version: 1.0
To: John Hall <John.Hall@optionexist.co.uk>
CC: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Writing JFFS2 image to Nand flash
References: <541025071C7AC24C84E9F82296BB9B9508051A@OPTEX1.optex.local>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

John Hall wrote:

> > You should find a grep has them in wbuf.c. Are you setting
> > CONFIG_JFFS2_FS_NAND?
> Yes, CONFIG_JFFS2_FS_NAND is set. wbuf.c doesn't contain these
> functions. I had grepped fs/jffs2/*.[ch] for them.

Doh, helps if I read whats actually there. jffs2_flash_read_oob is a
define in 
os-linux.h. 

> This is the version of wbuf.c that I have:
> [john@morgan jffs2]$ cvs stat wbuf.c
> ===================================================================
> File: wbuf.c            Status: Up-to-date
> 
>    Working revision:    1.1.2.2
>    Repository revision: 1.1.2.2 /home/cvs/mtd/fs/jffs2/wbuf.c,v
>    Sticky Tag:          jffs2-nand-branch (branch: 1.1.2)

Interesting. Mine says revision 1.10. hmmm puzzled. 
I think I'd prompt dwmw2 for some words of wisdom....
Beth
