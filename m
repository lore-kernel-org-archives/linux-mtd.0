Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S9Cu1-00009t-LR
 for linux-mtd@lists.infradead.org; Sun, 18 Mar 2012 09:59:54 +0000
Received: by wgbdr1 with SMTP id dr1so345362wgb.18
 for <linux-mtd@lists.infradead.org>; Sun, 18 Mar 2012 02:59:51 -0700 (PDT)
Date: Sun, 18 Mar 2012 11:59:46 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Peter Barada <peter.barada@gmail.com>
Subject: Distinguishing bitflips due to read-disturb or due to wear-out
Message-ID: <20120318115946.5614a889@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quote from [1].
Started a new thread as this is off-topic.

[1]
http://lists.infradead.org/pipermail/linux-mtd/2012-March/040336.html

> The bigger issue is how to discern whether the degredation is due to 
> read-disturb (which can be recovered by erasing/reprogramming the block) 
> or the page physically wearing out (in which case it needs to be 
> retired).

Question is, do we really need to distinguish between the two?

If there is a "dangerously high" number of bit errors, then scrubbing
should be performed.
If the reason for the bit errors was due to read-disturb, then those
error are gone after scrubbing (for now, until read-disturb affects
again).
If the reason was wear-out, then it is likely that high number of bit
errors will be evident, again. But if the block is totally worn-out,
shouldn't the device return an error status for the erase operation,
eventually? (and as such, the MTD software will retire the block)?

Regards
Shmulik
