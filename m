Message-ID: <4A810DE4.7030202@gmail.com>
Date: Tue, 11 Aug 2009 09:21:24 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: vimal singh <vimal.newwork@gmail.com>
Subject: Re: [PATCH-v3 1:2] [MTD][NAND]omap: Adding support for nand
	prefetch-read and post-write, in MPU mode.
References: <61339.192.168.10.89.1247226725.squirrel@dbdmail.itg.ti.com>
	<48097.192.168.10.89.1247232736.squirrel@dbdmail.itg.ti.com>
	<60361.192.168.10.89.1247482584.squirrel@dbdmail.itg.ti.com>
	<20090810162734.GH1938@atomide.com>
	<ce9ab5790908102245r28224bf5nfa2a1b22267767fe@mail.gmail.com>
In-Reply-To: <ce9ab5790908102245r28224bf5nfa2a1b22267767fe@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: vimal singh <vimalsingh@ti.com>, Tony Lindgren <tony@atomide.com>,
	linux-kernel@vger.kernel.org, david-b@pacbell.net,
	dedekind@infradead.org, linux-mtd@lists.infradead.org,
	linux-omap@vger.kernel.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/11/2009 08:45 AM, vimal singh wrote:
> On Mon, Aug 10, 2009 at 9:57 PM, Tony Lindgren<tony@atomide.com>  wrote:
>> * vimal singh<vimalsingh@ti.com>  [090713 13:56]:
>>> Patch updated for ' ioreadX / iowriteX and ioreadX_rep / iowriteX_rep' as per
>>> David Brownell's comment. I updated 'omap_(read/write)_buf16' fucntions also
>>> for this.
>>>
>>> -vimal
>>>
>>> This patch adds prefetch support to access nand flash in mpu mode.
>>> This patch also adds 8-bit nand support (omap_read/write_buf8).
>>> Prefetch can be used for both 8- and 16-bit devices.
>>>
>>> Signed-off-by: Vimal Singh<vimalsingh@ti.com>
>> Sorry for the delay. I've looked at the GPMC part, and that now looks OK
>> to me. So I'm OK for this to get integrated via the MTD list.
>>
>> Acked-by: Tony Lindgren<tony@atomide.com>
>>
>
> Can you give your ack to below patch too?
>
> http://lists.infradead.org/pipermail/linux-mtd/2009-July/026373.html

I've picked up both of your patches, please, check:
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/33f48f597315842f39427ee4261cbf82a9afeaf3
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/b67d52c91b26e97f981f2c292619d31667d5b272

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
