Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgeGF-0003tK-Qn
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 19:38:57 +0000
Subject: Re: [PATCH] ubifs: Add new mount option to force fdatasync before
 rename
To: Nikhilesh Reddy <reddyn@codeaurora.org>
References: <560984B4.7090105@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56099735.2060503@nod.at>
Date: Mon, 28 Sep 2015 21:38:29 +0200
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
> 
> There are many applications and libraries that do not call fsync or
> fdatasync since they were tested on EXT4 which has a hack to handle
> the above case.

...and these applications are buggy by design.
ext4 has some hacks to detect some misuses (IIRC replace by rename and replace by truncate)
as these applications worked by chance on ext3.
Adding such a hack now to UBIFS needs a bit more justification.
Especially as your new mount option is a sledgehammer.

Which application triggers this issue?
I'm asking because UBIFS is more or less an embedded filesystem.
On ext4 mostly broken GUI programs like eclipse or kwrite forgot to fsync().

> Add a new mount option of sync_before_rename which would implicitly
> sync the data before renaming the file to help address cases where the
> rename cases need to be handled implicitly and prevent the zero length
> files as a result of a rename.
> 
> Change-Id: I4e8771d40307543b532df7f46bd87864f0d3d294

What is that?

Thanks,
//richard
