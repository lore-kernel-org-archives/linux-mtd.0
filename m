Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VssAq-0008Iw-CR
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 10:46:48 +0000
Received: by mail-we0-f177.google.com with SMTP id u56so5764124wes.22
 for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2013 02:46:25 -0800 (PST)
Date: Tue, 17 Dec 2013 10:46:17 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Angus Clark <angus.clark@st.com>
Subject: Re: [PATCH v3 11/36] mtd: st_spi_fsm: Search for preferred FSM
 message sequence configurations
Message-ID: <20131217104617.GE19810@lee--X1>
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
 <1385727565-25794-12-git-send-email-lee.jones@linaro.org>
 <20131211010636.GH27149@ld-irv-0074.broadcom.com>
 <52B01FF2.8010801@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52B01FF2.8010801@st.com>
Cc: linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
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

> >> +/* Search for preferred configuration based on available flags */
> >> +static struct seq_rw_config *
> >> +stfsm_search_seq_rw_configs(struct stfsm *fsm,
> >> +			    struct seq_rw_config cfgs[])
> >> +{
> >> +	struct seq_rw_config *config;
> >> +	int flags = fsm->info->flags;
> >> +
> >> +	for (config = cfgs; cfgs->cmd != 0; config++)
> > 
> > This becomes an infinite loop if you can't find a matching config. You
> > probably meant 'config->cmd != 0':
> 
> I will leave Lee to defend himself on this one ;-)

No defence necessary, I think Brian's correct.

NB: You might want to take a look at the 'dirty' implementation too. ;)

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
