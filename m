Received: from 235-216.205.122.dellhost.com ([216.205.122.235] helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17MUiy-0007GU-00
	for <linux-mtd@lists.infradead.org>; Mon, 24 Jun 2002 15:21:48 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
Subject: Re: Trying to boot linux off a 2MiB M-Sys DoC2000 chip
Date: Mon, 24 Jun 2002 10:21:04 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: linux-mtd@lists.infradead.org
Message-Id: <200206241018875.SM02488@there>
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

Gonzalo Servat wrote:
> After all those errors I got a lot of "undefined reference to terminal"
> and "undefined reference to debug" and a few other undefined references
> and after an undef reference to 'chain_stage2' it exited and didn't
> finish compiling. Any ideas?

Hi Gonzalo,

Did you try updating automake and autoconf to the latest versions?  I had 
errors compiling GRUB with older versions, but I don't recall if they were 
the same as the errors you described.

Regards,

Mark
