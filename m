Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9lQa-0003J3-DI
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 22:51:50 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: add documentation about locking context of MTD API
In-Reply-To: <4F67B3B8.7090909@nod.at> (Richard Weinberger's message of "Mon,
 19 Mar 2012 23:31:20 +0100")
References: <1332195985-21043-1-git-send-email-robert.jarzmik@free.fr>
 <4F67B3B8.7090909@nod.at>
Date: Mon, 19 Mar 2012 23:51:38 +0100
Message-ID: <87r4wo8arp.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard Weinberger <richard@nod.at> writes:

> Am 19.03.2012 23:26, schrieb Robert Jarzmik:
>> Add a comment to mtd header for MTD drivers writters, so that they
>> know that each function in the MTD API, ie. in the mtd_info
>> structure, is called in a sleeping context.
>> 
>
> Why do we need this comment?
Because I was asked to, in [1].

> "sleeping" context isn't special, it's the default.
> atomic would be...
Ah, well, maybe. From what I've seen in the usb drivers area, portions of code
are called from interrupts, through hooks. As a driver writer, I'm always
interested to know whether I can msleep() or not.

Cheers.

--
Robert

[1] http://lists.infradead.org/pipermail/linux-mtd/2012-March/040236.html
