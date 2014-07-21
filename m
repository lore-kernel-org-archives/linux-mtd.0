Received: from nasmtp02.atmel.com ([204.2.163.16] helo=SJOEDG01.corp.atmel.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X97AJ-0007lH-9y
 for linux-mtd@lists.infradead.org; Mon, 21 Jul 2014 06:33:39 +0000
Message-ID: <53CCB427.3090400@atmel.com>
Date: Mon, 21 Jul 2014 14:33:11 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: reduce the warning noise when the ECC is too
 weak
References: <1404306992-28968-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140714052259.GD29385@norris-Latitude-E6410> <53C8F011.7020507@atmel.com>
 <20140718165430.GY7537@ld-irv-0074>
In-Reply-To: <20140718165430.GY7537@ld-irv-0074>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 Nadav Haklai <nadavh@marvell.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Brian

On 7/19/2014 12:54 AM, Brian Norris wrote:
> On Fri, Jul 18, 2014 at 05:59:45PM +0800, Josh Wu wrote:
>> On 7/14/2014 1:22 PM, Brian Norris wrote:
>>> Pushed to linux-mtd.git, for 3.16 I think. Thanks!
>> Excuse me that to ask a question which is not related with the code.
>>
>> I find this fix is not in l2-mtd.git but only in linux-mtd.git. So I
>> wondering how the patch is merged in linux mainline and stable tree.
>>
>> Will the linux-mtd.git be merged in linux mainline and stable git
>> tree before v3.16 release? So the l2-mtd.git can rebase on the
>> merged tag.
> I'm still working out what the *best* process is, but linux-mtd.git is
> used as the official tree for pull requests to Linus, and I try hard to
> make sure it doesn't need rebased. l2-mtd.git has historically served a
> little more of a staging role, allowing rebases and is typically aimed
> for the next merge window.
>
> In this case, I specifically applied the patch to linux-mtd.git since I
> planned to (and did, already) send it to Linus for 3.16.
yes. I see the pull request.

> I will probably
> merge it back into l2-mtd.git soon, to keep the 'next' tree (l2-mtd.git)
> up-to-date.
>
> If you're looking to send patches for -next, please use l2-mtd.git (or
> even linux-next.git).
Thank you very much for the clear information. That's helpful.

>
> NB: linux-mtd.git and l2-mtd.git are both in linux-next. Perhaps
> l2-mtd.git should be in MAINTAINERS?
yes, I think so. The l2-mtd.git is used more often. It should be in 
MAINTAINERS as well.

>
> Regards,
> Brian
Best Regards,
Josh Wu
