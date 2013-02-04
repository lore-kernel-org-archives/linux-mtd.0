Received: from mail.windriver.com ([147.11.1.11])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U2NaA-00019Y-Ln
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 15:03:43 +0000
Message-ID: <510FCDD9.7060900@windriver.com>
Date: Mon, 4 Feb 2013 10:03:53 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
MIME-Version: 1.0
To: <artem.bityutskiy@linux.intel.com>
Subject: Re: [PATCH] mtd: fix random pointer dereference in OF device name
 handling
References: <1358967548-25491-1-git-send-email-paul.gortmaker@windriver.com>
 <1359965101.13791.11.camel@sauron.fi.intel.com>
In-Reply-To: <1359965101.13791.11.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13-02-04 03:05 AM, Artem Bityutskiy wrote:
> On Wed, 2013-01-23 at 13:59 -0500, Paul Gortmaker wrote:
>> Here is the output from an mpc8548 based board.  There are
>> three instances of missing device name here:
> 
> A similar fix is already in the linux-mtd.git tree.

OK, I see it in linux-next for 3.9 (commit 7dfe4be351e816) but
it needs to get to mainline/Linus before 3.8 gets released,
since that is where the regression is introduced (and that
is why I ended up not seeing the fix, and redoing it, as
I was working off of mainline).

$ git describe --contains d68cbdd4fb
v3.8-rc1~47^2~53

Thanks,
Paul.


> 
