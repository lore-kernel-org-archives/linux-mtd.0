Received: from forward5h.mail.yandex.net ([2a02:6b8:0:f05::5])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbwYB-0007T1-EK
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2013 18:00:57 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
In-Reply-To: <20131031150844.GA1092@localhost>
References: <72811383227314@web24j.yandex.ru> <20131031150844.GA1092@localhost>
Subject: Re: Flashing UBIFS image to gluebi mtd
MIME-Version: 1.0
Message-Id: <16161383242430@web27h.yandex.ru>
Date: Thu, 31 Oct 2013 22:00:30 +0400
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



31.10.2013, 19:08, "Ezequiel Garcia" <ezequiel.garcia@free-electrons.com>:
> Hi Konstantin,
>
> On Thu, Oct 31, 2013 at 05:48:34PM +0400, Konstantin Tokarev wrote:
>
>> šI'm migrating rootfs of device from SquashFS on top of gluebi to UBIFS.
>
> Sounds like you could use ubiblock for that setup, which is suitable
> for squashfs, and completely independent of ubifs (thus less cpu and
> memory hungry and easier to setup).

Could you elaborate this a bit more? Do you mean that block device emultaion
layer on top of UBI + FS on top of that can work faster than UBIFS on top of
UBI?

Btw, I'm more interested in finding out in what way my UBIFS volume can be
broken in given scenario and how can I detect it (to reflash once again,
using UBI-aware updater this time).

-- 
Regards,
Konstantin
