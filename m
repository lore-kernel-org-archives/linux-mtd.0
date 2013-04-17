Received: from mail-pa0-f41.google.com ([209.85.220.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USGgW-0002FU-Pw
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2013 00:57:17 +0000
Received: by mail-pa0-f41.google.com with SMTP id kx1so631484pab.28
 for <linux-mtd@lists.infradead.org>; Tue, 16 Apr 2013 17:57:12 -0700 (PDT)
Date: Tue, 16 Apr 2013 17:56:53 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 01/28] Include missing linux/slab.h inclusions [RFC]
Message-ID: <20130417005653.GA11541@kroah.com>
References: <20130416182550.27773.89310.stgit@warthog.procyon.org.uk>
 <20130416182554.27773.86004.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130416182554.27773.86004.stgit@warthog.procyon.org.uk>
Cc: devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 linux-efi@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mtd@lists.infradead.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 16, 2013 at 07:25:54PM +0100, David Howells wrote:
> Include missing linux/slab.h inclusions where the source file is currently
> expecting to get kmalloc() and co. through linux/proc_fs.h.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-s390@vger.kernel.org
> cc: sparclinux@vger.kernel.org
> cc: linux-efi@vger.kernel.org
> cc: linux-mtd@lists.infradead.org
> cc: devel@driverdev.osuosl.org
> cc: x86@kernel.org
> ---
>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
