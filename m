Message-ID: <4A659ED4.9040702@gmail.com>
Date: Tue, 21 Jul 2009 13:56:20 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] OneNAND: Runtime badblock check support
References: <20090721025303.GA3693@july>
In-Reply-To: <20090721025303.GA3693@july>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 07/21/2009 05:53 AM, Kyungmin Park wrote:
> At bootloader, we don't need to read full page. It takes too long time.
> Instead it only read pages required for boot.
>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> ---

I do not understand the commit message. Could you please provide a better
one which explains what the patch is really doing and why.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
