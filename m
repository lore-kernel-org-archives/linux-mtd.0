Received: from fmr20.intel.com ([134.134.136.19] helo=orsfmr005.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ed2MT-0000ux-CI
	for linux-mtd@lists.infradead.org; Fri, 18 Nov 2005 04:16:56 -0500
From: "zhao, forrest" <forrest.zhao@intel.com>
To: David Jander <david.jander@protonic.nl>
In-Reply-To: <200511171227.20593.david.jander@protonic.nl>
References: <200511171227.20593.david.jander@protonic.nl>
Content-Type: text/plain
Date: Fri, 18 Nov 2005 17:11:28 +0800
Message-Id: <1132305088.18546.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Performance of wear-levelling in JFFS2.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-11-17 at 13:27 +0200, David Jander wrote:
> Hi,
> 
> I am wondering about how good wear-levelling really is in JFFS2. I have made 
> an experiment which ended with a "MTD do_write_buffer(): software timeout", 
> which really looks like flash is taking too long to write data because of it 
> beeing near end of life. Only thing is, although the experiment has lasted 
> quite long already (in terms of amount of data (re-)written), it doesn't seem 
> anyway near as long as expected, when making some "educated guesses" about 
> the perfomrance of jffs2. 

This is really good! By my patch for erase count tracking in
JFFS2, you may read the erase count of each erase block using jffs2dump.

My patch for enhanced WL is also in MTD CVS now. You may also test how
good this new WL is :)

For testing, I think using RAM test driver is enough when we can know
the erase count of each erase block.

Thanks,
Forrest
