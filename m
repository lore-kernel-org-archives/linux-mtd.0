Message-ID: <4FA35B73.8080008@freescale.com>
Date: Fri, 4 May 2012 12:30:43 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Subodh Nijsure <snijsure@grid-net.com>
Subject: Re: [PATCH 1/2] mtd: gpmi: add device tree support to gpmi-nand
References: <1336101182-5200-1-git-send-email-b32955@freescale.com>
 <4FA34EAD.1010302@grid-net.com>
In-Reply-To: <4FA34EAD.1010302@grid-net.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: shawn.guo@linaro.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> Any chance you can add some information on what kind of mtd tests were 
> done with this code change and on what platform?
I did bonnie++ test, and mtd_speed test on mx28evk board.
>
> Also if one wanted to test this patch say on mx28 based hardware, one 
> should apply this patch against arm-soc tree, top of the 3.5-next tree?
If you only want to test this on mx28 based hardware, you can just apply 
this patch against the arm-soc tree, top of the 3.5-next tree.
But you still need some extra mxs-dma patches (and maybe do some 
hardcode for pinctl) to make the gpmi-nand driver work.

Best Regards
Huang Shijie
