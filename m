Received: from ppp29.spiderweb.com.au ([202.76.149.29] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Xvoy-0006cr-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2002 02:59:02 +0000
Date: Tue, 5 Feb 2002 13:06:13 +1000 (EST)
From: David Woodhouse <dwmw2@infradead.org>
To: Jonas Holmberg <jonas.holmberg@axis.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Patch for jedec_probe
In-Reply-To: <1012819949.4315.2.camel@pcjonashg>
Message-ID: <Pine.LNX.4.44.0202051306000.2877-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On 4 Feb 2002, Jonas Holmberg wrote:

> I need the jedec_probe to give up when finding a chip of a different
> manufacturer or device id (or no chip at all) than a previously found
> chip in the same map.
> 
> This patch below fixes that. Is it OK to commit?

Looks sane. Go ahead.

-- 
dwmw2
