MIME-Version: 1.0
In-Reply-To: <1329448957-9756-1-git-send-email-b32955@freescale.com>
References: <1329448957-9756-1-git-send-email-b32955@freescale.com>
Date: Fri, 17 Feb 2012 21:46:39 -0800
Message-ID: <CAN8TOE944-3W5=oXAG2bnqGZygSn6ALznRPDXsHJxnLdVssiXg@mail.gmail.com>
Subject: Re: [PATCH] mtd : change the location of the ONFI detected log
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: artem.bityutskiy@intel.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, ffainelli@freebox.fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 16, 2012 at 7:22 PM, Huang Shijie <b32955@freescale.com> wrote:
> Some strange nand chip(such as Hynix H27UBG8T2A) can pass the `ONFI` signature
> check. So the log can be printed out even it is not an ONFI nand indeed.
>
> Change this log to the end of the function. Print out the log only when we
> really detect an ONFI nand.
>
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Acked-by: Brian Norris <computersforpeace@gmail.com>
