Received: from inp.nsk.su ([193.124.167.24] helo=inpbox.inp.nsk.su)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bmlxp-00074o-P7
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2004 00:10:53 -0400
Date: Tue, 20 Jul 2004 11:07:27 +0700
From: "Dmitry A. Fedorov" <D.A.Fedorov@inp.nsk.su>
To: Rainer Weikusat <rainer.weikusat@sncag.com>
In-Reply-To: <87smbn747h.fsf@farside.sncag.com>
Message-ID: <Pine.SGI.4.10.10407201056530.252050-100000@Sky.inp.nsk.su>
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

On Tue, 20 Jul 2004, Rainer Weikusat wrote:

> "Dmitry A. Fedorov" <D.A.Fedorov@inp.nsk.su> writes:
> 
> > Well, what about generic physmap board module?
> > I can make patch.
> 
> I could provide you with one, if you wanted to use it (enables
> configuration of arbitrarily mapped distinct flash chips via command
> line, a sample looks like this:
> 
> CONFIG_CMDLINE="root=/dev/mtdblock2 physmap=phys_0:0x200000@0x2800000:2,phys_1:0x800000@0x2a00000:2 mtdparts=phys_0:128k(boot),-(root);phys_1:64k(top),8064k(main),64k(bottom)"

Thanks a lot, give that to me.
