Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtXcG-0007HT-0P
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2015 09:10:56 +0000
Message-ID: <1446541826.6126.124.camel@gmail.com>
Subject: Re: UBIFS corruption after power cut - possibly unstable bits issue?
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Tim Harvey <tharvey@gateworks.com>, Richard Weinberger <richard@nod.at>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Huang Shijie <b32955@freescale.com>, Elie De Brauwer
 <eliedebrauwer@gmail.com>, Brian Norris <computersforpeace@gmail.com>
Date: Tue, 03 Nov 2015 11:10:26 +0200
In-Reply-To: <CAJ+vNU28eboKDTei09-rjWOTJ_17CPQ0+UxpOOuc0cr_kj0qhw@mail.gmail.com>
References: <CAJ+vNU3eu4qBxaZpDRY=Fidv=9iGmA5pq8b4yUfyBayLTos5oQ@mail.gmail.com>
 <562E8697.50207@nod.at>
 <CAJ+vNU1J+MvyWgY1FPv4G7TxQLDtPJWdWw=DP5+1h2HcTi-SxQ@mail.gmail.com>
 <562E9E0B.5030204@nod.at>
 <CAJ+vNU1GV1GxYfLgHh2ZerAGjRxi=azXHLg_dNO=BaUrkkDU1w@mail.gmail.com>
 <562FD60E.9020807@nod.at>
 <CAJ+vNU28eboKDTei09-rjWOTJ_17CPQ0+UxpOOuc0cr_kj0qhw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2015-11-02 at 12:27 -0800, Tim Harvey wrote:
> [    9.507115] UBIFS error (ubi0:0 pid 1): ubifs_recover_master_node:
> failed to recover master node
> ^^^ master node recovery fails
> ...
> [    9.618335] Kernel panic - not syncing: VFS: Unable to mount root
> fs on unknown-block(0,0)

You need to enable debugging messages, and/or add some custom prints to
'get_master_node()', which for some reason returns an error and makes
'ubifs_recover_master_node()' fail. Figure out where it fails, and we
then can try figuring out why and may be fix it. Add custom printk's if
needed.
