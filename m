Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVeqy-0007O2-8k
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2004 19:09:02 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
In-Reply-To: <EFF9A3506F74924AB5CC77BDC66E79351812AA@atcml01.atc.army.mil>
References: <EFF9A3506F74924AB5CC77BDC66E79351812AA@atcml01.atc.army.mil>
Content-Type: text/plain
Message-Id: <1086217723.26119.896.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 03 Jun 2004 00:08:43 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Let me add to last message
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-06-02 at 07:33 -0400, Carlos, John J USAATC wrote:
> This is some of the messages I get.  The chip is identified properly but
> using the MTD_ioctl calls I get the wrong erase size??

Er, do you have the correct major/minor numbers for /dev/mtd4? 

-- 
dwmw2
