Received: from [216.205.122.235] (helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Hq4i-0008DG-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 19:09:00 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 and Grub
Date: Tue, 11 Jun 2002 14:08:35 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200206111405453.SM02488@there>
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

On Tue, 11 Jun 2002, Ilguiz Latypov wrote:

> erase_all /dev/mtd0
> doc_loadbios /dev/mtd0 grub_firmware

Ilguiz,

Is the "erase_all" necessary?  Does this delete the Bad Block Table on the 
DoC 2000 or Millennuim?

I was able to get a Millennium booting without any "erase_all" commands.  I 
guess I'm not clear on why this is needed.

Thanks,

Mark
