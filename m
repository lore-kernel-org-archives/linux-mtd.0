Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5XSu-0002Rt-O8
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2012 07:08:46 +0000
Received: by wgbdr1 with SMTP id dr1so99420wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 07 Mar 2012 23:08:42 -0800 (PST)
Date: Thu, 8 Mar 2012 09:08:35 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Richard Weinberger <rw@linutronix.de>
Subject: Re: [RFC][PATCH 0/7] UBI checkpointing support
Message-ID: <20120308090835.032fe13a@pixies.home.jungo.com>
In-Reply-To: <4F57D0C4.1050605@linutronix.de>
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
 <1331138007.3463.16.camel@sauron.fi.intel.com>
 <4F57D0C4.1050605@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 07 Mar 2012 22:19:00 +0100 Richard Weinberger <rw@linutronix.de> wrote:
> >> All these operations scan a limited number of erase blocks which makes
> >> the UBI init O(1) and independent of the device size.
> >
> > Well, is it really true? The larger is the flash the more you read and
> > process anyway, and it is still linear, but the multiplier becomes very
> > small, so this is a huge improvement.
> 
> Yes. :)
> 
> Using checkpointing UBI only has to scan a fixed (independent of the 
> flash size!) number of blocks.

But doesn't the CP data (sorry, UBIUBI data :) need to have one
'struct ubi_cp_ec' descriptor for each used/free PEB, and as such the
maximum number of 'ubi_cp_ec' descriptors is total device PEBs, meaning
CP data is still linearly scaled to device size (with a very small
multiplier)?

Regards,
Shmulik
