Received: from mail-wi0-f179.google.com ([209.85.212.179])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQbM5-00056V-Q6
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 11:41:50 +0000
Received: by mail-wi0-f179.google.com with SMTP id f8so634722wiw.0
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 04:41:28 -0700 (PDT)
Date: Thu, 20 Mar 2014 11:41:23 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 1/5] mtd: st_spi_fsm: Remove useless consts from function
 arguments
Message-ID: <20140320114123.GE21349@lee--X1>
References: <1395313907-25318-1-git-send-email-lee.jones@linaro.org>
 <1395313907-25318-2-git-send-email-lee.jones@linaro.org>
 <1395314713.7776.17.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1395314713.7776.17.camel@joe-AO722>
Cc: angus.clark@st.com, kernel@stlinux.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 Mar 2014, Joe Perches wrote:

> On Thu, 2014-03-20 at 11:11 +0000, Lee Jones wrote:
> > Reported-by: Brian Norris <computersforpeace@gmail.com>
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> Why are these useless?
> 
> Even if the object code produced is the same,
> these serve as information to the human reader
> about how the arguments are used.

https://lkml.org/lkml/2014/3/20/69

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
