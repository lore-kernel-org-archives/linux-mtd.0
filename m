Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIgV9-0007Xc-Te
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 17:11:16 +0000
Received: by oihq81 with SMTP id q81so22235321oih.2
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2015 10:10:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150724165649.GH8876@google.com>
References: <1437507599-25424-1-git-send-email-Frank.Li@freescale.com>
 <1437507599-25424-4-git-send-email-Frank.Li@freescale.com>
 <20150724165649.GH8876@google.com>
Date: Fri, 24 Jul 2015 12:10:54 -0500
Message-ID: <CAHrpEqSW_WS3a5y3W521339PZDD1QJ_JozMD-vHu8Gbm=13-HQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] mtd: spi-nor: fsl-quadspi: i.MX6SX: fixed the random
 QSPI access failed issue
From: Zhi Li <lznuaa@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "Frank.Li@freescale.com" <Frank.Li@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Allen Xu <b45815@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 24, 2015 at 11:56 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Wed, Jul 22, 2015 at 03:39:56AM +0800, Frank.Li@freescale.com wrote:
>> From: Allen Xu <b45815@freescale.com>
>>
>> We found there is a low probability(5%) QSPI access timeout issue,
>> usually it happened on kernel boot stage, the first time kernel tried to
>> access QSPI chip. The READ_ID command was sent but not executed,
>> consequently the probe function failed.
>>
>> Finally we located the issue by these steps.
>>
>> 1. Since the issue happened randomly and usually it cost half day to
>> reproduce, we add more debug code in driver, to create a timeout file if
>> the issue occurred.
>>
>> 2. Prepared an autorun script to keep rebooting the system and check if
>> the timeout file existed, if the file existed, stop reboot.
>>
>> 3. The system will stop rebooting when timeout error occurred, set the
>> CCM_CCOSR register and related IOMUX to measure QPSI clock, found there
>> is no clock output, while clock output can be measured when QSPI driver
>> successfully probed.
>>
>> 4. Check the code and found QSPI clock rate was changed while not
>> disabled clock gate, most of the multiplexers on i.MX6 are glitch ones,
>> clock glitch may occurred and propagated into downstream clock dividers
>>
>> Based on the new clock flag(CLK_SET_RATE_GATE) and new framework, we
>> need to change the approach of seting clock rate. In current
>> implementation, there are several places in which the clock was touched.
>>
>> 1. probe function. prepare and enable clock before setting the QSPI
>> register, disable and unprepare the clock before exit.
>>
>> 2. nor_setup & nor_setup_last, since we change clock rate in these two
>> functions.
>>
>> 3. fsl_qspi_prep and fsl_qspi_unprep, clock was enabled only when got
>> QSPI access request.
>>
>> 4. resume function. Clock was required to restroe the setting after
>> resume, disable the clock before exit.
>>
>> Signed-off-by: Allen Xu <b45815@freescale.com>
>> Signed-off-by: Frank Li <Frank.Li@freescale.com>
>> ---
>>  drivers/mtd/spi-nor/fsl-quadspi.c | 83 +++++++++++++++++++++++++++------------
>>  1 file changed, 58 insertions(+), 25 deletions(-)
>
> [...]
>
> This patch does not apply to l2-mtd.git.

Did you try to apply below patch firstly?

[PATCH 1/1] mtd: spi-nor: fsl-qspi: dynamically map memory space for AHB read

Which branch? I can double check.

best regards
Frank Li
