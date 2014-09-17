Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUHeb-0005Jv-V8
 for linux-mtd@lists.infradead.org; Wed, 17 Sep 2014 16:00:26 +0000
Message-ID: <1410969580.28850.125.camel@sauron.fi.intel.com>
Subject: Re: Destructive nandtest?
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Rostislav Lisovy <lisovy@gmail.com>
Date: Wed, 17 Sep 2014 18:59:40 +0300
In-Reply-To: <1410967880.5542.8.camel@lp-lvrv.comap.cz>
References: <1410884555.23903.13.camel@lp-lvrv.comap.cz>
 <20140916192610.GB1193@ld-irv-0074>
 <1410967880.5542.8.camel@lp-lvrv.comap.cz>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Michal Vokac <michal.vokac@comap.cz>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Ezequiel =?ISO-8859-1?Q?Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-09-17 at 17:31 +0200, Rostislav Lisovy wrote:
> I have some proof-of-concept code that does store the OOB (and
> restores
> it later) and is able to distinguish if the page is erased or not (in
> a
> bit naive manner -- if the page is all 0xff and particular ECCs as
> well)
> and decide is the data should be restored or not.
> I hope I will be able to post the code soon.

Ideally, the relevant pieces of code should be shared between nanddump,
nandwrite, and nanttest.

-- 
Best Regards,
Artem Bityutskiy
