Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SDHQy-00049g-57
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2012 15:38:44 +0000
Received: by ggnk1 with SMTP id k1so1764083ggn.36
 for <linux-mtd@lists.infradead.org>; Thu, 29 Mar 2012 08:38:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120209185043.GA12089@joshcartwright.net>
References: <20120209185043.GA12089@joshcartwright.net>
Date: Thu, 29 Mar 2012 08:38:41 -0700
Message-ID: <CAN8TOE-9fxbc8PM8oNVBc_tUdkYBhV6jTG8_M5GdjLNGpLhKKA@mail.gmail.com>
Subject: Re: [PATCH] jffs2: Fix lock acquisition order bug in gc path
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Cartwright <joshc@linux.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 9, 2012 at 10:50 AM, Josh Cartwright <joshc@linux.com> wrote:
> The locking policy is such that the erase_complete_block spinlock is
> nested within the alloc_sem mutex. =A0This fixes a case in which the
> acquisition order was erroneously reversed. =A0This issue was caught by
> the following lockdep splat:

(Bump.) Anybody interested in this patch? It seemed sane to me, and I
had it sitting in my inbox. It does need a trivial rebase, BTW.

Brian
