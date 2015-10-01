Received: from mail-ig0-x22b.google.com ([2607:f8b0:4001:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhcZB-00069Y-La
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2015 12:02:32 +0000
Received: by igcpb10 with SMTP id pb10so16175436igc.1
 for <linux-mtd@lists.infradead.org>; Thu, 01 Oct 2015 05:02:08 -0700 (PDT)
MIME-Version: 1.0
Sender: linus971@gmail.com
In-Reply-To: <560A6D29.6060402@nod.at>
References: <560A6D29.6060402@nod.at>
Date: Thu, 1 Oct 2015 08:02:08 -0400
Message-ID: <CA+55aFwctc0y7yb4Nzf+L-Lp__DZeJHHdpUiJke-6A+Y-eJ79Q@mail.gmail.com>
Subject: Re: [GIT PULL] UBI/UBIFS fixes for 4.3-rc4
From: Linus Torvalds <torvalds@linux-foundation.org>
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 29, 2015 at 6:51 AM, Richard Weinberger <richard@nod.at> wrote:
>
>   git://git.infradead.org/linux-ubifs.git tags/upstream-4.3-rc4

Hmm. Signed with a key that you haven't used before. That key is
signed with the key you _used_ to use, so it all looks fine, but
things like this make me go check.

It would be good if people mentioned key changes so that they don't
take me by surprise, but I guess it's not a big deal.

             Linus
