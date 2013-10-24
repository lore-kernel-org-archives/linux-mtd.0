Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZOkx-0000T6-0x
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 17:31:35 +0000
Date: Thu, 24 Oct 2013 14:31:04 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: UBIFS: assert failed in ubifs_tnc_next_ent
Message-ID: <20131024173103.GA2500@localhost>
References: <20131023220950.GW23337@ld-irv-0074.broadcom.com>
 <20131024013150.GB23337@ld-irv-0074.broadcom.com>
 <20131024164144.GC23337@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131024164144.GC23337@ld-irv-0074.broadcom.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 24, 2013 at 09:41:44AM -0700, Brian Norris wrote:
> On Wed, Oct 23, 2013 at 06:31:50PM -0700, Brian Norris wrote:
> > I'll retry on 3.12-rc and with a few extra backported
> > fixes on 3.8.
> 
> It looks like I was just missing a few upstream bugfixes. That's what I
> get for not properly following -stable properly :(
> 
> With the additional backporting of these two commits, my filesystem
> tests survived overnight:
> 
>   commit 2928f0d0c5ebd6c9605c0d98207a44376387c298
>   Author: Adam Thomas <adamthomas1111@gmail.com>
>   Date:   Sat Feb 2 22:32:31 2013 +0000
> 
>       UBIFS: fix use of freed ubifs_orphan objects
> 
>   commit 8afd500cb52a5d00bab4525dd5a560d199f979b9
>   Author: Adam Thomas <adamthomas1111@gmail.com>
>   Date:   Sat Feb 2 22:35:08 2013 +0000
> 
>       UBIFS: fix double free of ubifs_orphan objects
> 
> Sorry for the noise. I guess this is a lesson for others, though. Greg
> KH isn't joking when he says "all users must upgrade"!
> 

Interesting findings and interesting lesson :-)

I'll keep this in mind and thanks for sharing your findings!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
