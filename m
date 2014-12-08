Received: from mail-wi0-f175.google.com ([209.85.212.175])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xxyoo-0001rT-ET
 for linux-mtd@lists.infradead.org; Mon, 08 Dec 2014 13:57:43 +0000
Received: by mail-wi0-f175.google.com with SMTP id l15so4780165wiw.2
 for <linux-mtd@lists.infradead.org>; Mon, 08 Dec 2014 05:57:20 -0800 (PST)
Date: Mon, 8 Dec 2014 13:57:16 +0000
From: Peter Griffin <peter.griffin@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH v2 RESEND 02/11] mtd: st_spi_fsm: Obtain
 and use EMI clock if provided
Message-ID: <20141208135716.GC29220@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1417688512-7644-1-git-send-email-lee.jones@linaro.org>
 <1417688512-7644-3-git-send-email-lee.jones@linaro.org>
 <20141208135223.GB29220@griffinp-ThinkPad-X1-Carbon-2nd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141208135223.GB29220@griffinp-ThinkPad-X1-Carbon-2nd>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Lee,

> On Thu, 04 Dec 2014, Lee Jones wrote:
> 
> > ST's Common Clk Framework is now available. This patch ensures the FSM
> > makes use of it by obtaining and enabling the EMI clock if provided. If
> > system fails to provide the EMI clock FSM uses its original default
> > rate.
> 
> <snip>
> 
> I'm not sure I understand this patch. Now that common clock framework
> is available for STI platforms, why would the emi clock ever not be available?
> 
> If it is to maintain DT compatability then we are already breaking this with the
> syscfg 'reg' DT changes which are coming up, and this was deemed OK as the platform
> is WIP.
> 
> IMO keeping this legacy code which assumes the bootloader / JTAG has enabled and configured
> the emi clock correctly is not worth it now that CCF is available for the platform.

Also this legacy code will definately break when we we stop booting the kernel with
"clk_ignore_unused" parameter.

regards,

Peter.
