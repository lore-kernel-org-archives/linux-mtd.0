Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGykd-0002Ki-0V
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2011 19:58:04 +0000
Message-ID: <4EA07D19.5070904@newsguy.com>
Date: Thu, 20 Oct 2011 12:57:13 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] Add driver for M-sys / Sandisk diskonchip G4 nand flash
References: <1318258091-12670-1-git-send-email-mikedunn@newsguy.com>	<8762jtlx19.fsf@free.fr>
	<4E9CA204.8000904@newsguy.com> <1319128271.20953.14.camel@sauron>
In-Reply-To: <1319128271.20953.14.camel@sauron>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: marek.vasut@gmail.com, Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/20/2011 09:31 AM, Artem Bityutskiy wrote:
>
> Jiffies do work fine in NO_HZ.
>


Thanks Artem.


> But use cpu_relax() in the polling loop.


Will do.  Thanks again.

Mike
