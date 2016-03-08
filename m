Received: from mail-qg0-x22b.google.com ([2607:f8b0:400d:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adPiE-0000QZ-HQ
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2016 22:02:43 +0000
Received: by mail-qg0-x22b.google.com with SMTP id t4so25488972qge.0
 for <linux-mtd@lists.infradead.org>; Tue, 08 Mar 2016 14:02:22 -0800 (PST)
Subject: Re: [PATCH 2/3] mtd: mediatek: driver for MTK Smart Device Gen1 NAND
To: Brian Norris <computersforpeace@gmail.com>
References: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1456938013-8819-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160308172437.6eccce05@bbrezillon> <20160308181715.GJ55664@google.com>
 <56DF3141.9040208@linaro.org> <20160308202036.GL55664@google.com>
 <56DF3CC8.7070400@linaro.org> <20160308212240.GM55664@google.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 dwmw2@infradead.org, matthias.bgg@gmail.com, robh@kernel.org,
 daniel.thompson@linaro.org, xiaolei.li@mediatek.com,
 linux-mtd@lists.infradead.org
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Message-ID: <56DF4BEB.4080907@linaro.org>
Date: Tue, 8 Mar 2016 17:02:19 -0500
MIME-Version: 1.0
In-Reply-To: <20160308212240.GM55664@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/08/2016 04:22 PM, Brian Norris wrote:
> Hi Jorge,
>
> On Tue, Mar 08, 2016 at 03:57:44PM -0500, Jorge Ramirez-Ortiz wrote:
>> On 03/08/2016 03:20 PM, Brian Norris wrote:
>>>>> If you feel strongly about it I don't mind adding an additional check after any
>>>>> form of sleep (not so sure about adding it after a cpu_relax) but I don't think
>>>>> it is needed.
>>> It is non-negotiable that your timeout loops must be logically correct.
>>> That is, you must recheck the exit condition before you declare a
>>> timeout.
>

of course agreed. you/Boris are absolutely right: I was missing the last check
that the macro does (I didnt notice it when I grepped the implementation). 
