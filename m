Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BjPLg-0004MV-QQ
	for linux-mtd@lists.infradead.org; Sat, 10 Jul 2004 17:25:33 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: "Thomas W. Nelson" <twn@dot4.com>
In-Reply-To: <40EB0D28.60309@dot4.com>
References: <40EB0D28.60309@dot4.com>
Content-Type: text/plain
Date: Sat, 10 Jul 2004 22:22:25 +0100
Message-Id: <1089494545.4217.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Call for testing: Wide flash bank support.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-06 at 16:35 -0400, Thomas W. Nelson wrote:
> The basic configuration is nothing out of the ordinary: 4 AMD 29LV160BT 
> (2 MB) devices in x16 mode, arranged in two 32-bit wide even/odd address 
> banks. 

I've rewritten the way that bus accesses work, and updated the command
set drivers for cmdset 0001 and 0002 (Intel and AMD resp.). The AMD one
seems to work on my 32-byte 'bankwidth' test machine, with eight 32-bit
chips. I haven't tested the Intel driver at all. 

I'd appreciate it if as many people as possible could test the new code,
even on configurations with 'normal' buswidth (in fact, _especially_
there since that was working before and mustn't break).

-- 
dwmw2
