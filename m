Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTuBg-0007VW-Mb
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 11:11:09 +0000
Received: by fxm14 with SMTP id 14so4377129fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 04:11:05 -0700 (PDT)
Subject: RE: [PATCH v2] nand: nand_base: Always initialise oob_poi before
	writing OOB data
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
In-Reply-To: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A95632E@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
References: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A8DF591@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
	<1306396908.2785.152.camel@localhost>
	<E14CAA9D00C5044EACE0C59FC2A1C7F5059A95632E@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 14:06:47 +0300
Message-ID: <1307444807.11104.76.camel@localhost>
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

On Thu, 2011-05-26 at 17:15 +0200, THOMSON, Adam (Adam) wrote:
> Having looked briefly at the read side code in nand_base.c,
> it does look like it should be enough to remove the second
> memset and leave the read side code as is, but will examine
> it more thoroughly before I post a patch.

Any news? :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
