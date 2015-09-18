Received: from mail-io0-x22b.google.com ([2607:f8b0:4001:c06::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zd0GN-0005c1-KK
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 18:20:00 +0000
Received: by iofb144 with SMTP id b144so65432146iof.1
 for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2015 11:19:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <loom.20150918T183854-37@post.gmane.org>
References: <loom.20150918T183854-37@post.gmane.org>
Date: Fri, 18 Sep 2015 15:19:38 -0300
Message-ID: <CAOMZO5Bf6QjNVa1W=8ognoWRnG2Ct2W8Xs4++-7OMOLR6dikiA@mail.gmail.com>
Subject: Re: UBIFS corruptions on NOR-Flash
From: Fabio Estevam <festevam@gmail.com>
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

On Fri, Sep 18, 2015 at 1:50 PM, Roshni <roshni.shah@timesys.com> wrote:
> Hi,
>
> I have a custom board based on Freescale Vybrid Platform with a SPI-NOR
> flash S25fl128s (16MiB). When using UBIFS on this flash part, I see
> corruptions after UBIFS is mounted. See error/further below:
>
> What could be the cause of these corruptions? Any pointers / help will be
> greatly appreciated.
>
> Thanks a lot,
> Roshni
>
> Kernel Version - 3.13

Does the problem also happen on 4.2 or 4.3-rc1?
