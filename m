Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GeJo-0002be-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 11:55:56 +0000
Date: Tue, 26 Nov 2002 12:26:13 +0000
Subject: Re: Basic question how jffs2 uses mtd
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v548)
Cc: linux-mtd@lists.infradead.org
To: Tino Keitel <tino.keitel@innominate.com>
From: Jasmine Strong <jasmine@regolith.co.uk>
In-Reply-To: <20021126122404.GA7962@tkeitel001.bln.gelonet.local>
Message-Id: <40827B6D-013A-11D7-BD00-000393AD6294@regolith.co.uk>
Content-Transfer-Encoding: 7bit
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

On Tuesday, November 26, 2002, at 12:24 PM, Tino Keitel wrote:

> Hi folks,
>
> I try to debug a strange problem with jffs2 here. That's why I wonder
> what JFFS2 uses the MTD layer for. I remember that I read somewhere
> that JFFS2 only uses the MTD layer to obtain a handle to the actual
> flash device. Is that right?
>

No.

jffs2 uses the mtdblock device only to obtain a handle to the 
underlying mtd driver,
whose functions it uses directly (pretty much.)

Jas.
