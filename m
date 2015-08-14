Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQJfq-0001tR-73
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 18:25:50 +0000
Received: by pdbfa8 with SMTP id fa8so33566270pdb.1
 for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2015 11:25:28 -0700 (PDT)
Date: Fri, 14 Aug 2015 11:25:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Jonas Gorski <jogo@openwrt.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 1/2] nand: pxa3xx: Increase READ_ID buffer and make the
 size static
Message-ID: <20150814182524.GM60523@google.com>
References: <1438612286-16070-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1438612286-16070-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <CAOiHx==8WbSqy=1XPGR5G4=hFouV55bNe_Y82k1Pby4+Yn+rxw@mail.gmail.com>
 <871tf5c08x.fsf@belgarion.home>
 <CAAEAJfDqpHXS53D5dysKUUt3930sGTg5Jv+NCpuM8HrUQPkzGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfDqpHXS53D5dysKUUt3930sGTg5Jv+NCpuM8HrUQPkzGQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 14, 2015 at 03:07:51PM -0300, Ezequiel Garcia wrote:
> Brian, if you can drop this patch, I'll send a new one.

Dropped. Because I am occasionally a git heretic, I have rewritten the
history.

Brian
