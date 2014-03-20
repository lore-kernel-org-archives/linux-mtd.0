Message-ID: <1395316090.7776.24.camel@joe-AO722>
Subject: Re: [PATCH 1/5] mtd: st_spi_fsm: Remove useless consts from
 function arguments
From: Joe Perches <joe@perches.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Thu, 20 Mar 2014 04:48:10 -0700
In-Reply-To: <20140320114123.GE21349@lee--X1>
References: <1395313907-25318-1-git-send-email-lee.jones@linaro.org>
 <1395313907-25318-2-git-send-email-lee.jones@linaro.org>
 <1395314713.7776.17.camel@joe-AO722> <20140320114123.GE21349@lee--X1>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Thu, 2014-03-20 at 11:41 +0000, Lee Jones wrote:
> On Thu, 20 Mar 2014, Joe Perches wrote:
> 
> > On Thu, 2014-03-20 at 11:11 +0000, Lee Jones wrote:
> > > Reported-by: Brian Norris <computersforpeace@gmail.com>
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > 
> > Why are these useless?
> > 
> > Even if the object code produced is the same,
> > these serve as information to the human reader
> > about how the arguments are used.
> 
> https://lkml.org/lkml/2014/3/20/69
> 

>From that email:

suggestion:

	const uint8_t *const buf  => const uint8_t *buf
	const uint32_t size       => uint32_t size
	const uint32_t offset     => uint32_t offset

What was done:

-static int stfsm_write_fifo(struct stfsm *fsm,
-                           const uint32_t *buf, const uint32_t size)
+static int stfsm_write_fifo(struct stfsm *fsm, uint32_t *buf, uint32_t size)

Note the removal of the const from uint32_t *buf

Why?
