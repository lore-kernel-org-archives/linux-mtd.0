Received: from mail-iw0-f202.google.com ([209.85.223.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NMj2o-00028p-7q
	for linux-mtd@lists.infradead.org; Mon, 21 Dec 2009 14:15:35 +0000
Received: by iwn40 with SMTP id 40so1316904iwn.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Dec 2009 06:15:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20091221123654.GA9201@lst.de>
References: <4B2F6153.8010609@gmail.com> <20091221123654.GA9201@lst.de>
Date: Mon, 21 Dec 2009 22:15:26 +0800
Message-ID: <b3657a100912210615q1d55c334g73667e1c3a97ce05@mail.gmail.com>
Subject: Re: [PATCHv2 00/12]posix_acl: Add the check items
From: liu weni <qingshenlwy@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: adilger@sun.com, jack@suse.cz, neilb@suse.de, jeffm@suse.com,
	joel.becker@oracle.com, bfields@fieldses.org,
	linux-mtd@lists.infradead.org, onlyflyer@gmail.com,
	tiger.yang@oracle.com, strongzgy@gmail.com, ffilzlnx@us.ibm.com,
	sandeen@sandeen.net, jmorris@namei.org, cluster-devel@redhat.com,
	bharrosh@panasas.com, cjb@laptop.org, mfasheh@suse.com,
	aelder@sgi.com, reiserfs-devel@vger.kernel.org, xfs@oss.sgi.com,
	xfs-masters@oss.sgi.com, viro@zeniv.linux.org.uk,
	swhiteho@redhat.com, chris.mason@oracle.com,
	linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	tytso@mit.edu, dwmw2@infradead.xn.org.cpa,
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, serue@us.ibm.com,
	akpm@linux-foundation.org, ocfs2-devel@oss.oracle.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for your suggestion.

In my opinion the null point is a incorrect state for the acl, then I
return -EINVAL.

I will check this state transition in XFS.

2009/12/21 Christoph Hellwig <hch@lst.de>:
> I like taking these checks into posix_acl_valid, but I think the patch
> submission needs a bit more work.
>
> All the patches are extremly whitespace mangled. =A0And I don't think
> splitting them up makes a whole lot of sense, when we do API changes
> like this we usually fix up all callers. =A0So please try to fix your
> mailer, merged them all into one, and maybe also chose a more
> descriptive subject line, e.g.
>
> Subject: take checks for NULL and error pointers into posix_acl_valid()
>
>
> And btw, at least the XFS change seems incorrect - previously we
> returned NULL acl pointer and this patch changes it to -EINVAL.
>
>
