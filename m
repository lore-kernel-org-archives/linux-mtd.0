Subject: Re: Open message to list moderator
From: David Woodhouse <dwmw2@infradead.org>
To: Phil Endecott <spam_from_linux_mtd@chezphil.org>
In-Reply-To: <1180477810115@dmwebmail.belize.chezphil.org>
References: <1180477810115@dmwebmail.belize.chezphil.org>
Content-Type: text/plain
Date: Wed, 30 May 2007 15:16:47 +0100
Message-Id: <1180534607.26803.228.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-05-29 at 23:30 +0100, Phil Endecott wrote:
> Based on the delay and the wording, I take it that human intervention 
> was involved in the production of this message.

Yes. That will have been Artem; when I moderate the list myself I tend
to look into the _reasons_ why the rules were broken and I'm often more
lenient. Sequences of '[PATCH 1/2]' '[PATCH 2/2]', for example, _should_
be sent as a thread, but would get trapped for moderation -- and
approved. 

Artem _also_ seems to let things through occasionally but I've never
seen a pattern to it.

> For your information, the headers were missing because I was replying 
> to a message that I had sent myself, and my mailer gets confused when I 
> do that.  (I wrote my own mailer.  It's called Decimail and it's 
> open-source.  It does lots of cool things, but it's not perfect.)

The 'Re: but no References:' rule is there to prevent broken mailers
(usually Outlook) from breaking threading on the mailing list. Please
consider it a bug report -- if you were replying to a previous message,
whoever that message came from, then your reply should contain either
References: or In-Reply-To: headers, or preferably both.

> Now, you have lost the explanation for the patch and have annoyed me 
> enough that I am unlikely to go out of my way to fix any further 
> problems that I spot in your code. 

You don't keep your own outgoing mail? Do you want a copy? I'm sure
it'll be buried in my postmaster mailbox somewhere, from when I got the
'message trapped for moderation' notice.

>  Was this really worth it just for a missing header?

In general, yes. Forcing people to use non-buggy MUAs helps to keep the
signal:noise ratio down. There are very occasional people who are so
offended by it that they cannot manage to either fix their mailer or get
a proper one -- but as a sweeping generalisation, they aren't much of a
loss.

I don't include you in that generalisation specifically -- I hope you'll
reconsider. Although I haven't had time in the last couple of weeks to
respond to your patches and apply them, they are very much appreciated.

-- 
dwmw2
