Received: from mga14.intel.com ([143.182.124.37])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5x8h-00007f-Od
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 10:33:37 +0000
Message-ID: <1331289353.22872.58.camel@sauron.fi.intel.com>
Subject: Re: Problems with mtd_oobtest
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matej Kupljen <matej.kupljen@gmail.com>
Date: Fri, 09 Mar 2012 12:35:53 +0200
In-Reply-To: <CAHMF36Gy9r2mPRrahpbAMvwOE=jWD3jzWqpF4846gG6saHjZ-w@mail.gmail.com>
References: <CAHMF36Gy9r2mPRrahpbAMvwOE=jWD3jzWqpF4846gG6saHjZ-w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2012-02-28 at 08:02 +0100, Matej Kupljen wrote:
> Is there anything I am doing wrong?
> Should I provide any more information?

I guess you can provide more information about corruptions, how they
happen, etc. Also, take a look at the unstable bits issue: 

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits

I this issue hits you, JFFS2 won't help since it does not have it solved
as well.

-- 
Best Regards,
Artem Bityutskiy
