Received: from fed1mtao02.cox.net ([68.6.19.243])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17eIgO-0004iD-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 18:08:44 +0100
Subject: Re: tiny JFFS2 Reader
From: Russ Dill <Russ.Dill@asu.edu>
To: Tino Keitel <tino.keitel@innominate.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20020812085533.A24857@gateway.bln.gelonet.local>
References: <20020810163019.19590.qmail@mailFA12.rediffmail.com>
	<20020812085533.A24857@gateway.bln.gelonet.local>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 12 Aug 2002 10:08:32 -0700
Message-Id: <1029172113.19462.2.camel@russ>
Mime-Version: 1.0
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

On Sun, 2002-08-11 at 23:55, Tino Keitel wrote:
> On Sat, Aug 10, 2002 at 16:30:19 -0000, sriram  neelakandan wrote:
> > Hi group,
> > I am looking for a tiny jffs2 reader that can read a file from a 
> > jffs2 partition..
> > the code in jffs2reader.c in the MTD utils tar
> > mtd-20000704.tar.gz (hope this is the latest)
> > does not have the logic to read beyond the first node of the 
> > file.
> 
> There was a project called load_kernel at
> http://russ.dhs.org/load_kernel.html, but this web server doesn't exist
> anymore. It contains all code to look for a file called "linux" on a
> cramfs oder jffs2 image and read it (including zlib decompression).
> Maybe you want to contact the author (try Russ.Dill@asu.edu). I could
> also send you the archive.

it exists, it just moved to port 8000, also, the code is in blob cvs
