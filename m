Received: from 235-216.205.122.dellhost.com ([216.205.122.235] helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AUrr-0007kM-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 May 2002 13:05:23 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Installation of DoC, HELP... 
Date: Wed, 22 May 2002 08:05:07 -0400
Cc: Gregory.Janiszewski@esisar.inpg.fr
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200205220802984.SM02488@there>
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

You may want to try reformatting your DOC with an earlier (4.2) version of 
the M-Sys DFORMAT program.  This should make the "UnitSizeFactor" equal to 1.

Mark

On Tue, 21 May 2002, Gregory Janiszewski wrote:
> I've got a big problem, I can't install my DoC2000 under Linux.
> I work with the RedHat 7.3, with a 2.4.18 kernel.

> NFTL driver: nftlcore.c $Revision: 1.86 $, nftlmount.c $Revision: 1.28 $
> NFTL: UnitSizeFactor 0x00 detected. This violates the spec but we think we
> know what it means...
