Received: from mail-wi0-f170.google.com ([209.85.212.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9gxL-0006Xj-4l
 for linux-mtd@lists.infradead.org; Fri, 09 Jan 2015 21:18:57 +0000
Received: by mail-wi0-f170.google.com with SMTP id bs8so4635637wib.1
 for <linux-mtd@lists.infradead.org>; Fri, 09 Jan 2015 13:18:32 -0800 (PST)
Message-ID: <54B04529.8060705@vanguardiasur.com.ar>
Date: Fri, 09 Jan 2015 18:16:25 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Dan Ehrenberg <dehrenberg@chromium.org>,
 ezequiel@vanguardiasur.com.ar, richard.weinberger@gmail.com,
 gwendal@chromium.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v5] UBI: block: Continue creating ubiblocks after an
 initialization error
References: <1419017238-28809-1-git-send-email-dehrenberg@chromium.org>
In-Reply-To: <1419017238-28809-1-git-send-email-dehrenberg@chromium.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: grundler@chromium.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/19/2014 04:27 PM, Dan Ehrenberg wrote:
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

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
