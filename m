Received: from imladris.infradead.org ([194.205.184.45] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16w0WN-000189-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2002 13:51:19 +0100
Received: from gate.aminocom.com
	([193.132.141.181] helo=aminocom.com ident=0)
	by phoenix.infradead.org with esmtp (Exim 3.35 #5)
	id 16w0Up-0006ya-00
	for linux-mtd@lists.infradead.org; Fri, 12 Apr 2002 13:49:43 +0100
Received: from aminocom.com (eclarke@eclarke.aminocom.com [10.171.23.32])
	by aminocom.com (8.11.6/8.11.6) with ESMTP id g3CCmcO26112
	for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2002 13:48:38 +0100
Message-ID: <3CB6D75D.A9E144C7@aminocom.com>
Date: Fri, 12 Apr 2002 13:47:25 +0100
From: Elizabeth Clarke <eclarke@aminocom.com>
MIME-Version: 1.0
To: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Writing JFFS2 image to Nand flash
References: <541025071C7AC24C84E9F82296BB9B95080502@OPTEX1.optex.local>
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
> I'm having problems writing a JFFS2 image to a Nand flash device whose
> first block is bad. cp and dd fail in this case. Do I need to write a
> utility that checks for bad blocks and skips them, or am I missing
> something?

What messages is it giving? debug enabled? are you using the JFFS2 code
from the jffs2_nand_branch code from cvs?

Beth
