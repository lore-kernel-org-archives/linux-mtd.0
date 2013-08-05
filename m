Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6KMF-00020M-UC
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2013 12:57:56 +0000
Message-ID: <1375707773.14869.452.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/6] mtd: nandsim: convert pages_written[] to bitmap
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Date: Mon, 05 Aug 2013 16:02:53 +0300
In-Reply-To: <1374978118-11418-1-git-send-email-akinobu.mita@gmail.com>
References: <1374978118-11418-1-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2013-07-28 at 11:21 +0900, Akinobu Mita wrote:
> nandsim.pages_written[] is the array of unsigned char which is indexed
> by the page number and used for identifying which pages have been written
> when cache_file is used.  Each entry holds 0 (not written) or 1 (written),
> so it can be converted to bitmap.  This reduces the allocation size of
> pages_written[] by 1/8.

Pushed all to l2-mtd.git, thanks.

I wonder, what is your motivation for doing this? Did you just notice
the imperfection and decided to fix it, or you really suffer from too
much memory allocated?

Thanks!

-- 
Best Regards,
Artem Bityutskiy
