Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HTJcG-0002EU-8P
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 11:17:48 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HTJbr-000274-Rd
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 16:17:19 +0100
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 16:17:19 +0100
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 16:17:19 +0100
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: [PATCH] [MTD] NAND: Enhance nandsim optionally to report wear -
	Typo
Date: Mon, 19 Mar 2007 15:17:07 +0000 (UTC)
Message-ID: <loom.20070319T161517-665@post.gmane.org>
References: <45FE6A7A.3070705@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adrian Hunter <ext-adrian.hunter <at> nokia.com> writes:

> 
> A new module parameter 'rptwear' specifies how many erases between
> reporting wear information.  Zero means never.
> 
> Signed-off-by: Adrian Hunter <ext-adrian.hunter <at> nokia.com>
> ---
>  drivers/mtd/nand/nandsim.c |   98 +++++++++++++++++++++++++++++++++++++
>  1 files changed, 98 insertions(+), 0 deletions(-)
> 
....
> 
>  MODULE_PARM_DESC(first_id_byte,  "The fist byte returned by NAND Flash 'read
ID' command (manufaturer ID)");

Typo in
MODULE_PARM_DESC(first_id_byte,  "The fist byte returned by NAND Flash

should read "first" not "fist"

MikeW
