Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jyl8g-0002Vz-Oe
	for linux-mtd@lists.infradead.org; Wed, 21 May 2008 10:01:43 +0000
Date: Wed, 21 May 2008 12:01:33 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Markus Schiltknecht <markus@bluegap.ch>
Subject: Re: curious questions
Message-ID: <20080521100132.GA20943@logfs.org>
References: <4833E87D.10209@bluegap.ch> <20080521093827.GB20358@logfs.org>
	<4833F0CE.5010506@bluegap.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4833F0CE.5010506@bluegap.ch>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 May 2008 11:52:14 +0200, Markus Schiltknecht wrote:
> 
> So, with mtd, I can erase the erase-block spanning pages 0 to 63, and
> then, write to page 0, wait for more data and only then write page 1, right?

You can also erase/write other blocks in the meantime.

Jörn

-- 
Time? What's that? Time is only worth what you do with it.
-- Theo de Raadt
