Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d3km9-0005pA-K8
 for linux-mtd@lists.infradead.org; Thu, 27 Apr 2017 14:52:11 +0000
Received: by mail-oi0-x22b.google.com with SMTP id j201so40351011oih.2
 for <linux-mtd@lists.infradead.org>; Thu, 27 Apr 2017 07:51:47 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <13610ad7-6362-1342-9d96-76a491f279af@wedev4u.fr>
References: <963d5dab-f6a5-daea-4e12-8b5fd0f5d1e6@wedev4u.fr>
 <13610ad7-6362-1342-9d96-76a491f279af@wedev4u.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 27 Apr 2017 16:51:46 +0200
Message-ID: <CAK8P3a3Y7ErtAc84S+AoCydgOonikCn1Q30JN441rhmdEa7f_g@mail.gmail.com>
Subject: Re: [PULL] mtd: spi-nor: changes for 4.12
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 Linux MTD Development List <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ludovic Barre <ludovic.Barre@st.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 27, 2017 at 4:42 PM, Cyrille Pitchen
<cyrille.pitchen@wedev4u.fr> wrote:
> + Ludovic and Arnd
>
> Hi Brian,
>
> A little patch was sent by Arnd to fix some module compilation issue up.
> https://patchwork.ozlabs.org/patch/755980/
>
> As said, in this other thread, I can either
>
> 1 -  squash Arnd patch into Ludovic's one in the 'next' branch of
> github/spi-nor, create a new tag and send you a new PR.
>
> or
>
> 2 - keep Arnd patch as is and send you a new PR: still starting from
> 4.11-rc1 or from the current for-4.12 tag?
>
> Let me know the solution you prefer :)
> Sorry for this additional delay!

I don't care much either way, folding the fix probably makes a nicer
git history.

       Arnd
