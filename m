Received: from mail-wg0-x230.google.com ([2a00:1450:400c:c00::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZLjr-0004eY-TD
 for linux-mtd@lists.infradead.org; Mon, 06 May 2013 13:46:00 +0000
Received: by mail-wg0-f48.google.com with SMTP id f11so3518742wgh.27
 for <linux-mtd@lists.infradead.org>; Mon, 06 May 2013 06:45:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1367801267-15659-1-git-send-email-bapper@gmail.com>
References: <1367801267-15659-1-git-send-email-bapper@gmail.com>
Date: Mon, 6 May 2013 15:45:37 +0200
Message-ID: <CAFLxGvzqysw2ABxA9Mz6b6LOdQdGS4y+fN=UeJ0tuk=KPYO55Q@mail.gmail.com>
Subject: Re: [PATCH] UBI: fastmap convert used list to rb tree
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: Brian Pomerantz <bapper@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 6, 2013 at 2:47 AM, Brian Pomerantz <bapper@gmail.com> wrote:
> After some profiling of the attach process, it was found that
> a considerable amount of time was spent spinning through the list of
> used PEBs in ubi_attach_fastmap().  This patch converts the list into
> a RB tree saving considerable time when the volumes fill up.
>
> Signed-off-by: Brian Pomerantz <bapper@gmail.com>

Nice!
Looks good so far, but this week I'm on the road.
As soon as I the have time to test it, I'll ack your patch.

Do you have some numbers?
I'm interested in how much faster the rbtree is compared to list in this case...

--
Thanks,
//richard
