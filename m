Date: Thu, 20 Mar 2014 00:10:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 01/35] mtd: st_spi_fsm: Allocate resources and
 register with MTD framework
Message-ID: <20140320071026.GA31517@norris-Latitude-E6410>
References: <1392735362-1245-1-git-send-email-lee.jones@linaro.org>
 <1392735362-1245-2-git-send-email-lee.jones@linaro.org>
 <20140309053306.GL31517@norris-Latitude-E6410>
 <20140311082316.GJ2839@lee--X1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140311082316.GJ2839@lee--X1>
Cc: Angus.Clark@st.com, DCG_UPD_stlinux_kernel@list.st.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Lee,

I really can't take this patch separately. You'll need to resend the
whole series soon.

On Tue, Mar 11, 2014 at 08:23:16AM +0000, Lee Jones wrote:
> Sorry about the previous fixup misses. There were a couple of patches
> which I had failed to squash into the pack. Hopefully the rest of the
> review will go more smoothly.

Yeah... you missed a few more comments in the rest of the series too.
Can you please (for your own sake!) go through the rest of my comments
from before and see if you've missed any other important ones? I hate to
do the same work twice. The series mostly looks good, and I'd rather not
stall again for lack of attention to detail.

I'll comment on the couple of things I saw in just a bit.

Brian
