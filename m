Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjWS8-0005yY-Pf
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2012 14:09:15 +0000
Received: by bkwj4 with SMTP id j4so4642304bkw.36
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2012 07:09:07 -0700 (PDT)
Date: Tue, 26 Jun 2012 17:09:02 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 8/8] mtd: nand: use ECC, if present, when scanning OOB
Message-ID: <20120626170902.7aba4a2b@pixies.home.jungo.com>
In-Reply-To: <1340408145-24531-9-git-send-email-computersforpeace@gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-9-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Mike Dunn <mikedunn@newsguy.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, 22 Jun 2012 16:35:45 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> scan_read_raw_oob() is used in only in places where the MTD_OPS_PLACE_OOB
> mode is preferable MTD_OPS_RAW mode, so use MTD_OPS_PLACE_OOB instead.

Please consider rephrasing, text is bit confusing.

> + * Scan read data from data+OOB. May traverse multiple pages, interleaving
> + * page,OOB,page,OOB,... in buf.

In the case 'len' is less than 'mtd->writesize' (possible from a
'scan_block_full' call), the read oob will be placed immediately after
the partially read page, quoting scan_read_raw_oob:

		ops.len = min(len, (size_t)mtd->writesize);
		ops.oobbuf = buf + ops.len;

Any idea if this is intentional or a bug?

Regards,
Shmulik
