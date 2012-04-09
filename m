Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SH7FP-0002C1-DY
 for linux-mtd@lists.infradead.org; Mon, 09 Apr 2012 05:34:40 +0000
Received: by bkcjk13 with SMTP id jk13so4155896bkc.36
 for <linux-mtd@lists.infradead.org>; Sun, 08 Apr 2012 22:34:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <071A08F2C6A57E4E94D980ECA553F8745F3F98@039-SN1MPN1-005.039d.mgd.msft.net>
References: <071A08F2C6A57E4E94D980ECA553F8745E82D5@039-SN1MPN1-005.039d.mgd.msft.net>
 <CAN8TOE-0GPgbfgrps-ieQb9NYnOFv79TZdxhTyd_ydPboP_8Pg@mail.gmail.com>
 <071A08F2C6A57E4E94D980ECA553F8745EEA99@039-SN1MPN1-005.039d.mgd.msft.net>
 <CAN8TOE9P9NvD+sRB8MurCkETDKmKUmvkq_M-3kCF+0zaZgsjTg@mail.gmail.com>
 <CAMjpGUf+nEV09MWb5e2kzjJq0SAQGq=iqce2rzt9UON6wkji8w@mail.gmail.com>
 <071A08F2C6A57E4E94D980ECA553F8745F3F98@039-SN1MPN1-005.039d.mgd.msft.net>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 9 Apr 2012 01:34:15 -0400
Message-ID: <CAMjpGUc6=H+4QfJmtU7+HY=anP-V5-Ogdmf__NRGQJCjcyHXjQ@mail.gmail.com>
Subject: Re: Query mtd-utils v1.4.9 : flash_erase.c
To: Kushwaha Prabhakar-B32579 <B32579@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: Wood Scott-B07421 <B07421@freescale.com>,
 "stanley.miao@windriver.com" <stanley.miao@windriver.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 8, 2012 at 23:55, Kushwaha Prabhakar-B32579 wrote:
> Yes I am fully agree. I have a question about few patches send long back by "Stanley Miao".
> They are as follows:
>
> http://patchwork.ozlabs.org/patch/56261/
> http://patchwork.ozlabs.org/patch/56262/
> http://patchwork.ozlabs.org/patch/56263/
>
> These patches were never delegated/applied as state are still "New".
>
> These patches can become a good base for new patches.
>
> Do anyone has any idea; why were these never applied/delegated?

they'll certainly need rebasing now as the code has changed, and i can
see some issues that need addressing, but fundamentally, those seem
like a good idea
-mike
