Received: from a.ns.innominate.com ([212.21.76.70] helo=innominate.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17e9Ny-0003Mi-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 08:13:06 +0100
Date: Mon, 12 Aug 2002 08:55:33 +0200
From: Tino Keitel <tino.keitel@innominate.com>
To: linux-mtd@lists.infradead.org
Subject: Re: tiny JFFS2 Reader
Message-ID: <20020812085533.A24857@gateway.bln.gelonet.local>
References: <20020810163019.19590.qmail@mailFA12.rediffmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20020810163019.19590.qmail@mailFA12.rediffmail.com>; from oops2k@rediffmail.com on Sat, Aug 10, 2002 at 04:30:19PM -0000
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

On Sat, Aug 10, 2002 at 16:30:19 -0000, sriram  neelakandan wrote:
> Hi group,
> I am looking for a tiny jffs2 reader that can read a file from a 
> jffs2 partition..
> the code in jffs2reader.c in the MTD utils tar
> mtd-20000704.tar.gz (hope this is the latest)
> does not have the logic to read beyond the first node of the 
> file.

There was a project called load_kernel at
http://russ.dhs.org/load_kernel.html, but this web server doesn't exist
anymore. It contains all code to look for a file called "linux" on a
cramfs oder jffs2 image and read it (including zlib decompression).
Maybe you want to contact the author (try Russ.Dill@asu.edu). I could
also send you the archive.

Regards,
Tino

-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   networking people
tel: +49.30.6392-3308                      http://www.innominate.com/
