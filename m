Received: from mgw-ext01.nokia.com ([131.228.20.93])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1F1jPr-0005fH-Ot
	for linux-mtd@lists.infradead.org; Wed, 25 Jan 2006 07:06:32 -0500
Date: Wed, 25 Jan 2006 14:06:09 +0200
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: Kyungmin Park <kyungmin.park@samsung.com>
Message-ID: <20060125120609.GB31115@angel.research.nokia.com>
References: <20060124124710.GA29129@angel.research.nokia.com>
	<0ITN00AYE0Y14Q@mmp2.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ITN00AYE0Y14Q@mmp2.samsung.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Erase verify problem with OneNAND
Reply-To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Kyungmin

The erase verify problem disappeared with your patch.

Before your patch the erase verify problem appeared every time I flashed
the root file system and booted the board. After adding dataram selection, 
the problem is gone.

Jarkko
