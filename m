Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BTeVK-0002rt-Ii
	for linux-mtd@lists.infradead.org; Fri, 28 May 2004 06:22:23 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
In-Reply-To: <EFF9A3506F74924AB5CC77BDC66E79351812A3@atcml01.atc.army.mil>
References: <EFF9A3506F74924AB5CC77BDC66E79351812A3@atcml01.atc.army.mil>
Content-Type: text/plain
Message-Id: <1085739737.26119.50.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 28 May 2004 11:22:18 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Help with DOC Mil Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-05-27 at 07:56 -0400, Carlos, John J USAATC wrote:
> I am having major problems.  I have 2.4.21 running on an arm core.  I have
> patched mtd with a recent snapshot.  I have had addressing problems with the
> way the manufacturer designed the board.  Inw and Outw work with the chip.
> I can read the chip ID reg 

What are the IDs you read from the chip? Precisely what model of chip is
it? Can you show the actual kernel output?

>  Looking at the code the size is a function of chipshift.  Can
> someone explain what the chipshift variable represents????  

log2 of chip size.

-- 
dwmw2
