Received: from finch-post-12.mail.demon.net ([194.217.242.41])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vLO7-00010t-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 May 2001 16:51:31 +0100
Received: from activesilicon.demon.co.uk ([212.228.31.28] helo=activesilicon.co.uk)
	by finch-post-12.mail.demon.net with esmtp (Exim 2.12 #1)
	id 14vLOT-000GHu-0C
	for linux-mtd@lists.infradead.org; Thu, 3 May 2001 15:51:53 +0000
Received: from p90nt4 (p90nt4.activesilicon.co.uk [192.168.1.64])
	by activesilicon.co.uk (8.11.3/8.11.3) with SMTP id f43Fpnm31015
	for <linux-mtd@lists.infradead.org>; Thu, 3 May 2001 16:51:49 +0100
Message-ID: <01C0D3F1.55B02480.chris.read@activesilicon.co.uk>
From: Chris Read <chris.read@activesilicon.co.uk>
Reply-To: "chris.read@activesilicon.co.uk"
	 <chris.read@activesilicon.co.uk>
To: "Mtd (E-mail)" <linux-mtd@lists.infradead.org>
Subject: RE: Wear Leveling in JFFS2 NOT working!(?) 
Date: Thu, 3 May 2001 16:51:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

There are applications where a deeply embedded system may get power cycled 
frequently; thus I would advocate that wear levelling should work correctly 
in this case.

Chris Read

On 03 May 2001 16:30, David Woodhouse [SMTP:dwmw2@infradead.org] wrote:
>
> vipin.malik@daniel.com said:
> > As hypothesized, the every few minutes cycling was what was screwing up
> > the wear leveling algorithm. After the cycling stopped, all sectors
> > showed up in the log and additionally each was cycled the same number
> > of times!
>
> Good :)
>
> > In my opinion, there should be no need to fix the algorithm to
> > accommodate the frequent cycling. Power going down every few minutes
> > is (usually) NOT a normal mode of operation of an embedded system.
>
> It's not normal, but given that it's quite easy for us to deal with it by
> attempting to start in a different place each time, we might as well do 
so.
>
> If it were more difficult, I'd be inclined to agree with you that it's 
not
> worth the effort.
>
> --
> dwmw2
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
