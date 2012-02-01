Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsWEX-0000sp-4N
 for linux-mtd@lists.infradead.org; Wed, 01 Feb 2012 09:12:05 +0000
Received: by wgbdt13 with SMTP id dt13so676489wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 01 Feb 2012 01:12:03 -0800 (PST)
Date: Wed, 1 Feb 2012 11:11:53 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFC/PATCH] mtd: m25p80: set writebufsize
Message-ID: <20120201111153.3c1fe085@pixies.home.jungo.com>
In-Reply-To: <CAN8TOE-Yt445aXE_sA9xo8ycV4EQB=5OtwL6yyfPBGusYd93CA@mail.gmail.com>
References: <1327997163-9354-1-git-send-email-computersforpeace@gmail.com>
 <CAGiDA6Jw52CGM6KT5EANaGb8xxQQEH0Lf5ms24NGZLeMtqgjGA@mail.gmail.com>
 <CAN8TOE-Yt445aXE_sA9xo8ycV4EQB=5OtwL6yyfPBGusYd93CA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "Shawn J. Goff" <shawn7400@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
 linux-mtd@lists.infradead.org, agust@denx.de,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 31 Jan 2012 09:46:40 -0800 Brian Norris <computersforpeace@gmail.com> wrote:
> I'm wondering now: how do we guarantee that we're picking the
> *correct* writebufsize and not just one that *works*? It's only used
> by UBI, I think, so it depends on UBI's needs.
> 

According to mtd.h, 'writebufsize' should be set to the "Size of the
write buffer used by the MTD".

m25p->page_size should be set to the size of the device's data buffer
(used by the Page Program operation).

Hence for m25p80, 'flash->mtd.writebufsize = flash->page_size' seems
right.

BTW 'writebufsize' is propagated to UBI's 'max_write_size' which
currently affects UBIFS write-buffer size.

It should be set to "the maximum amount of bytes the underlying flash is
able to program at a time" (according to ubifs/io.c).

Hence again, for m25p80, 'flash->page_size' seems adequate.

Regards
Shmulik
