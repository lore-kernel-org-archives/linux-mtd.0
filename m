Received: from [192.109.80.15] (helo=ns1.logware.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17A3fQ-0005dX-00
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2002 08:02:44 +0100
Received: from exchange.ten.logware.de (exchange@exchange.ten.logware.de [10.220.10.26])
	by ns1.logware.de (8.11.6/8.11.6) with ESMTP id g4L6wcI17680
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2002 08:58:38 +0200
Message-ID: <71B37AB6576DD211AB7E008048CD4D3101ED392A@exchange.ten.logware.de>
From: Veikko Werner <veikko.werner@logware.de>
To: linux-mtd@lists.infradead.org
Subject: AW: Getting big flash onto motherboards. Will CF work? what   wil
	l?
Date: Tue, 21 May 2002 09:01:46 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> On Fri, 17 May 2002, john riehl wrote:
> 
> > At 08:51 PM 5/17/02 +0200, Robert Kaiser wrote:
> >  what
> > happens when cf loses power?
> 
> I understand that when a CF loses power while a write is in 
> progress, it
> may corrupt some blocks in such a way that they can not be recovered.

sure, but is this a problem only CF has? 
Or is it just a problem if we're using th wrong (non journaling) filesystem?

Veikko
