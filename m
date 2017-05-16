Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAkpd-00020G-Si
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 22:20:48 +0000
Subject: Re: [PATCH] ubifs: Fix inode leak in xattr code
To: dedekind1@gmail.com, linux-mtd@lists.infradead.org
References: <1494858005-18439-1-git-send-email-richard@nod.at>
 <1494860034.18055.17.camel@gmail.com>
 <a5e7b80e-e1db-7b57-3b94-4d8e3a43cc6a@nod.at>
 <1494864339.18055.20.camel@gmail.com>
Cc: linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 stable@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <588e1a84-08d1-8c10-d698-ffb7ee87b0ad@nod.at>
Date: Wed, 17 May 2017 00:20:14 +0200
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

That turned out to be much easier than expected.
Patch ahead!

Thanks,
//richard
