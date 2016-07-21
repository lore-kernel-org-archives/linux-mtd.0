Received: from mail-lf0-f52.google.com ([209.85.215.52])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bQ8MX-0001YK-JV
 for linux-mtd@lists.infradead.org; Thu, 21 Jul 2016 07:25:42 +0000
Received: by mail-lf0-f52.google.com with SMTP id f93so54017658lfi.2
 for <linux-mtd@lists.infradead.org>; Thu, 21 Jul 2016 00:25:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160720125201.GA52079@ubuntu-hedt>
References: <1461699396-33000-1-git-send-email-seth.forshee@canonical.com>
 <1461699396-33000-19-git-send-email-seth.forshee@canonical.com>
 <CA+2rt426_pshAauQizcxkfAq16vmEpB4sJ4genW_ucosH3j=zQ@mail.gmail.com>
 <20160720125201.GA52079@ubuntu-hedt>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Thu, 21 Jul 2016 09:25:17 +0200
Message-ID: <CAOssrKfJrQuf_exBVGtn-EBOBnRhhNWe+2P=VkEqtp3qmGYiFA@mail.gmail.com>
Subject: Re: [PATCH v4 18/21] fuse: Add support for pid namespaces
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Sheng Yang <sheng@yasker.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Austin S Hemmelgarn <ahferroin7@gmail.com>,
 Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
 kernel list <linux-kernel@vger.kernel.org>,
 linux-bcache@vger.kernel.org, dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 fuse-devel@lists.sourceforge.net, linux-security-module@vger.kernel.org,
 selinux@tycho.nsa.gov, cgroups@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 20, 2016 at 2:52 PM, Seth Forshee
<seth.forshee@canonical.com> wrote:

> It sounds like we need to remove the restriction on accessing the
> filesystem from a different pid namespace. I don't think this poses a
> security problem. However there's no pid mapping that is usable by the
> userspace fuse process, so what do we put in the fuse request? Probably
> the only candidates are 0 and 0xffffffff.
>
> So a question for the fuse developers - is one value or the other
> preferrable for fuse_in_header.pid when the pid cannot be mapped, and is
> this going to cause problems for any fuse filesystems? I suspect that
> few filesystems actually look at the pid anyway, and already for a
> filesystem mounted in a pid namespace the values being given to
> userspace won't be correct for the namespace of the fuse process.

pid = 0 sounds good.

The pid from the request is used for example to get the auxiliary
group list by libfuse (fuse_req_getgroups()).   That's not used by all
filesystems and it will return an error in case it can't find the proc
entry (which it won't for pid == 0).

It would be nice if we could transfer the group list through the
userspace/kernel protocol, since then it wouldn't depend on proc and
on being in the same pid namespace.  But that's another story.

Thanks,
Miklos
