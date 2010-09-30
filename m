Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1Jw0-0004WK-Qw
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 14:16:33 +0000
Received: by iwn41 with SMTP id 41so3035729iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Sep 2010 07:16:30 -0700 (PDT)
MIME-Version: 1.0
Sender: glikely@secretlab.ca
In-Reply-To: <841976.76219.qm@web180306.mail.gq1.yahoo.com>
References: <841976.76219.qm@web180306.mail.gq1.yahoo.com>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Thu, 30 Sep 2010 23:16:09 +0900
Message-ID: <AANLkTinBDdEyMDt3KoauNdmTCz1ZAJ5mZ23iMWiwsUm4@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] mtd: m25p80: add a read function to read page by
	page
To: David Brownell <david-b@pacbell.net>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linuxppc-dev@ozlabs.org, Mingkai Hu <Mingkai.hu@freescale.com>,
	linux-mtd@lists.infradead.org, kumar.gala@freescale.com,
	spi-devel-general@lists.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 30, 2010 at 7:46 PM, David Brownell <david-b@pacbell.net> wrote:
>
> --- On Thu, 9/30/10, Mingkai Hu <Mingkai.hu@freescale.com> wrote:
>
>> From: Mingkai Hu <Mingkai.hu@freescale.com>
>> Subject: [PATCH v3 6/7] mtd: m25p80: add a read function to read page by page
>
> NAK.
>
> We went over this before.

Yes, I agree with David on this.  If large transfers don't work, then
it is the SPI master driver that is buggy.

g.
