Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5Nzg-0004lV-65
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 21:01:57 +0000
Message-ID: <4F57CCB9.9090001@linutronix.de>
Date: Wed, 07 Mar 2012 22:01:45 +0100
From: Richard Weinberger <rw@linutronix.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [RFC][PATCH 0/7] UBI checkpointing support
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
 <1331136246.32316.39.camel@sauron.fi.intel.com>
In-Reply-To: <1331136246.32316.39.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 07.03.2012 17:04, schrieb Artem Bityutskiy:
> Another not-so-technical comment.
>
> On Tue, 2012-02-14 at 21:06 +0100, Richard Weinberger wrote:
>> The following patch set implements checkpointing support for
>> UBI. Checkpointing is an optional feature which stores the physical to
>> logical eraseblock relations in a checkpointing superblock to reduce
>> the initialization time of UBI.
>
> So this is basically about improving scalability and "mount" time. This
> has nothing to do with checkpointing most people are aware of.
> Confusing...

Mostly because "checkpointing" is a buzzword. ;-)

> Really, this tirm is already reserved by file-systems, things like
> virtual machines where it means "freezing" the contents and doing COW
> when changing the freezed blocks and guaranteeing the ability to
> "roll-back" to the checkpointed data.
>
> Please, consider an option of picking a different name. In JFFS2 a
> "similar" thing was called "summaries", and even this is better than
> "checkpoint", I think.

What about "Erase block indexing"?
Basically a checkpoint is an index...

Thanks,
//richard

P.s: I'm really bad in picking names.
