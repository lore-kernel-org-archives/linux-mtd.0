Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAKG6-0005nh-AL
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 17:58:16 +0000
Subject: Re: [PATCH] ubifs: Fix inode leak in xattr code
To: dedekind1@gmail.com, linux-mtd@lists.infradead.org
References: <1494858005-18439-1-git-send-email-richard@nod.at>
 <1494860034.18055.17.camel@gmail.com>
 <a5e7b80e-e1db-7b57-3b94-4d8e3a43cc6a@nod.at>
 <1494864339.18055.20.camel@gmail.com>
Cc: linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 stable@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <9db191c2-234c-3779-493a-7265409c2d69@nod.at>
Date: Mon, 15 May 2017 19:57:47 +0200
MIME-Version: 1.0
In-Reply-To: <1494864339.18055.20.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

Am 15.05.2017 um 18:05 schrieb Artem Bityutskiy:
> On Mon, 2017-05-15 at 17:22 +0200, Richard Weinberger wrote:
>> Alternatively we could add a iget_locked/drop_nlink/iput sequence to
>> ubifs_tnc_remove_ino(). But that will make unlink() much slower for
>> files
>> that contain xattrs.
> 
> At that level we'd need to do it for every xattr, even those that were
> never be accessed, which would be slow indeed.
> 
> But we really only need to check the inode cache: hey, icache, I am
> dying, and if you have any of my guys (xattrs), I want them to die with
> me. 
> 
> So the question is how to find our guys in the inode cache. I am not
> sure. Probably be we'd have to have our own list of cached inodes in
> the host inode, and maintain it.

BTW: Do you happen to know how other filesystems cache xattrs?
If they actually do.

Thanks,
//richard
