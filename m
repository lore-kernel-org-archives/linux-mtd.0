Received: from zmaj.etf.bg.ac.yu ([147.91.8.62])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16nHYl-0003br-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2002 11:13:44 +0000
Date: Tue, 19 Mar 2002 12:24:51 +0100
From: Veselin Mijuskovic <panzer@etf.bg.ac.yu>
To: Ilguiz Latypov <ilatypov@superbt.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 + GRUB/LILO booting problems
Message-ID: <20020319112451.GA24913@etf.bg.ac.yu>
References: <20020318161750.GA22895@etf.bg.ac.yu> <Pine.LNX.4.44.0203181430360.23362-100000@server.superbt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0203181430360.23362-100000@server.superbt.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Ilguiz Latypov [Mon, Mar 18, 2002 at 02:39:10PM -0500, Re: DOC2000 + GRUB/LILO booting problems]:
> 
> Veselin,
> 
> Can you enable DoC GRUB debug messages in stage2/shared.h?  Uncomment the
> DOC_DEBUG macro definition there.  One can add DOC_THOROUGH_DEBUG to see 
> the content of the first NFTL sector, a master boot record.
> 
> Ilguiz
> 

	I'll try that. You will have my report by Thursday.

Cheers,
-- 
 | \|/ Panzer (a.k.a Veselin Mijuskovic), Unix SysAdmin 
/|\ |  Computer Centre, School of Electical Engineering, University of Belgrade
-------------------------------------------------------------------------------
       Unix is very friendly, it's just picky about who its friends are
