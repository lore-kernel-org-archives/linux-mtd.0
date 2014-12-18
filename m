Received: from mail-wg0-f47.google.com ([74.125.82.47])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1klw-0001d0-7s
 for linux-mtd@lists.infradead.org; Thu, 18 Dec 2014 23:46:20 +0000
Received: by mail-wg0-f47.google.com with SMTP id n12so2995139wgh.34
 for <linux-mtd@lists.infradead.org>; Thu, 18 Dec 2014 15:45:58 -0800 (PST)
Message-ID: <549366C4.5060802@vanguardiasur.com.ar>
Date: Thu, 18 Dec 2014 20:44:04 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Dan Ehrenberg <dehrenberg@chromium.org>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4] UBI: block: Continue creating ubiblocks after an
 initialization error
References: <1418945601-27388-1-git-send-email-dehrenberg@chromium.org>
In-Reply-To: <1418945601-27388-1-git-send-email-dehrenberg@chromium.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: grundler@chromium.org, gwendal@chromium.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey Dan,

On 12/18/2014 08:33 PM, Dan Ehrenberg wrote:
> If one ubi volume is corrupted but another is not, it should be
> possible to initialize that ubiblock from a kernel commandline which
> includes both of them. This patch changes the error handling behavior
> in initializing ubiblock to ensure that all parameters are attempted
> even if one fails. If there is a failure, it is logged on dmesg.
> It also makes error messages more descriptive by including the
> name of the UBI volume that failed.
> 
> Tested: Formatted ubi volume /dev/ubi5_0 in a corrupt way and
> dev/ubi3_0 properly and included "ubi.block=5,0 ubi.block=3,0" on
> the kernel command line. At boot, I see the following in the console:
> [   21.082420] UBI error: ubiblock_create_from_param: block: can't open volume on ubi5_0, err=-19
> [   21.084268] UBI: ubiblock3_0 created from ubi3:0(rootfs)
> 
> Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
> ---
> Changes in v4:

I think you should re-send on top of linux-next. Commit
326087033108e7806e24974f2c8271f95cddaf3a has changed the way
user messages are printed.

Other than that, the patch looks good:

Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks!
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
