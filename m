Received: from mail.sysgo.com ([62.8.134.5])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHMb5-0001nR-8A
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2005 10:26:43 -0400
Date: Mon, 19 Sep 2005 16:26:07 +0200 (CEST)
From: Marius Groeger <mgroeger@sysgo.com>
Sender: mag@sysgo.com
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050919093300.GB21380@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.63.0509191622500.3180@mag.sysgo.com>
References: <432C2E6C.6050400@gmail.com>
	<20050919093300.GB21380@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "David A. Braun" <braunster@gmail.com>, linux-mtd@lists.infradead.org,
	Robert Kaiser <rkaiser@sysgo.com>
Subject: Re: Command line parsing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 19 Sep 2005, J=F6rn Engel wrote:

> On Sat, 17 September 2005 10:55:40 -0400, David A. Braun wrote:
>>
>> Is there any particular reason parse_cmdline_partitions() in
>> drivers/mtd/cmdlineparse.c doesn't completely setup the partition
>> table(s) it builds? It fails to initialize the offsets and sizes of any
>> partition tabled unless it is the one named by "master". This one has
>> the offsets and lengths filled in but the others are left zero with the
>> exception of partitions specified with "-" or SIZE_REMAINING. I would
>> have expected all partitions described in the cmdline to be initialized
>> if any are.
>
> Iirc, the code was written by someone at Sysgo, possibly Robert, and
> hasn't been touched for quite a while.  So if you have any patches
> that improve the situation for you, feel free to send them.

Acutally it was me :-), but someone decided to remove my name and just=20
leave in the reference to our company... Anyway you're right about my=20
not having touched that code. Looking at it briefly, though, I don't=20
really spot anything suspicous. Apart from the (potential) oddity that=20
the cmdline is saved and processed much later at a time the flash=20
hardware is actually, I don't see what is not initialized.

In other words, David, what is the actual problem you're seeing?

Regards,
Marius

--=20
Marius Groeger <mgroeger@sysgo.com>
SYSGO AG                      Embedded and Real-Time Software
Voice: +49 6136 9948 0                  FAX: +49 6136 9948 10
www.sysgo.com | www.elinos.com | www.osek.de | www.pikeos.com
