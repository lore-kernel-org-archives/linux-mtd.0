Received: from mga02.intel.com ([134.134.136.20] helo=orsmga101-1.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FZ295-0008R7-OV
	for linux-mtd@lists.infradead.org; Thu, 27 Apr 2006 04:46:48 -0400
Message-ID: <445084EC.400@intel.com>
Date: Thu, 27 Apr 2006 12:46:36 +0400
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: Jorn Engel <joern@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701F5D409@NNSMSX401>
	<20060426155116.GL29108@wohnheim.fh-wedel.de>
In-Reply-To: <20060426155116.GL29108@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jorn Engel wrote:
>
> Once you have the above fixed up and checked all the code for similar
> problems, I'll take another look.
>

Thanks for review, Jorn. I'll fix those coding/documentation guidelines 
and sanity/exception checks you have mentioned. Then post again, hope 
with usage of writev() functions of underlying devices.

Alexander

-------
The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue
