Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZeOXF-0006mV-Fd
 for linux-mtd@lists.infradead.org; Tue, 22 Sep 2015 14:27:10 +0000
Received: by obbbh8 with SMTP id bh8so8678572obb.0
 for <linux-mtd@lists.infradead.org>; Tue, 22 Sep 2015 07:26:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1442924812-9384-2-git-send-email-agruenba@redhat.com>
References: <1442924812-9384-1-git-send-email-agruenba@redhat.com>
 <1442924812-9384-2-git-send-email-agruenba@redhat.com>
Date: Tue, 22 Sep 2015 14:41:12 +0200
Message-ID: <CAFLxGvxrm1E696hSJ6GtnC-V16uWFWBU036a-Aak8PW43us69A@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] ubifs: Remove unused security xattr handler
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christoph Hellwig <hch@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Subodh Nijsure <snijsure@grid-net.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 22, 2015 at 2:26 PM, Andreas Gruenbacher
<agruenba@redhat.com> wrote:
> Ubifs installs a security xattr handler in sb->s_xattr but doesn't use the
> generic_{get,set,list,remove}xattr inode operations needed for processing
> this list of attribute handlers; the handler is never called.  Instead,
> ubifs uses its own xattr handlers which also process security xattrs.
>
> Remove the dead code.
>
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> Cc: Subodh Nijsure <snijsure@grid-net.com>

Should this go through the ubifs tree or do you carry it?

Anyway,
Reviewed-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard
