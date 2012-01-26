Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
 helo=fg-dc1.flatfrog.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqSKG-0002GS-Uy
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 16:37:29 +0000
Message-ID: <4F218140.1070808@flatfrog.com>
Date: Thu, 26 Jan 2012 17:37:20 +0100
From: Orjan Friberg <of@flatfrog.com>
MIME-Version: 1.0
To: Paul Walmsley <paul@pwsan.com>
Subject: Re: CONFIG_PREEMPT and JFFS2 oops
References: <4F206213.9070704@flatfrog.com>
 <alpine.DEB.2.00.1201251351500.5324@utopia.booyaka.com>
 <4F2127B8.9000005@flatfrog.com> <4F213ED8.2020500@flatfrog.com>
 <alpine.DEB.2.00.1201260801410.11174@utopia.booyaka.com>
In-Reply-To: <alpine.DEB.2.00.1201260801410.11174@utopia.booyaka.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 Richard Purdie <rpurdie@openedhand.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Paul,

Your patch works fine in that it doesn't oops, and I'm not seeing any 
BUGs from CONFIG_DEBUG_SPINLOCK.  I haven't verified *anything else* 
(performance etc).

We've had some discussions on the linux-mtd list during the day, 
starting at 
http://lists.infradead.org/pipermail/linux-mtd/2012-January/039442.html 
if you're interested (though that discussion didn't result in a patch).

Thanks,
Orjan


-- 
Orjan Friberg
FlatFrog Laboratories AB
