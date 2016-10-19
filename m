Received: from mail-vk0-f54.google.com ([209.85.213.54])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwsRV-0001O3-KB
 for linux-mtd@lists.infradead.org; Wed, 19 Oct 2016 15:06:13 +0000
Received: by mail-vk0-f54.google.com with SMTP id 83so30049606vkd.0
 for <linux-mtd@lists.infradead.org>; Wed, 19 Oct 2016 08:05:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8970b7a5-eea0-921b-16ff-6cf53df52f85@fb.com>
References: <1476046382-19185-1-git-send-email-pascal.eberhard@gmail.com>
 <443b11a2-729a-32ec-0a6f-5a3276290329@nod.at>
 <CAHc6FU7Sh3cX2NAs6bu1jBWQwwpQK0OLsLMAEZMpzocb7L5teg@mail.gmail.com>
 <CAHc6FU5pei6eLT2msMO3NV-me5SoCWf7_6y5utuCvfZHYjyiZw@mail.gmail.com>
 <8970b7a5-eea0-921b-16ff-6cf53df52f85@fb.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 19 Oct 2016 17:05:19 +0200
Message-ID: <CAHc6FU7qGhpNPNncav+R-zxim5wyPAtK72uEtTU65-hVcNxEhw@mail.gmail.com>
Subject: Re: [PATCH] ubifs: implement POSIX Access Control Lists (ACLs)
To: Josef Bacik <jbacik@fb.com>
Cc: Pascal Eberhard <pascal.eberhard@gmail.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 19, 2016 at 4:51 PM, Josef Bacik <jbacik@fb.com> wrote:
> Looks right to me, we call this during inode creation, so if there is no ACL
> to set then we cache no acl so we don't waste the lookup later.

This is when we create an new inode, so neither i_acl nor
i_default_acl should be ACL_NOT_CACHED when this function succeeds. So
either we should make sure that i_acl and i_default_acl are already
not set to ACL_NOT_CACHED anymore when entering this function, or
cache_no_acl should be called unconditionally before setting the
actual ACLs.

Thanks,
Andreas
