Message-ID: <1395319485.7776.32.camel@joe-AO722>
Subject: Re: [PATCH 1/5] mtd: st_spi_fsm: Remove useless consts from
 function arguments
From: Joe Perches <joe@perches.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 20 Mar 2014 05:44:45 -0700
In-Reply-To: <CAN8TOE9g2VwVgVx1Sj3OcguuwP_A9pJS+WpgTAL49KyN9r1CiA@mail.gmail.com>
References: <1395313907-25318-1-git-send-email-lee.jones@linaro.org>
 <1395313907-25318-2-git-send-email-lee.jones@linaro.org>
 <1395314713.7776.17.camel@joe-AO722> <20140320114123.GE21349@lee--X1>
 <1395316090.7776.24.camel@joe-AO722>
 <20140320115412.GU31517@norris-Latitude-E6410>
 <20140320120307.GA9240@lee--X1> <1395317630.7776.29.camel@joe-AO722>
 <CAN8TOE9g2VwVgVx1Sj3OcguuwP_A9pJS+WpgTAL49KyN9r1CiA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Angus CLARK <angus.clark@st.com>, kernel@stlinux.com,
 Lee Jones <lee.jones@linaro.org>, Linux Kernel <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-03-20 at 05:41 -0700, Brian Norris wrote:
> I also don't think that a function parameter is the right place to
> mark const like this. Function arguments are always pass-by-value, so
> this 'const' tells users (callers) nothing useful. It only provides
> useless constraints on what the function can do with its copy of the
> parameter.

Again, that's not useless information.

And as you've seen, just making these changes
can be error prone.
