From: David Woodhouse <dwmw2@infradead.org>
To: Jim Nelson <james4765@verizon.net>
In-Reply-To: <415CD869.7070607@verizon.net>
References: <415CD869.7070607@verizon.net>
Content-Type: text/plain
Date: Fri, 01 Oct 2004 10:05:44 +0100
Message-Id: <1096621544.4828.9.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: 2.6.8.1 compile failed.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-10-01 at 00:09 -0400, Jim Nelson wrote:
> A question from a relative newbie (just getting started in kernel 
> hacking) - is there a focus on 2.6 development exclusively in this list 
> or is there some attempt to maintain 2.4 compatibility?  Although I can 
> understand either way, I'd like to know if there needs to be an effort 
> to maintain backwards compatibility.

There's maybe an _attempt_ but no _effort_. That is; if we can easily
choose to make changes in a way which doesn't make it break on 2.4 we
will, but we won't go to any _trouble_.

The 2.4 kernel is an old, stable kernel. If it works for you that's
great and you should continue using it. If it _doesn't_ then you should
be using 2.6.

> Patch to drivers/mtd/chips/amd_flash.c included.

I left that broken on purpose. That driver has been obsoleted by
jedec_probe and the CFI command set driver.

-- 
dwmw2
