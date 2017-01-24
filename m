Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cVvzu-0005wx-D7
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2017 07:58:36 +0000
Date: Tue, 24 Jan 2017 08:58:10 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Anurag Raghavan (RBEI/ETW11)" <Raghavan.Anurag@in.bosch.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Bad block Management Patch
Message-ID: <20170124085810.29afbfaf@bbrezillon>
In-Reply-To: <8aa988fcc46c480d863cf4ee2ef40b2c@SGPMBX1023.APAC.bosch.com>
References: <8aa988fcc46c480d863cf4ee2ef40b2c@SGPMBX1023.APAC.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 24 Jan 2017 04:56:47 +0000
"Anurag Raghavan (RBEI/ETW11)" <Raghavan.Anurag@in.bosch.com> wrote:

> Hi Boris,
> 
> 
> I am using kernel version-3.0.35
> I am facing uncorrectable ECC error in ubifs. I am suspecting, it is because of bad blocks are not properly handled in my driver.
> Is there any patches available to handle the bad block in the specified version...

Is this a joke? Now you're not even adding the mailing list in Cc, and
you keep giving too few information (I don't even remember what's your
NAND controller).

I suggested that you test a mainline kernel, and you keep asking for
patches on top of a really old kernel. And by the way, don't expect us
to do your job (you can use git log and try to apply the patches that
seem relevant to you, but I clearly won't do that for you).

So please stop asking us to fix your bugs unless you start listening to
our suggestions, and the first one is to try a newer kernel (4.9 for
example).

Thanks,

Boris
