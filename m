Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5bOE-0002cy-Fx
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2012 11:20:11 +0000
Message-ID: <1331205761.7257.5.camel@sauron.fi.intel.com>
Subject: Re: [RFC][PATCH 0/7] UBI checkpointing support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <rw@linutronix.de>
Date: Thu, 08 Mar 2012 13:22:41 +0200
In-Reply-To: <4F57CCB9.9090001@linutronix.de>
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
 <1331136246.32316.39.camel@sauron.fi.intel.com>
 <4F57CCB9.9090001@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tim.bird@am.sony.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2012-03-07 at 22:01 +0100, Richard Weinberger wrote:
> > Please, consider an option of picking a different name. In JFFS2 a
> > "similar" thing was called "summaries", and even this is better than
> > "checkpoint", I think.
> 
> What about "Erase block indexing"?
> Basically a checkpoint is an index...

Index is also very loaded word already, and UBIFS has index, would be
nice to use a word UBIFS does not use. Thomas's suggestions like fastmap
or roadmap/milestone are fine with me. UBIUBI is clever, but probably
confusing a bit as well :-)

-- 
Best Regards,
Artem Bityutskiy
