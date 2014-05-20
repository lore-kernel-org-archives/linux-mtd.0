Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wmrgw-0001iC-9H
 for linux-mtd@lists.infradead.org; Tue, 20 May 2014 21:35:22 +0000
Date: Tue, 20 May 2014 18:34:27 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Helmut Schaa <helmut.schaa@googlemail.com>
Subject: Re: [PATCH] mtd-utils: Fix incompatibility with kernel UBI block
 ioctls
Message-ID: <20140520213426.GA12318@arch.cereza>
References: <1400597820-6589-1-git-send-email-helmut.schaa@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1400597820-6589-1-git-send-email-helmut.schaa@googlemail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Helmut,

On 20 May 04:57 PM, Helmut Schaa wrote:
> The kernel UBI block ioctl definition is out of sync with the one
> in mtd-utils resulting in ubiblock being unusable on current kernels.
> 

Which version are you taking as "current". The ioctl parameter is actually
an improvement over the first parameter-less implementation, so this patch
makes no sense.

Take a look at:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=463c5eedb4a13b9aa91f05498a0f2c20bd03f8c4

Maybe you have some old kernel or maybe you've backported this feature and you
are using some internal version?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
