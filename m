Received: from eddie.linux-mips.org ([78.24.191.182] helo=cvs.linux-mips.org)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SQwtB-0004N3-0F
 for linux-mtd@lists.infradead.org; Sun, 06 May 2012 08:32:22 +0000
Received: from localhost.localdomain ([127.0.0.1]:45219 "EHLO
 localhost.localdomain" rhost-flags-OK-OK-OK-OK)
 by eddie.linux-mips.org with ESMTP id S1903614Ab2EFIcR (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Sun, 6 May 2012 10:32:17 +0200
Date: Sun, 6 May 2012 09:32:17 +0100 (BST)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] MIPS: Kbuild: remove -Werror
In-Reply-To: <1336289676.1996.3.camel@koala>
Message-ID: <alpine.LFD.2.00.1205060925070.3701@eddie.linux-mips.org>
References: <1335534510-12573-1-git-send-email-dedekind1@gmail.com>
 <4F9AD14E.9060008@gmail.com>
 <alpine.LFD.2.00.1205060754390.19691@eddie.linux-mips.org>
 <1336289676.1996.3.camel@koala>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ralf Baechle <ralf@linux-mips.org>, David Daney <ddaney.cavm@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 6 May 2012, Artem Bityutskiy wrote:

> >  I disagree.  People generally don't fix their broken code just because it 
> > triggers warnings.  The cases where GCC is genuinely confused are the 
> > minority -- and even if so, chances are the human reader of that code will 
> > also be.
> 
> Aggressive opinion, nothing more. A patch which fixes the real issue a
> better way would be way more respectful.

 I didn't trigger the issue, so I have nothing to fix.  I would if it was 
me who did.

 And my opinion is based on experience.  Please check the LMO archives for 
why Ralf added this option in the first place -- many years ago.  It's 
probably recorded in the git repository too (I'm not sure if the option 
was added before or after we moved away from CVS, but in any case old 
change logs have been imported when our current repo was created).

  Maciej
