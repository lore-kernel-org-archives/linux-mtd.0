Received: from sccrmhc13.comcast.net ([204.127.200.83])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HjIEm-0006t5-Q1
	for linux-mtd@lists.infradead.org; Wed, 02 May 2007 13:03:34 -0400
Date: Wed, 2 May 2007 09:03:59 -0700
From: Deepak Saxena <dsaxena@plexity.net>
To: "Ruslan V. Sushko" <rsushko@ru.mvista.com>
Subject: Re: [PATH] NAND Flash support for Intel IXP4xx platform
Message-ID: <20070502160359.GA21292@plexity.net>
References: <463332F9.9040105@ru.mvista.com>
	<1177763736.7646.149.camel@localhost.localdomain>
	<46334F28.70506@ru.mvista.com>
	<1177794151.7646.312.camel@localhost.localdomain>
	<46359C8A.4040306@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46359C8A.4040306@ru.mvista.com>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Reply-To: dsaxena@plexity.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Apr 30 2007, at 11:36, Ruslan V. Sushko was caught saying:
> Thomas,
> 
> I have tried to fit driver's functionality into common platform 
> structures. Unfortunately the device hasn't NAND controller and some 
> signals (ALE/CLE(pins on data bus) and CS(gpio)) are driven in custom 
> way. Current platform structures have not enough fields to carry 
> platform dependent data for this driver without hack (I guess use fields 
> not used in driver but designed for other things is not good idea). 
> Additionally due to device haven't NAND controller future version of 
> board may change the way which is used to drive CS signal, So I move 
> this functionality completely to hardware dependent part of driver (sent 
> to LAKML)

Can't that extra functionality be stuffed into a structure that you
point to via the priv member of platform_nand_chip?


~Deepak

-- 
Deepak Saxena - dsaxena@plexity.net - http://www.plexity.net

In the end, they will not say, "those were dark times,"  they will ask
"why were their poets silent?" - Bertolt Brecht
