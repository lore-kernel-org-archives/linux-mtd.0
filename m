Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zi82l-0002SI-Hb
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2015 21:39:08 +0000
Subject: Re: [PATCH] ubifs: Add new mount option to force fdatasync before
 rename
To: Nikhilesh Reddy <reddyn@codeaurora.org>, linux-mtd@lists.infradead.org
References: <560984B4.7090105@codeaurora.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <560EF960.50808@nod.at>
Date: Fri, 2 Oct 2015 23:38:40 +0200
MIME-Version: 1.0
In-Reply-To: <560984B4.7090105@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
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

Am 28.09.2015 um 20:19 schrieb Nikhilesh Reddy:
> The rename operation in UBIFS is synchronous (or nearly synchronous)
> while the write operation is not. This can result in zero length files when
> renaming of files followed by an abrupt power down or a crash.
> 
> For example:
> 1) Say a file a.txt exists with size 1KB.
> 2) Create a file b.tmp (open)
> 3) Update the data in b.tmp with new values (write and close)
> 4) rename b.tmp to a.txt
> 5) Abrupt power down or crash
> 
> This above scenario can result in a.txt becoming a file of zero length and
> giving the impression of a.txt being truncated.
> This scenario can ofcourse be prevented by calling fsync or fdatasync
> before the rename operation.

I gave this a try and hacked up something to emulate a powercut *exactly* after
rename() in UBIFS.

fd = open("b.tmp", ...)
write(fd, "foo", ...)
close(fd)
rename("b.tmp", "a.txt")
^---- powercut

After remounting UBIFS both a.txt and b.tmp are present
but b.tmp is truncated. Not a.txt as you said.

Can you please double check?
I want to make sure that we're talking about the same things.

Thanks,
//richard
