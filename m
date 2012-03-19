Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9k4z-0000JN-O8
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 21:25:28 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 0/9] mtd: MTD API rework
References: <1328714485-19536-1-git-send-email-dedekind1@gmail.com>
Date: Mon, 19 Mar 2012 22:25:14 +0100
In-Reply-To: <1328714485-19536-1-git-send-email-dedekind1@gmail.com> (Artem
 Bityutskiy's message of "Wed, 8 Feb 2012 17:21:16 +0200")
Message-ID: <87wr6g8erp.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
...zip..
>
> Please, do test the changes if you use MTD - it is easy to break something when
> you are trying to clean-up ancient crap.

Hi Artem,

Just a note to let you know I tested these patches with the docg3, and
everything is alright. Of course, docg3 is less impacted than others, but still
read/write/erase do work, on an UBIFS mounted filesystem (which tends to proove
things do work, don't it ?)

Cheers.

-- 
Robert
