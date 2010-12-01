Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PNjPK-0004ze-7i
	for linux-mtd@lists.infradead.org; Wed, 01 Dec 2010 09:55:27 +0000
Date: Wed, 1 Dec 2010 10:55:18 +0100
From: Anatolij Gustschin <agust@denx.de>
To: boaz ben david <boazbd@gmail.com>
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
Message-ID: <20101201105518.206635e6@wker>
In-Reply-To: <AANLkTikEDQyNttTcKgHLwhR53sYSFbtVK-oy2S3END46@mail.gmail.com>
References: <20101129195014.19224240@wker> <4CF4D4CA.8040906@aimvalley.nl>
	<20101130163541.44c48a94@wker>
	<AANLkTikEDQyNttTcKgHLwhR53sYSFbtVK-oy2S3END46@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Eric_Holmberg@trimble.com, linux-mtd@lists.infradead.org,
	Detlev Zundel <dzu@denx.de>, Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 30 Nov 2010 20:18:56 +0200
boaz ben david <boazbd@gmail.com> wrote:

> Sorry to bump the thread but I'm having issues which I think are similiar
> with MLC NAND flash.
> Will reducing the write buffer help here too?

I don't know. Your issues may look similar but without
knowing the details it is not possible to say. Most
probably no. I reduced the write buffer size in the CFI
driver. The issues we observed seem to be NOR flash
specific.

Best regards,
Anatolij
