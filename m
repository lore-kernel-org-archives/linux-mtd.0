Date: Tue, 16 Jan 2007 12:04:21 +0000 (GMT)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: __user removed from mtd-abi.h
In-Reply-To: <Pine.LNX.4.64.0701160805030.11369@lnxricardw.se.axis.com>
Message-ID: <Pine.LNX.4.64.0701161202490.13707@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0701160805030.11369@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 2007-01-16 at 08:21 +0100, Ricard Wanderlof wrote:
> #ifndef __KERNEL__
> #define __user
> #endif
>
> has been removed from mtd-abi.h . I appreciate the reason, but I'm not
> sure how to include this file in userspace now and get it to compile
> properly.

The idea is that you cannot _directly_ include this file from user-space 
now. You first have to run the 'make headers_install' command. Basically, 
this command removes user-space-incompatible things like '_user' from the 
headers that are supposed to be included from user-space, and then you may 
used the _processed_ headers in you user-space programs.
