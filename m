Received: from mail-ob0-x236.google.com ([2607:f8b0:4003:c01::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZczOR-0008Ph-AJ
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 17:24:15 +0000
Received: by obbmp4 with SMTP id mp4so8171765obb.3
 for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2015 10:23:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <loom.20150918T183854-37@post.gmane.org>
References: <loom.20150918T183854-37@post.gmane.org>
Date: Fri, 18 Sep 2015 19:23:53 +0200
Message-ID: <CAFLxGvwJjy=6GLXJm=2frruO9vKqqPG_6yYxSH7HLLr47x9apg@mail.gmail.com>
Subject: Re: UBIFS corruptions on NOR-Flash
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Roshni <roshni.shah@timesys.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 18, 2015 at 6:50 PM, Roshni <roshni.shah@timesys.com> wrote:
> I have a custom board based on Freescale Vybrid Platform with a SPI-NOR
> flash S25fl128s (16MiB). When using UBIFS on this flash part, I see
> corruptions after UBIFS is mounted. See error/further below:
>
> What could be the cause of these corruptions? Any pointers / help will be
> greatly appreciated.

Well, does your board pass all MTD and UBI tests?
MTD test from the kernel and UBI tests from the mtd-utils source package.

-- 
Thanks,
//richard
