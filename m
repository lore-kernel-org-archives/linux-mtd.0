Received: from mail-db9lp0250.outbound.messaging.microsoft.com
 ([213.199.154.250] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UkPmF-0003vf-Ti
 for linux-mtd@lists.infradead.org; Thu, 06 Jun 2013 02:18:12 +0000
Message-ID: <51AFF1FB.1070100@freescale.com>
Date: Thu, 6 Jun 2013 10:20:43 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 3/3] mtd: cfi_cmdset_0002: increase do_write_buffer()
 timeout
References: <1370310406-413-1-git-send-email-computersforpeace@gmail.com>	<1370310406-413-3-git-send-email-computersforpeace@gmail.com>	<51AD9140.90500@freescale.com>	<CAN8TOE9UDGuQd9AbE-4UVcAiqCFpqhY=fX+LbrDybdgr16THdQ@mail.gmail.com>
 <CAN8TOE8FRtQupXwvAtrVSN-C-nQz-XgOW7OA5C=XRs9YmCwTkg@mail.gmail.com>
In-Reply-To: <CAN8TOE8FRtQupXwvAtrVSN-C-nQz-XgOW7OA5C=XRs9YmCwTkg@mail.gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 Imre Deak <imre.deak@intel.com>, Kevin Cernekee <cernekee@gmail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA06=D4=C206=C8=D5 05:08, Brian Norris =D0=B4=B5=C0:
> Note that a 2-jiffy timeout does not, in fact, totally resolve my
> problems; with a timeout of 2 jiffies, I still get a timeout that
> (according to getnstimeofday()) occurs after only 56us. It does
since the 2-jiffy does not resolve your problem, i suggest you try the
latest linux-next
tree.


thanks
Huang Shijie
