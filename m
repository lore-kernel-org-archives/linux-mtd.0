Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5dD5-0003nR-JJ
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2012 13:16:48 +0000
Received: by wgbdr1 with SMTP id dr1so302768wgb.18
 for <linux-mtd@lists.infradead.org>; Thu, 08 Mar 2012 05:16:45 -0800 (PST)
Date: Thu, 8 Mar 2012 15:16:40 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [RFC][PATCH 0/7] UBI checkpointing support
Message-ID: <20120308151640.0a7aa240@halley>
In-Reply-To: <1331207881.7257.37.camel@sauron.fi.intel.com>
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
 <1331138007.3463.16.camel@sauron.fi.intel.com>
 <4F57D0C4.1050605@linutronix.de>
 <20120308090835.032fe13a@pixies.home.jungo.com>
 <4F587A28.6080205@linutronix.de>
 <1331207881.7257.37.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <rw@linutronix.de>,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 08 Mar 2012 13:58:01 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> To write the ubibis and to ubibis? Hmm... not sure.
> 
> To write the fastmap and to fastmap or decide to not fastmap because all
> PEBs within the first 64 have too high erasecounter? Sounds better IMO.

FWIW, fastmap sounds reasonable to me.

(aside from the fact that "fast" is the outcome of using the map,
whereas the map's definition is essentially a peb/leb map).

Anyways,

CONFIG_MTD_UBI_FASTMAP, ubi_find_fastmap(), ubi_scan_fastmap(),
ubi_read_fastmap(), ubi_update_fastmap() ...

all seem pretty explanatory IMO.

Using plain "map" (ubi_find_map, ubi_update_map) might also be an
option, however it might be less obvious.

Regards,
Shmulik
