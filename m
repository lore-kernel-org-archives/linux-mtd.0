Received: from forward4h.mail.yandex.net ([2a02:6b8:0:f05::4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRGjF-0005y9-Dt
 for linux-mtd@lists.infradead.org; Tue, 09 Sep 2014 08:24:46 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: t kevin <kevint324@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
In-Reply-To: <CAOx4H9BopH3F5xwmQ-B5AckTS65SUss_mxjWi2N6ibXovnm61g@mail.gmail.com>
References: <CAOx4H9BopH3F5xwmQ-B5AckTS65SUss_mxjWi2N6ibXovnm61g@mail.gmail.com>
Subject: Re: Question about ubiformat and how to better use UBIFS
MIME-Version: 1.0
Message-Id: <3666331410251037@web21h.yandex.ru>
Date: Tue, 09 Sep 2014 12:23:57 +0400
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



04.09.2014, 16:21, "t kevin" <kevint324@gmail.com>:
> Hi ,
>
> Currently I'm trying to create ubifs for rootfs on my device which has
> a Nand flash on board.
>
> Right now I know two approaches to do that.
> 1. On host,mkfs.ubifs+ubinize to generate one ubi.img. On target
> board, ubiformat -f ubi.img on the MTD device, ubiattach then mount
> and it's done.
> or
> 2. On host, just tar -cz rootfs to generate root.tgz. On target board,
> (for the first time)ubiformat the mtd device, ubiattach,ubimkvol, then
> mount ubifs. Then untar the root.tgz to the mounted ubi volume.
>
> Eventually the mountpoint should contain same files.
>
> So here are my questions.
> 1. (Generally speaking) Which one is better? I know ubiformat is going
> to erase every PEB šso right now I prefer the second approach since I
> don't have to do ubiformat everytime. It sounds like the erase counter
> grows slower.
>
> 2. I'm working on an embedded device which has limited CPU power so
> I'd like to use compressed_method=none. It can be done by passing -x
> none to mkfs.ubifs. But I don't see similar option in ubiformat or
> ubimkvol. So when I go to the 2nd approach the mounted rootfs is
> always compressed.
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_comproff
> This method is not helping much. I want to disable compression on the
> entire fs, just like mkfs.ubifs -x none did.
>

Why do you want to do ubiformat everytime? You can prepare UBIFS image with
mkfs.ubifs and flash it with ubiupdatevol to existing UBI volume.


-- 
Regards,
Konstantin
