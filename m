Received: from mail-vc0-x22e.google.com ([2607:f8b0:400c:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xcc7c-00035E-OB
 for linux-mtd@lists.infradead.org; Fri, 10 Oct 2014 15:28:49 +0000
Received: by mail-vc0-f174.google.com with SMTP id hq12so2875848vcb.33
 for <linux-mtd@lists.infradead.org>; Fri, 10 Oct 2014 08:28:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <d4a8ef19-1bb5-4d81-9b04-ca9886e7f209@email.android.com>
References: <d4a8ef19-1bb5-4d81-9b04-ca9886e7f209@email.android.com>
Date: Fri, 10 Oct 2014 17:28:26 +0200
Message-ID: <CAFLxGvzbpjgt4EzUiWW3eqZLb8Eyz8vMJYrcdLvs2sS-kiFEBg@mail.gmail.com>
Subject: Re: How do I know my UBI/UBIFS code version?
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Woody Wu <narkewoody@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 10, 2014 at 4:57 PM, Woody Wu <narkewoody@gmail.com> wrote:
> I am running ubi/ubifs on a ported ARM linux 3.1.x.  How do I get know my ubi/ubifs version? In additional, if I found the version are too old, could I simply copy a newer version source files to my 3.1 ARM linux tree?

Ported in terms of utterly broken by a SoC vendor? ;-)
If your kernel version is v3.1 then also UBI and UBIFS is v3.1 unless
someone messed with it.
To find out you need to consult the changelog.

And no, you cannot simply copy&paste the sources files between kernel
releases as the internal kernel API is
a moving target.

-- 
Thanks,
//richard
