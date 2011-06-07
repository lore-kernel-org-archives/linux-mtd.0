Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTvxh-0000xI-VW
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:04:50 +0000
Received: by fxm14 with SMTP id 14so4462025fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:04:48 -0700 (PDT)
Subject: RE: [PATCH v2] nand: nand_base: Always initialise oob_poi before
	writing OOB data
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
In-Reply-To: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A9CEE2C@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
References: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A8DF591@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
	<1306396908.2785.152.camel@localhost>
	<E14CAA9D00C5044EACE0C59FC2A1C7F5059A95632E@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
	<1307444807.11104.76.camel@localhost>
	<E14CAA9D00C5044EACE0C59FC2A1C7F5059A9CEE2C@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 16:00:30 +0300
Message-ID: <1307451630.11104.82.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-07 at 15:00 +0200, THOMSON, Adam (Adam) wrote:
> Apologies. Have been sidetracked with other work. Have put changes
> together but want to check them over just so I'm happy, in particular
> verifying them on some hardware to make sure all still works as
> expected. Hopefully should have something in the next week for
> you. :o)

OK, thanks, although next week I'll be busy and sidetracked :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
