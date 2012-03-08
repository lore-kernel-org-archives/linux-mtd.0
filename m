Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5ZXg-00089G-0o
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2012 09:21:49 +0000
Message-ID: <4F587A28.6080205@linutronix.de>
Date: Thu, 08 Mar 2012 10:21:44 +0100
From: Richard Weinberger <rw@linutronix.de>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [RFC][PATCH 0/7] UBI checkpointing support
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
 <1331138007.3463.16.camel@sauron.fi.intel.com>
 <4F57D0C4.1050605@linutronix.de>
 <20120308090835.032fe13a@pixies.home.jungo.com>
In-Reply-To: <20120308090835.032fe13a@pixies.home.jungo.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: tglx@linutronix.de, tim.bird@am.sony.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08.03.2012 08:08, Shmulik Ladkani wrote:
> But doesn't the CP data (sorry, UBIUBI data :) need to have one
> 'struct ubi_cp_ec' descriptor for each used/free PEB, and as such the
> maximum number of 'ubi_cp_ec' descriptors is total device PEBs, meaning
> CP data is still linearly scaled to device size (with a very small
> multiplier)?
>

It's UBIVIS data. :D

The size of the checkpoint depends on the number of free/used PEBs.
But in most cases the checkpoints fits into one or two PEBs.
Because larger devices have larger erase blocks...

Thanks,
//richard

-- 
Phone: +49 7556 91 98 91; Fax.: +49 7556 91 98 86

Firmensitz: 88690 Uhldingen, Auf dem Berg 3
Registergericht: Amtsgericht Freiburg i. Br., HRB 700 806;
StNr. 87007/07777; Ust-Id Nr.: DE252739476
Geschäftsführer: Heinz Egger, Thomas Gleixner
