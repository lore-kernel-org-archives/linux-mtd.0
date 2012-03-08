Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5bwQ-00063S-B4
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2012 11:55:30 +0000
Message-ID: <1331207881.7257.37.camel@sauron.fi.intel.com>
Subject: Re: [RFC][PATCH 0/7] UBI checkpointing support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <rw@linutronix.de>
Date: Thu, 08 Mar 2012 13:58:01 +0200
In-Reply-To: <4F587A28.6080205@linutronix.de>
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
 <1331138007.3463.16.camel@sauron.fi.intel.com>
 <4F57D0C4.1050605@linutronix.de>
 <20120308090835.032fe13a@pixies.home.jungo.com>
 <4F587A28.6080205@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: tglx@linutronix.de, tim.bird@am.sony.com, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2012-03-08 at 10:21 +0100, Richard Weinberger wrote:
> On 08.03.2012 08:08, Shmulik Ladkani wrote:
> > But doesn't the CP data (sorry, UBIUBI data :) need to have one
> > 'struct ubi_cp_ec' descriptor for each used/free PEB, and as such the
> > maximum number of 'ubi_cp_ec' descriptors is total device PEBs, meaning
> > CP data is still linearly scaled to device size (with a very small
> > multiplier)?
> >
> 
> It's UBIVIS data. :D

I have a suggestion for the property of the new term. Because your old
one can be both a noun and a verb (write a checkpoint, to checkpoint),
the new term should probably have the same property.

To write the ubibis and to ubibis? Hmm... not sure.

To write the fastmap and to fastmap or decide to not fastmap because all
PEBs within the first 64 have too high erasecounter? Sounds better IMO.

> The size of the checkpoint depends on the number of free/used PEBs.
> But in most cases the checkpoints fits into one or two PEBs.
> Because larger devices have larger erase blocks...

They do, but the eraseblock size grows much slower AFAICS.

-- 
Best Regards,
Artem Bityutskiy
