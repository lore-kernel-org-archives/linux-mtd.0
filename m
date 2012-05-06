Received: from eddie.linux-mips.org ([78.24.191.182] helo=cvs.linux-mips.org)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SQvXs-00027k-1C
 for linux-mtd@lists.infradead.org; Sun, 06 May 2012 07:06:16 +0000
Received: from localhost.localdomain ([127.0.0.1]:38291 "EHLO
 localhost.localdomain" rhost-flags-OK-OK-OK-OK)
 by eddie.linux-mips.org with ESMTP id S1903611Ab2EFHGP (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Sun, 6 May 2012 09:06:15 +0200
Date: Sun, 6 May 2012 08:06:15 +0100 (BST)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 2/2] MIPS: bcm63xx: kbuild: remove -Werror
In-Reply-To: <1335534510-12573-2-git-send-email-dedekind1@gmail.com>
Message-ID: <alpine.LFD.2.00.1205060804400.19691@eddie.linux-mips.org>
References: <1335534510-12573-1-git-send-email-dedekind1@gmail.com>
 <1335534510-12573-2-git-send-email-dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 27 Apr 2012, Artem Bityutskiy wrote:

> From: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
> 
> I cannot build bcm963xx with the standard Kbuild W=1 switch:
> 
> arch/mips/bcm63xx/boards/board_bcm963xx.c: At top level:
> arch/mips/bcm63xx/boards/board_bcm963xx.c:647:5: error: no previous prototype for 'bcm63xx_get_fallback_sprom' [-Werror=missing-prototypes]
> cc1: all warnings being treated as errors
> 
> This patch removes the gcc switch to make W=1 work. Mips is the only
> architecture I know which does not build with W=1 and this upsets my aiaiai
> scripts. And in general, you never know which warnings newer versions of gcc
> will start emiting so having -Werror by default is not the best idea.

 If the function has no prototype, then it cannot be reasonably used from 
outside -- perhaps you meant to mark it static instead?

  Maciej
