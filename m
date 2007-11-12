Received: from nz-out-0506.google.com ([64.233.162.224])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Iri7Q-0006gm-C4
	for linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 17:51:06 -0500
Received: by nz-out-0506.google.com with SMTP id z3so942425nzf
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Nov 2007 14:50:47 -0800 (PST)
Message-ID: <6934efce0711121450r553ba5fo12f6c676fa79c3fe@mail.gmail.com>
Date: Mon, 12 Nov 2007 14:50:46 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Nicolas Pitre" <nico@cam.org>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on
	power up
In-Reply-To: <alpine.LFD.0.9999.0711121630090.21255@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <201904.92834.qm@web43134.mail.sp1.yahoo.com>
	<alpine.LFD.0.9999.0711121630090.21255@xanadu.home>
Cc: linux-mtd@lists.infradead.org, Justin Treon <justin_treon@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Don't make the unlocking the default.  The flag has simply to be set
> explicitly for the unlock to occur.  Few reasons for this:
>
> 1) you don't know if a particular flash requires unlocking after boot,
>    (most flash models don't) so doing it unconditionally is wasteful;
>
> 2) the partition might as well be meant to remain locked, except for
>    rare occasions when its content is updated (think bootloader) meaning
>    it cannot be marked read-only;
>
> 3) this is a security feature and should not be bypassed "by
>    default", and therefore the auto-unlock should be dependent on an
>    explicit flag so people needing it will have the opportunity to think
>    about it.

Why is it a security feature to have a partition marked as r/w come up
as locked?  That's nutty.  If someone want's to implement some complex
scheme to prevent errant programs, they can use the userspace tools
and readonly flag for that.  The mailinglist gets an awful lot of
questions that have pointlessly locked partitions as the core.  Most
users don't use or view this as a security feature but just as an
annoyance.

So the semantics for the partition flags are to allow reads unless a
partition has been explictly marked readonly, right?   If you have
signaled intent to write to it, by creating a non-readonly partition,
you expect to be able to write to.  I argue it makes sense then to
unlock a partition that isn't marked readonly, granted we _only_
unlock such partitions.

I suggest we make this behavior (a) selective based on a config option
(b) make sure it only unlocks chips that actually unlock.
