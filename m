Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MC4PD-0005i3-9q
	for linux-mtd@lists.infradead.org; Thu, 04 Jun 2009 04:18:27 +0000
From: "Paulraj, Sandeep" <s-paulraj@ti.com>
To: David Brownell <david-b@pacbell.net>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>
Date: Wed, 3 Jun 2009 23:16:57 -0500
Subject: RE: [PATCH 2.6.30-rc6 1/3] NAND: Add "page" parameter to all
	read_page/read_page_raw APIs
Message-ID: <C9D59C82B94F474B872F2092A87F261480EDEF1A@dlee07.ent.ti.com>
References: <1242682683-19772-1-git-send-email-nsnehaprabha@ti.com>
	<C9D59C82B94F474B872F2092A87F261481797EB6@dlee07.ent.ti.com>,
	<200906031642.03620.david-b@pacbell.net>
In-Reply-To: <200906031642.03620.david-b@pacbell.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "Narnakaje,
	Snehaprabha" <nsnehaprabha@ti.com>,
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

Ok.

I'll be submitting that patch as Sneha is unavailable for the next 5 weeks
________________________________________
From: David Brownell [david-b@pacbell.net]
Sent: Wednesday, June 03, 2009 7:42 PM
To: davinci-linux-open-source@linux.davincidsp.com
Cc: Paulraj, Sandeep; Narnakaje, Snehaprabha; linux-mtd@lists.infradead.org=
; dwmw2@infradead.org; tglx@linutronix.de; akpm@linux-foundation.org
Subject: Re: [PATCH 2.6.30-rc6 1/3] NAND: Add "page" parameter to all read_=
page/read_page_raw APIs

On Monday 01 June 2009, Paulraj, Sandeep wrote:
> Anything comments on this patch?

I think Sneha was going to reissue the third patch, to address
some minor goofage with the OOB layout used.

Once that's done, it looked to me like it was time to just
queue these three patches for 2.6.31 ... nobody had any
objections to the $SUBJECT patch, or the second patch which
added the NAND_ECC_HW_OOB_FIRST mode.
