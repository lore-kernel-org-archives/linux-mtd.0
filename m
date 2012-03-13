Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7Yfn-0003tc-B7
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 20:50:24 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dedekind1@gmail.com
Subject: Re: [PATCH] drivers/mtd: docg3 fix writebufsize
References: <1331461726-10087-1-git-send-email-robert.jarzmik@free.fr>
 <1331461726-10087-2-git-send-email-robert.jarzmik@free.fr>
 <1331639294.3595.12.camel@sauron.fi.intel.com>
Date: Tue, 13 Mar 2012 21:50:06 +0100
In-Reply-To: <1331639294.3595.12.camel@sauron.fi.intel.com> (Artem
 Bityutskiy's message of "Tue, 13 Mar 2012 13:48:14 +0200")
Message-ID: <87haxsrzsx.fsf@free.fr>
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

Artem Bityutskiy <dedekind1@gmail.com> writes:

> On Sun, 2012-03-11 at 11:28 +0100, Robert Jarzmik wrote:
>> The docg3 drivers lacked mtd writebufsize initialization. Without it,
>> ubifs cannot work.
>> 
>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>
> I think I've already done this in the l2-mtd.git tree. I strongly
> recommend you to test on top of the l2-mtd.git because it has the latest
> stuff.

OK, will do.

Cheers.


-- 
Robert
