Received: from mail-wg0-f53.google.com ([74.125.82.53])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXeEO-0004ry-6y
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 23:15:32 +0000
Received: by wgbcc7 with SMTP id cc7so52041486wgb.0
 for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2015 16:15:06 -0700 (PDT)
Message-ID: <55076362.7040705@vanguardiasur.com.ar>
Date: Mon, 16 Mar 2015 20:12:34 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Dan Ehrenberg <dehrenberg@chromium.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] UBI: block: Add option for dynamic minor number
References: <1426539315-17392-1-git-send-email-dehrenberg@chromium.org>
In-Reply-To: <1426539315-17392-1-git-send-email-dehrenberg@chromium.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, gwendal@chromium.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Adding UBI maintainers)

On 03/16/2015 05:55 PM, Dan Ehrenberg wrote:
> This patch adds a new config option, MTD_UBI_BLOCK_DYNAMIC_MINOR, which
> makes minor numbers dynamically allocated for ubiblock devices, starting
> at 0.
> 
> From the new Kconfig:
>     This option makes ubiblock devices have minor numbers beginning from
>     0, allocated dynamically independently of the ubi device/volume
>     number. For users who don't refer to an ubiblock device directly by
>     the major:minor number (e.g., with udev and/or devtmpfs), this option
>     is useful if the device number is rather high (>1) and when executing
>     on a 32-bit platform without LFS enabled in all userspace binaries.
> 

Hm, I'm wondering if there are any users relying on a specific minor.

I'm not fond of the new option, and I'm not fond of the ifdefs you bring
in. Can't we just change minors to be dynamic?
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
