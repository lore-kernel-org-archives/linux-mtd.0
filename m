Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vib2G-0004Vi-SU
 for linux-mtd@lists.infradead.org; Tue, 19 Nov 2013 02:27:29 +0000
Message-ID: <528ACD45.7030900@freescale.com>
Date: Tue, 19 Nov 2013 10:30:29 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 7/8] mtd: gpmi: change pr_err to dev_err
References: <1384410351-2169-1-git-send-email-b32955@freescale.com>
 <1384410351-2169-8-git-send-email-b32955@freescale.com>
 <20131118202340.GC9468@ld-irv-0074.broadcom.com>
In-Reply-To: <20131118202340.GC9468@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8819=E6=97=A5 04:23, Brian Norris =E5=86=99=
=E9=81=93:
> Hmm, many of these pr_err() are wholely uninformative. They are only
> useful for someone who is doing low-level debugging fo the driver, not
> for users. At most, they should be {dev_dbg,pr_debug} messages, but
> really, they should be removed.
ok. I will remove these lines in the next patch.

thanks
Huang Shijie
