Received: from mail-wg0-f42.google.com ([74.125.82.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQd8i-0001MZ-0Q
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 13:36:08 +0000
Received: by mail-wg0-f42.google.com with SMTP id y10so603457wgg.1
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 06:35:45 -0700 (PDT)
Date: Thu, 20 Mar 2014 13:29:42 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 1/5] mtd: st_spi_fsm: Remove useless consts from function
 arguments
Message-ID: <20140320132942.GA6816@lee--X1>
References: <1395313907-25318-1-git-send-email-lee.jones@linaro.org>
 <1395313907-25318-2-git-send-email-lee.jones@linaro.org>
 <1395314713.7776.17.camel@joe-AO722>
 <20140320114123.GE21349@lee--X1>
 <1395316090.7776.24.camel@joe-AO722>
 <20140320115412.GU31517@norris-Latitude-E6410>
 <20140320120307.GA9240@lee--X1>
 <1395317630.7776.29.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1395317630.7776.29.camel@joe-AO722>
Cc: angus.clark@st.com, kernel@stlinux.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > > Good catch. That wasn't my intention.
> > > > Why?
> > An oversight.
> 
> That's still not an explanation.
> 
> Why, unless cast away by the code itself, is
> const removal a good thing?
> 
> It does serve as an indication to a reader what
> the code does with the argument.
> 
> About the only reason I can think of arguing in
> favor of removal is inconsistent application of
> const within the module.

Your qualm is not with me in this instance. I don't ever mind holding
my hands up to mistakes I make or standing up for decisions I believe
in, but in this case I'm merely satisfying the wishes of a maintainer
I'm submitting code to.

I am strongly un-opinionated about these particular changes.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
