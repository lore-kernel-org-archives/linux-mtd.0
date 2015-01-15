Received: from mail-qg0-x231.google.com ([2607:f8b0:400d:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBmd8-0006L4-5O
 for linux-mtd@lists.infradead.org; Thu, 15 Jan 2015 15:46:42 +0000
Received: by mail-qg0-f49.google.com with SMTP id f51so12164469qge.8
 for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2015 07:46:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20150114225323.GZ9759@ld-irv-0074>
References: <1420626727-6929-1-git-send-email-festevam@gmail.com>
 <1420626727-6929-2-git-send-email-festevam@gmail.com>
 <20150109201743.GW9759@ld-irv-0074>
 <CAOMZO5BaEyU=qJfCsng+kPBcWSxb6wgJzzahgYvHn5Fqi_uoWA@mail.gmail.com>
 <20150113185153.GT9759@ld-irv-0074>
 <CAOMZO5Cy39iC0CpvO0H6i6rX6YVyns-2tZi5-vU28hCM6kgu-w@mail.gmail.com>
 <20150113215817.GW9759@ld-irv-0074>
 <BY1PR0301MB12213C4577DB849CA161F51482400@BY1PR0301MB1221.namprd03.prod.outlook.com>
 <CAOMZO5Cfe8rmsQPg1xdwwrQxsesqd1k1E80oKuiG78P77CYBcw@mail.gmail.com>
 <20150114225323.GZ9759@ld-irv-0074>
Date: Thu, 15 Jan 2015 09:46:19 -0600
Message-ID: <CA+EcR20v_k6DGFyb9yCvyLDnGXk9JSC+9odGfiWV65x7g527JA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: fsl-quadspi: Fix module unbound
From: Han Xu <xhnjupt@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "Fabio.Estevam@freescale.com" <Fabio.Estevam@freescale.com>,
 "Frank.Li@freescale.com" <Frank.Li@freescale.com>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 14, 2015 at 4:53 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Wed, Jan 14, 2015 at 06:26:38PM -0200, Fabio Estevam wrote:
>> On Tue, Jan 13, 2015 at 8:05 PM, Frank.Li@freescale.com
>> <Frank.Li@freescale.com> wrote:
>>
>> > Our QSPI driver owner Xu han (han.xu@freescale.com) will take responsibility to test and improve
>> > This driver.  I will help him to be familiar with linux kernel community work.
>>
>> That's great!
>
> Yes, it'll be great to be sure there is at least one "owner" who gets
> CC'd on these types of patches.
>
>> Could you please send a patch adding yourself as the maintainer for
>> the fsl-quadspi driver?
>
> I'd be OK with multiple developers as reviewers if more desire to do so,
> given that Xu sounds to be new to our development model. Mainly I'm

OK for me. I would love to maintain freescale qspi module and continue
improve it.

> interested in at least one developer who has access to and knowledge of
> the hardware, and who can test, review, and ack/nak patches. I'll still
> handle merging the patches, of course.
>
> Brian
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
