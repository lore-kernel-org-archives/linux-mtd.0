Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUYrK-0003Ij-JL
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 09:50:27 +0000
Message-ID: <1396259402.9016.60.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mkfs.ubifs: correct and improve LEB size error prints
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 31 Mar 2014 12:50:02 +0300
In-Reply-To: <1395470744-7281-1-git-send-email-computersforpeace@gmail.com>
References: <1395470744-7281-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Fri, 2014-03-21 at 23:45 -0700, Brian Norris wrote:
> The error message is incorrect for "too small LEB size" -- we were
> printing the minimum I/O size instead of the LEB size.
> 
> At the same time, let's print the max LEB size along with the message
> for "too large LEB size", to be consistent and more helpful.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> 			       UBIFS_MIN_LEB_CNT);

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy
