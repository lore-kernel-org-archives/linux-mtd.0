Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vUbA-0001oQ-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 May 2001 02:41:36 +0100
Date: Thu, 3 May 2001 21:41:55 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: "Eric W. Biederman" <ebiederman@lnxi.com>, <linux-mtd@lists.infradead.org>
Subject: Re: Q: interleave logic? 
In-Reply-To: <17354.988926192@redhat.com>
Message-ID: <Pine.LNX.4.33.0105032135560.7524-100000@xanadu.home>
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


On Thu, 3 May 2001, David Woodhouse wrote:

> I thought the macros that were introduced (by Nico?) were roughly the right
> thing. If you have better suggestions, though, I'm interested.

I did the work towards generic interleave support only for cmdset-001.  Last
time I had a look the work wasn't completely done for cmdset-002.


Nicolas
