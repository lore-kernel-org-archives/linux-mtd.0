Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BsJYT-0003dS-BS
	for linux-mtd@lists.infradead.org; Wed, 04 Aug 2004 07:03:33 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: m.thanuja@bpltelecom.com
In-Reply-To: <1078.10.10.15.11.1091616626.squirrel@mail.bpltelecom.com>
References: <1078.10.10.15.11.1091616626.squirrel@mail.bpltelecom.com>
Content-Type: text/plain
Message-Id: <1091617407.4383.2619.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 04 Aug 2004 12:03:27 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: ilookup() patch for linux-2.4.18
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Don't use 2.4.18. It's almost inexcusable even to be using the current
2.4 kernel, which is 2.4.26 or 2.4.27. If you want proper NAND flash
support, just use 2.6.8.

-- 
dwmw2
