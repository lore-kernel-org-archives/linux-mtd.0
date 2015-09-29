Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zgz5B-0003uu-Rv
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 17:52:55 +0000
Subject: Re: [PATCH] ubifs: Add new mount option to force fdatasync before
 rename
To: Nikhilesh Reddy <reddyn@codeaurora.org>
References: <560984B4.7090105@codeaurora.org> <56099735.2060503@nod.at>
 <5609A52E.5010109@codeaurora.org> <5609A7D8.4000801@nod.at>
 <560AC4AA.1070906@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <560ACFDC.1010100@nod.at>
Date: Tue, 29 Sep 2015 19:52:28 +0200
MIME-Version: 1.0
In-Reply-To: <560AC4AA.1070906@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 29.09.2015 um 19:04 schrieb Nikhilesh Reddy:
> Unfortunately major changes would not be completely up to me :(

hm?

> But before i spend time on it ... i was hoping to understand the disadvantages of this approach and the advantages of the other approach?
> Can you kindly help me understand?

Sure.
Instead of making rename() unconditionally synchronous we could do it like ext4 and detect rename+close patterns and make only
these synchronous.

So, your application does:
fd = open("foo", ...)
write(fd, "yadda yadda, ...)
close(fd)
rename("foo", "bar")

and then expects "bar" to exist with contents "yadda yadda"?

I'm asking because we also have to make sure that this is not an UBIFS bug.
We have to be careful, ext4 has a metadata journal, UBIFS' is different.

My point is that UBIFS better should detect the close+rename pattern then only then do rename synchronous.

> So the patch effectively converts all the rename to a fdatasync+rename which is what we would expect all the userspace applications to do anyway.

But there are also cases where you want a fast rename() and sync later.

Artem, what do you think?

Thanks,
//richard
