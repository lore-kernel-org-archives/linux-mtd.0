Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K5Zw5-0005Ad-W7
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 05:28:54 +0000
Date: Mon, 9 Jun 2008 07:28:42 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Bruce_Leonard@selinc.com
Subject: Re: mtd_info->size again (lengthy)
Message-ID: <20080609052841.GE13200@logfs.org>
References: <20080608121020.GA13200@logfs.org>
	<OF900336E0.BD21AFA6-ON88257463.0019C3EA-88257463.0019F5E4@selinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OF900336E0.BD21AFA6-ON88257463.0019C3EA-88257463.0019F5E4@selinc.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 8 June 2008 21:43:33 -0700, Bruce_Leonard@selinc.com wrote:
> Jörn Engel <joern@logfs.org> wrote on 06/08/2008 05:10:20 AM:
> 
> > And while at it, replace the 32bit size with a 64bit blockno and 32bit
> > offset.  Unless someone is stupid enough to create devices with 4G
> > erasesize, that should last for a human lifetime or something close.
> 
> What kind of block is blockno?  An erase block (which is 128K in my case) 
> or a write block (2K)?

eraseblock

Jörn

-- 
Those who come seeking peace without a treaty are plotting.
-- Sun Tzu
