Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GIPEc-0007uM-LK
	for linux-mtd@lists.infradead.org; Wed, 30 Aug 2006 13:32:00 +0100
Message-ID: <44F58554.5040801@ru.mvista.com>
Date: Wed, 30 Aug 2006 16:32:20 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH] CORE: adding mtd_get_partition_physaddr()
References: <6934efce0608282144ge2250dbv1635377c005a9f74@mail.gmail.com>	<1156871627.2003.15.camel@zod.rchland.ibm.com>
	<6934efce0608291237m7779c57dj23ebc8435c8f43ea@mail.gmail.com>
In-Reply-To: <6934efce0608291237m7779c57dj23ebc8435c8f43ea@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Jared Hulbert wrote:

>>>+extern void * mtd_get_partition_physaddr(struct mtd_info *mtd);

>>Couldn't this be a proper prototype instead of an extern?

> I thought EXPORT_SYMBOL_GPL()  implied it should be extern.  Is that incorrect?

    Function declarations in C imply 'extern' by default.

WBR, Sergei
