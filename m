Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16BBNr-0000ec-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Dec 2001 08:56:59 +0000
Date: Tue, 4 Dec 2001 10:07:35 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Aleksander Sanochkin <asanochkin@lnxw.com>, linux-mtd@lists.infradead.org
Subject: Re: JFFS1/MTD bug-fixes
Message-ID: <20011204100735.A15389@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.33.0112030726090.14716-100000@newbast.lynuxworks.com> <11102.1007394901@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11102.1007394901@redhat.com>; from dwmw2@infradead.org on Mon, Dec 03, 2001 at 03:55:01PM +0000
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

Hi!

> >  We have also added a possibility for run-time partitioning of an MTD
> > device, and use this usage_counter to prevent deleting of a partition
> > while it is being used by some process.
> 
> In that context, I agree that it makes sense. Have you seen Jörn Engel's
> rewrite of the partitioning code, which I was intending to look at merging
> in 2.5? It would be useful to make that does what you require before we
> merge it.

http://wh.fh-wedel.de/~joern/software/kernel/
http://wh.fh-wedel.de/~joern/software/kernel/mtd.patch.core.2.4.15

Not having seen any code, I fear that your patch won't easily merge
with mine. But I would like to have a look - it might get rid of some
dear old problems, commonly known as reboot. :)

Jörn

-- 
When writing gateway software of any kind, take pains to disturb 
the data stream as little as possible -- and *never* throw 
away information unless the recipient forces you to!
