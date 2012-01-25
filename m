Message-ID: <4F2016F4.2080302@mvista.com>
Date: Wed, 25 Jan 2012 17:51:32 +0300
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: "Manjunathappa, Prakash" <prakash.pm@ti.com>
Subject: Re: [PATCH v2 3/3] arm: da830: move NAND and NOR devices as aemif
 MFD slaves
References: <1327487156-10238-1-git-send-email-prakash.pm@ti.com>
 <1327487156-10238-3-git-send-email-prakash.pm@ti.com>
In-Reply-To: <1327487156-10238-3-git-send-email-prakash.pm@ti.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: davinci-linux-open-source@linux.davincidsp.com,
 Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 01/25/2012 01:25 PM, Manjunathappa, Prakash wrote:

> NAND and NOR device are made as aemif devices slave, hence device
> registration achieved via aemif MFD driver.

> Signed-off-by: Manjunathappa, Prakash<prakash.pm@ti.com>
> ---
> Since v1:
> Patch is generated using -M option.

>   arch/arm/mach-davinci/board-da830-evm.c |   31 +++++++++++++++++++++++--------
>   1 files changed, 23 insertions(+), 8 deletions(-)

    Why only this file? Don't other board files have NAND/NOR devices?

WBR, Sergei
