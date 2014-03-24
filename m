Received: from mail-we0-f181.google.com ([74.125.82.181])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WS4sP-00080t-Jg
 for linux-mtd@lists.infradead.org; Mon, 24 Mar 2014 13:25:18 +0000
Received: by mail-we0-f181.google.com with SMTP id q58so3444699wes.12
 for <linux-mtd@lists.infradead.org>; Mon, 24 Mar 2014 06:24:51 -0700 (PDT)
Date: Mon, 24 Mar 2014 13:24:46 +0000
From: Lee Jones <lee.jones@linaro.org>
To: computersforpeace@gmail.com
Subject: New NAND driver
Message-ID: <20140324132446.GA21665@lee--X1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: angus.clark@st.com, dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Firstly I'd like to thank you for supporting the inclusion of ST's SPI
NOR (FSM) driver. As promised I will convert it over to the new
framework once it has been applied by your good self.

In the meantime however, I have a NAND driver which I need to
submit. I wanted to give you a heads-up prior to sending it in case
you had any special requests. FYI: Shoving it where the sun don't
shine, is not a valid request by the way :). It's 2700 lines and I've
split it over 47 patches for reviewing purposes.

Sorry to do this to you Brian, I am sensitive to how over-burdened you
are with the subsystem already. Perhaps it might make sense to put out
a plea for volunteers to help with maintain MTD subsystem on LKML?

Anyway, what's the best thing to do in this instance? Should I just
send it to the list as an RFC and be done with it?

Kind regards,
Lee

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
