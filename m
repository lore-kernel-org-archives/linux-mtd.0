Received: from mail-db8lp0184.outbound.messaging.microsoft.com
 ([213.199.154.184] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USeGo-0002IX-47
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2013 02:08:19 +0000
Message-ID: <516F55E4.2060502@freescale.com>
Date: Thu, 18 Apr 2013 10:09:40 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: cfi_cmdset_0002: do_write_buffer timeouts
References: <CAN8TOE8dVYxBbb8MtozFio8dS-ypq14U8RuKTo38QcAtXM5Qrw@mail.gmail.com>	<CAN8TOE8BRhgi_ep8xypA_OwF4qfJikztmUcc-+XDB7hjnopuUA@mail.gmail.com>	<5167A87A.3030002@aimvalley.nl>	<CAN8TOE_Em4g9vb=PYYimGvK9_7O5xPAWQwNs_wX9cnskTaXP5Q@mail.gmail.com>	<516BB279.9000000@freescale.com>
 <CAN8TOE-_cj6E_zuUyWdAwehC0aaNQB=Ks71Ub7EEHTQbiYpLtg@mail.gmail.com>
In-Reply-To: <CAN8TOE-_cj6E_zuUyWdAwehC0aaNQB=Ks71Ub7EEHTQbiYpLtg@mail.gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Norbert van Bolhuis <nvbolhuis@aimvalley.nl>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA04=D4=C218=C8=D5 05:45, Brian Norris =D0=B4=B5=C0:
> This patch doesn't solve my problem, so it seems that Huang and I
> probably are seeing different root causes for these timeouts.
>
yes. My timeout maybe caused by the error in the erase-suspend/erase-resu=
me.

thanks
Huang Shijie
