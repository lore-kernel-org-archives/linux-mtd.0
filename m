Received: from ns.sysgo.de ([213.68.67.98] helo=mailgate.sysgo.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CV8DX-0001m5-1F
	for linux-mtd@lists.infradead.org; Fri, 19 Nov 2004 07:50:26 -0500
Date: Fri, 19 Nov 2004 13:50:11 +0100 (CET)
From: Marius Groeger <mgroeger@sysgo.com>
Sender: mag@sysgo.com
To: Erwin Authried <eauth@softsys.co.at>
In-Reply-To: <1100791607.623.10.camel@justakiss>
Message-ID: <Pine.LNX.4.61.0411191342340.19129@mag.sysgo.com>
References: <418F5E68.3010200@sysgo.de> <20041108120624.GE13105@home.fluff.org>
	<418F6CA7.6000808@sysgo.de> <1099943453.10812.16.camel@tubarao>
	<4194D39A.9000700@sysgo.de> <1100274921.3549.13.camel@justakiss>
	<4194E233.70902@sysgo.de> <1100277677.3549.22.camel@justakiss>
	<419C7E72.8040005@sysgo.de> <1100789053.3171.96.camel@tubarao>
	<1100791607.623.10.camel@justakiss>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org, Alexander Hoffmann <ahoffmann@sysgo.de>,
	tharbaugh@lnxi.com
Subject: Re: Usage of MTD_UADDR_UNNECESSARY broken?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 18 Nov 2004, Erwin Authried wrote:

>> I'm thinking that the MTD_UADDR_UNNECESSARY test (which checks for the
>> end-of-loop condition) should be *prior* to the uaddr_idx++.  The way it
>> is, chips that are MTD_UADDR_UNNECESSARY will *never* be tested and will
>> *always* fail.
>
> I believe that your conclusion is wrong. jedec_probe doesn't know
> a-priori which chip is there, thus it can't omit the test. A test for a
> chip with MTD_UADDR_UNNECESSARY will match at the first tested unlock
> address, because a chip with MTD_UADDR_UNNECESSARY doesn't care about
> the unlock sequence at all.

Yes, this makes sense. However, I believe the real problem Alex ran 
into is that after the chip responded to the first address tested (as 
it should) and then found to be MTD_UADDR_UNNECESSARY, the uaddr index 
is _still_ used, subsequently. As far as I understand it, by way of 
the finfo_uaddr() function.

So what seems to be needed as a fix would be this: once a chip is 
found to be MTD_UADDR_UNNECESSARY, uaddr stuff should be done, at all, 
any more.

Does this make sense to you guys?

Regards,
Marius

-- 
Marius Groeger <mgroeger@sysgo.com>
SYSGO AG                      Embedded and Real-Time Software
Voice: +49 6136 9948 0                  FAX: +49 6136 9948 10
www.sysgo.com | www.elinos.com | www.osek.de | www.imerva.com
