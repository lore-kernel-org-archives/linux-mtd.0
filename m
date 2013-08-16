Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAKJ2-0002Xh-P6
 for linux-mtd@lists.infradead.org; Fri, 16 Aug 2013 13:43:09 +0000
Message-ID: <1376660886.2089.359.camel@sauron.fi.intel.com>
Subject: Re: [PATCH -next 0/4] mtd: tests: reduce more code duplication and
 fixes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Date: Fri, 16 Aug 2013 16:48:06 +0300
In-Reply-To: <1376574909-7507-1-git-send-email-akinobu.mita@gmail.com>
References: <1376574909-7507-1-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Vikram Narayanan <vikram186@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-08-15 at 22:55 +0900, Akinobu Mita wrote:
> This patch set fixes some problems in the patch set 'mtd: tests: reduce
> duplication among mtd tests modules' and reduces more duplication by
> incorporating the error messages into mtdtest_read() and mtdtest_write().

Pushed all to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
