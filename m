Received: from 228-216.205.122.dellhost.com ([216.205.122.228] helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kuta-0007Wx-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2002 22:37:26 +0000
Content-Type: text/plain;
  charset="iso-8859-15"
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Subject: Re: UnitSizeFactor of != 1 yet? 
Date: Tue, 12 Mar 2002 17:46:53 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200203121747718.SM01632@there>
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

On Thu, 7 Mar 2002, David Woodhouse wrote:

> Did anyone test the patches for UnitSizeFactor != 1 yet?

David,

I have been trying the UnitSizeFactor patches, and have seen two issues:

1) On line 131 of nftlmount.c, ReplUnitTable is accessed before it is 
allocated, causing an oops message.  

2) A freshly formatted DoC Millennium (with doc504.exb firmware) returns a 
UnitSizeFactor of 0x00.

Mark
