Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N8yVw-0000r3-NP
	for linux-mtd@lists.infradead.org; Fri, 13 Nov 2009 15:56:49 +0000
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
In-Reply-To: <1258127530.21596.1260.camel@localhost>
References: <4ACF3478.1060503@aimvalley.nl>
	<1255269148.16942.95.camel@localhost> <4AD30069.8060101@aimvalley.nl>
	<1255510600.32489.130.camel@localhost> <4AFADE3B.3050406@aimvalley.nl>
	<1258100455.21596.1187.camel@localhost> <4AFD76AB.20301@aimvalley.nl>
	<1258127530.21596.1260.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 Nov 2009 17:56:37 +0200
Message-Id: <1258127797.21596.1263.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-11-13 at 17:52 +0200, Artem Bityutskiy wrote:
> On Fri, 2009-11-13 at 16:09 +0100, Norbert van Bolhuis wrote:
> > OK, so now I understand commit_sem is a RW semaphore which can be acquired multiple
> > times by readers but only once for writers. I failed to see that initially.
> > I think this problem is not related to the commit_sem though.
> 
> OK.
> 
> > I changed the logging a bit and added the PID info.
> > The problem is indeed caused by a third task holding the "MTD chip lock". This
> > blocks the application which is blocking pdflush.
> 
> OK.
> 
> > This 3rd task is the UBI background thread. It starts to erase many NOR PEBs very soon.
> 
> The only reason I see why it would do this is because you attach an
> empty flash to UBI. In this case, UBI has to format it. And it is doing
> the formatting asynchronously, in the background thread.

And of course, it is trivial to implement a way for userspace "flush"
UBI work queue, which means you can open the UBI device, call 'fsync()',
and be blocked until it is formatted. It is not implemented, but it is
very easy to do.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
