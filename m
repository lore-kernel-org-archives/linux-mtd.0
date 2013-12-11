Received: from mail-yh0-f45.google.com ([209.85.213.45])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqfTz-0003Nl-JV
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2013 08:49:29 +0000
Received: by mail-yh0-f45.google.com with SMTP id v1so4823328yhn.32
 for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2013 00:49:03 -0800 (PST)
Date: Wed, 11 Dec 2013 08:48:56 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>, angus.clark@st.com
Subject: Re: [PATCH v3 01/36] mtd: st_spi_fsm: Allocate resources and
 register with MTD framework
Message-ID: <20131211084856.GF2390@lee--X1>
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
 <1385727565-25794-2-git-send-email-lee.jones@linaro.org>
 <20131210204635.GD27149@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131210204635.GD27149@ld-irv-0074.broadcom.com>
Cc: linux-mtd@lists.infradead.org, linus.walleij@linaro.org,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Thank you for taking the time to review, it's very much appreciated.
You bought out some interesting points that I'm happy to go away and
rectify. Firstly however, as I inherited this code I'd like to give
Angus a chance to comment before we go off on our own tangent and
rework some of the good code which perhaps should remain unchanged.

Angus, do you have enough time to go through Brian's review comments
and perhaps reply to the ones that you feel would benefit from your
expert knowledge. To be frank, some of the questions that were asked I
wouldn't be able to answer without your guidance in any case.

Thanks both.

Kind regards,
Lee

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
