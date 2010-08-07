Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ohiry-00086e-HA
	for linux-mtd@lists.infradead.org; Sat, 07 Aug 2010 12:51:23 +0000
Received: by fxm3 with SMTP id 3so5477082fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 07 Aug 2010 05:51:21 -0700 (PDT)
Subject: Re: [PATCH 4/7] UBIFS: fix GC sroting
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <4C5D4D85.4000800@nokia.com>
References: <1281169577-18664-1-git-send-email-dedekind1@gmail.com>
	<1281169577-18664-5-git-send-email-dedekind1@gmail.com>
	<4C5D4D85.4000800@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 07 Aug 2010 15:51:18 +0300
Message-Id: <1281185478.1175.83.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-08-07 at 15:11 +0300, Adrian Hunter wrote:
> Artem Bityutskiy wrote:
> > From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> > 
> > Unfortunately, the comparison functions for both data and non-data nodes
> > ('data_nodes_cmp()' and 'nondata_nodes_cmp()') was screwed. It did not
> > work for the case when 'inuma == inumb' and 'blka > blkb' or 'hasha > hashb'.
> 
> Can you explain a bit more.  The old logic looks OK to me whereas the
> new logic would seem to make block 0x80000001 < 0x00000001 ?

Yes, I need to look once again at this...

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
