Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5HTj-0006MW-3z
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2013 15:41:19 +0000
Message-ID: <1375458364.14869.348.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/6] mtd: nandsim: convert pages_written[] to bitmap
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Date: Fri, 02 Aug 2013 18:46:04 +0300
In-Reply-To: <1375454326.14869.325.camel@sauron.fi.intel.com>
References: <1374978118-11418-1-git-send-email-akinobu.mita@gmail.com>
 <1375454326.14869.325.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-08-02 at 17:38 +0300, Artem Bityutskiy wrote:
> On Sun, 2013-07-28 at 11:21 +0900, Akinobu Mita wrote:
> > nandsim.pages_written[] is the array of unsigned char which is indexed
> > by the page number and used for identifying which pages have been written
> > when cache_file is used.  Each entry holds 0 (not written) or 1 (written),
> > so it can be converted to bitmap.  This reduces the allocation size of
> > pages_written[] by 1/8.
> 
> Did you test this patch-set, if yes, how?

Note, I am asking because this is an ancient and probably poor piece of
code, but quite important, so I am just trying to understand whether I
should test your patches before applying, and if yes, how.

-- 
Best Regards,
Artem Bityutskiy
