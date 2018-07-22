Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhJgM-0006WR-BF
 for linux-mtd@lists.infradead.org; Sun, 22 Jul 2018 19:06:16 +0000
Received: by mail-wm0-x244.google.com with SMTP id s9-v6so13866236wmh.3
 for <linux-mtd@lists.infradead.org>; Sun, 22 Jul 2018 12:06:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
References: <cover.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 22 Jul 2018 21:06:00 +0200
Message-ID: <CAFLxGvyqZNLeRgxGvNNnc-zsPydYLisEB3eX0R5CVCEhEuN4QQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Secure deletion under JFFS2
To: Theuns Verwoerd <theuns.verwoerd@alliedtelesis.co.nz>
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 20, 2018 at 1:50 AM, Theuns Verwoerd
<theuns.verwoerd@alliedtelesis.co.nz> wrote:
> Security certifications such as FIPS require the capability to securely
> delete files, which is problematic under JFFS2's log-based model.  We can

Can you please be a little more specific about the certifications?

These days secure deletion at file system level is almost impossible to achieve
since you don't have full control of the storage stack.
I know, I know, In the raw flash case we have, but still. It makes
things very complicated.

A common approach do delete a file in a secure way is having it
encrypted and upon deletion
you forget the key.
Wouldn't that work for you too?

-- 
Thanks,
//richard
