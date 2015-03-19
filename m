Received: from mail-wi0-f176.google.com ([209.85.212.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYbdd-0001ky-DB
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2015 14:41:34 +0000
Received: by wixw10 with SMTP id w10so71229712wix.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Mar 2015 07:41:10 -0700 (PDT)
Message-ID: <550ADF6C.3090408@vanguardiasur.com.ar>
Date: Thu, 19 Mar 2015 11:38:36 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Dan Ehrenberg <dehrenberg@chromium.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v3] UBI: block: Dynamically allocate minor numbers
References: <1426613846-36598-1-git-send-email-dehrenberg@chromium.org>
In-Reply-To: <1426613846-36598-1-git-send-email-dehrenberg@chromium.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: gwendal@chromium.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 03/17/2015 02:37 PM, Dan Ehrenberg wrote:
> This patch makes ubiblock devices have minor numbers beginning from
> 0, allocated dynamically independently of the ubi device/volume
> number. This property becomes useful because, on 32-bit architectures
> with LFS turned off in a userspace program, device minor numbers
> over 8 bits cause stat to return -EOVERFLOW. If the device number is
> high (>1) due to multiple MTD partitions, such an overflow will occur.
> While enabling LFS is clearly a nicer solution, it's often difficult
> to turn on in practice globally as many widely distributed packages
> don't work with LFS on.
> 
> Other storage systems have their own workarounds, with SCSI making
> multiple device majors and MMC having a config option for the number
> of partitions per device. A completely dynamic minor numbering is
> simpler than these. It is unlikely that anyone is depending on a
> static minor number since the major is dynamic anyway. In addition,
> ubiblock is still relatively new, so now is the time to make such
> changes.
> 
> Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
> 

Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
