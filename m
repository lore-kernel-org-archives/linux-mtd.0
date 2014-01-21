Received: from mail-pd0-f175.google.com ([209.85.192.175])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5dfa-0001nr-4a
 for linux-mtd@lists.infradead.org; Tue, 21 Jan 2014 15:55:18 +0000
Received: by mail-pd0-f175.google.com with SMTP id w10so3080816pde.20
 for <linux-mtd@lists.infradead.org>; Tue, 21 Jan 2014 07:54:48 -0800 (PST)
Date: Tue, 21 Jan 2014 23:54:34 +0800
From: Huang Shijie <shijie8@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: nand_ids: Add device parameters for Toshiba's
 TC58NVG1S3ETAI0 NAND EEPROM
Message-ID: <20140121155432.GA1416@gmail.com>
References: <1389089083-29694-1-git-send-email-sr@denx.de>
 <20140120190441.GJ8919@ld-irv-0074>
 <20980858CB6D3A4BAE95CA194937D5E73EA685A2@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA685A2@DBDE04.ent.ti.com>
Cc: Stefan Roese <sr@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 21, 2014 at 07:33:04AM +0000, Gupta, Pekon wrote:
> Hi Brian,
> 
> But sincerely, why is Toshiba doing all this ?
> It would hit them only, as their devices will lack support on mainline kernels and u-boots.
> (Or their customers would have to carry custom patches all along).
> I tried convincing Toshiba to get their parts ONFI compliant, but they were too reluctant.
In actullay, Toshiba has began to support the JEDEC standard now.

see my patch set.

thanks
Huang Shijie
