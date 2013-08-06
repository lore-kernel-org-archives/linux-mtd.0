Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6hqi-00078i-99
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2013 14:02:56 +0000
Message-ID: <1375798078.30770.145.camel@sauron.fi.intel.com>
Subject: Re: [PATCH -next v2 00/10] mtd: tests: reduce duplication among mtd
 tests modules
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Date: Tue, 06 Aug 2013 17:07:58 +0300
In-Reply-To: <1375523536-32671-1-git-send-email-akinobu.mita@gmail.com>
References: <1375523536-32671-1-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com.au>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Vikram Narayanan <vikram186@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
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

On Sat, 2013-08-03 at 18:52 +0900, Akinobu Mita wrote:
> This patch set reduces code duplication among mtd/tests modules by
> moving common helper functions into mtd_test.c. 
> 

You could make this nicer by incorporating the error messages to the
common handlers, and removing them from tests - they are almost the same
everywhere.

But this is anyway a good clean-up, so pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
