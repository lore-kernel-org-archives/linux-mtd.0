Message-ID: <1368429308.5360.6.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: devices: added the 16mb winbond device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: girishks2000@gmail.com
Date: Mon, 13 May 2013 10:15:08 +0300
In-Reply-To: <516d0c68.e10b420a.287d.ffff894c@mx.google.com>
References: <516d0c68.e10b420a.287d.ffff894c@mx.google.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Girish K S <ks.giri@samsung.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-04-16 at 14:01 +0530, girishks2000@gmail.com wrote:
> From: Girish K S <ks.giri@samsung.com>
> 
> added a 16mb winbond devce to the device list
> erase size = 64k and number of blocks = 256
> 
> Signed-off-by: Girish K S <ks.giri@samsung.com>

Pushed to l2-mtd.git, but please, remember to use better suffixes. E.g.,
mb may mean mega bytes, or mega bits. 16MiB device, 64KiB block size is
a lot less ambiguous way communicate the sizes.

I've amended your commit message.

-- 
Best Regards,
Artem Bityutskiy
