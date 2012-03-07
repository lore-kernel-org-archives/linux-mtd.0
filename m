Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5JJ5-0007Bg-7c
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 16:01:40 +0000
Message-ID: <1331136246.32316.39.camel@sauron.fi.intel.com>
Subject: Re: [RFC][PATCH 0/7] UBI checkpointing support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <rw@linutronix.de>
Date: Wed, 07 Mar 2012 18:04:06 +0200
In-Reply-To: <1329250006-22944-1-git-send-email-rw@linutronix.de>
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
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

Another not-so-technical comment.

On Tue, 2012-02-14 at 21:06 +0100, Richard Weinberger wrote:
> The following patch set implements checkpointing support for
> UBI. Checkpointing is an optional feature which stores the physical to
> logical eraseblock relations in a checkpointing superblock to reduce
> the initialization time of UBI. 

So this is basically about improving scalability and "mount" time. This
has nothing to do with checkpointing most people are aware of.
Confusing...

Really, this tirm is already reserved by file-systems, things like
virtual machines where it means "freezing" the contents and doing COW
when changing the freezed blocks and guaranteeing the ability to
"roll-back" to the checkpointed data.

Please, consider an option of picking a different name. In JFFS2 a
"similar" thing was called "summaries", and even this is better than
"checkpoint", I think.

-- 
Best Regards,
Artem Bityutskiy
