From: dwmw2@infradead.org (David Woodhouse)
Date: 24 Feb 2003 06:55:50 +0000
Subject: JFFS2 for 2.0 kernel?
In-Reply-To: <3E59BACB.762BB6C7@i3micro.com>
References: <3E59BACB.762BB6C7@i3micro.com>
Message-ID: <1046069750.1867.1.camel@imladris.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 2003-02-24 at 06:25, Arne Jonsson wrote:
> As I understand JFFS2 is not publically available for the 2.0-kernel.
> Can anyone give some opinions of how much work a backport (from 2.4 to
> 2.0) effort would be?
> Any pointers of where the big problems are?
> Is it even possible?

It would be quite a lot of work; the file system layer in Linux changed
dramatically between the 2.0 and 2.2 kernels. You'd have a better chance
of porting to 2.2 -- in fact I think someone's already done so.

Why do you want 2.0?

-- 
dwmw2
