Received: from mail-we0-x230.google.com ([2a00:1450:400c:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVEtc-0008Vq-MO
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2015 07:48:09 +0000
Received: by wevk48 with SMTP id k48so34287187wev.5
 for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2015 00:47:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150309230250.GA13266@ld-irv-0074>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
 <1425418844-25177-2-git-send-email-fransklaver@gmail.com>
 <20150309230250.GA13266@ld-irv-0074>
Date: Tue, 10 Mar 2015 08:47:46 +0100
Message-ID: <CAH6sp9P0mfhK3kq-uD-J2f_uCinKzuircAh7gOs354g98B6qAg@mail.gmail.com>
Subject: Re: [PATCH 01/60] mtd: core: tone down suggestion that dev.parent
 should be set
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 10, 2015 at 12:14 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Tue, Mar 03, 2015 at 10:39:45PM +0100, Frans Klaver wrote:
>> add_mtd_device() has a comment suggesting that the caller should have
>> set dev.parent. This is required to have the device show up in sysfs,
>
> What do you mean "have the device show up in sysfs"? AFAICT, this only
> has bearing on whether the *parent* device shows up as a sysfs symlink
> within the MTD device directory. i.e.:
>
>    /sys/class/mtd/mtd*/device
>
> For instance, this sort of symlink:
>
>    /sys/class/mtd/mtd0/device -> ../../../f03e2800.nand
>
> It might be good to clarify this in the commit message, since you make
> the problem sound worse than (I think) it is.

I do? That was definitely not my intention. I'll look into it.

Thanks,
Frans
