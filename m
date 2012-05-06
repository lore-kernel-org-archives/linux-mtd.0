Received: from eddie.linux-mips.org ([78.24.191.182] helo=cvs.linux-mips.org)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SQvWI-00024v-6D
 for linux-mtd@lists.infradead.org; Sun, 06 May 2012 07:04:39 +0000
Received: from localhost.localdomain ([127.0.0.1]:38129 "EHLO
 localhost.localdomain" rhost-flags-OK-OK-OK-OK)
 by eddie.linux-mips.org with ESMTP id S1903611Ab2EFHEd (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Sun, 6 May 2012 09:04:33 +0200
Date: Sun, 6 May 2012 08:04:33 +0100 (BST)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: David Daney <ddaney.cavm@gmail.com>
Subject: Re: [PATCH 1/2] MIPS: Kbuild: remove -Werror
In-Reply-To: <4F9AD14E.9060008@gmail.com>
Message-ID: <alpine.LFD.2.00.1205060754390.19691@eddie.linux-mips.org>
References: <1335534510-12573-1-git-send-email-dedekind1@gmail.com>
 <4F9AD14E.9060008@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ralf Baechle <ralf@linux-mips.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 27 Apr 2012, David Daney wrote:

> > MIPS build fails with the standard W=1 Kbuild switch with because of the
> > -Werror gcc switch.
> > 
> > This patch removes the gcc switch to make W=1 work. Mips is the only
> > architecture I know which does not build with W=1 and this upsets my aiaiai
> > scripts. And in general, you never know which warnings newer versions of gcc
> > will start emiting so having -Werror by default is not the best idea.
> > 
> > Signed-off-by: Artem Bityutskiy<artem.bityutskiy@linux.intel.com>
> 
> I think the warning messages are enough, we don't need to break things.

 I disagree.  People generally don't fix their broken code just because it 
triggers warnings.  The cases where GCC is genuinely confused are the 
minority -- and even if so, chances are the human reader of that code will 
also be.

  Maciej
