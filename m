Received: from inpbox.inp.nsk.su ([193.124.167.24])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BnWuL-00006B-TP
	for linux-mtd@lists.infradead.org; Thu, 22 Jul 2004 02:18:26 -0400
Date: Thu, 22 Jul 2004 13:07:30 +0700
From: "Dmitry A. Fedorov" <D.A.Fedorov@inp.nsk.su>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1090413135.13986.9.camel@weaponx.rchland.ibm.com>
Message-ID: <Pine.SGI.4.10.10407221254140.349821-100000@Sky.inp.nsk.su>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: starting address of mtd device
Reply-To: D.A.Fedorov@inp.nsk.su
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 Jul 2004, Josh Boyer wrote:

> > Jun Sun removed the CONFIG option support a while ago, and then
> > submitted a patch to the list that put it back.  Not sure why that patch
> > didn't make it into CVS...  it should have.
> 
> Jun Sun's patch is in CVS now.  CONFIG_MTD_PHSYMAP options are back.

Great thanks, now it works.
