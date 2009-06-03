Received: from smtp127.sbc.mail.sp1.yahoo.com ([69.147.65.186])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MC05z-0002Az-ET
	for linux-mtd@lists.infradead.org; Wed, 03 Jun 2009 23:42:18 +0000
From: David Brownell <david-b@pacbell.net>
To: davinci-linux-open-source@linux.davincidsp.com
Subject: Re: [PATCH 2.6.30-rc6 1/3] NAND: Add "page" parameter to all
	read_page/read_page_raw APIs
Date: Wed, 3 Jun 2009 16:42:03 -0700
References: <1242682683-19772-1-git-send-email-nsnehaprabha@ti.com>
	<C9D59C82B94F474B872F2092A87F261481797EB6@dlee07.ent.ti.com>
In-Reply-To: <C9D59C82B94F474B872F2092A87F261481797EB6@dlee07.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200906031642.03620.david-b@pacbell.net>
Cc: "Paulraj, Sandeep" <s-paulraj@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 01 June 2009, Paulraj, Sandeep wrote:
> Anything comments on this patch?

I think Sneha was going to reissue the third patch, to address
some minor goofage with the OOB layout used.

Once that's done, it looked to me like it was time to just
queue these three patches for 2.6.31 ... nobody had any
objections to the $SUBJECT patch, or the second patch which
added the NAND_ECC_HW_OOB_FIRST mode.
