Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C6utg-0006Qh-33
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2004 13:45:52 -0400
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Pantelis Antoniou <panto@intracom.gr>
In-Reply-To: <41457C48.8040100@intracom.gr>
References: <41457C48.8040100@intracom.gr>
Content-Type: text/plain
Date: Mon, 13 Sep 2004 11:27:02 -0600
Message-Id: <1095096422.5442.4.camel@tubarao>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Support Macronix MX29LV040C
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-09-13 at 13:54 +0300, Pantelis Antoniou wrote:
> Hello
> 
> The following patch adds support for the Macronix MX29LV040C to
> jedec_probe chip driver.

Thanks.

Applied.

I had to shuffle things with the patch because the device wasn't sorted
correctly WRT the other devices in jedec_table[] 8(.
