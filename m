Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTaiV-0004af-B5
 for linux-mtd@lists.infradead.org; Sun, 23 Aug 2015 19:14:08 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: nand: pxa3xx_nand: add register access debug
References: <1439323034-8820-1-git-send-email-robert.jarzmik@free.fr>
 <20150818042426.GA27858@laptop> <874mjwa1w6.fsf@belgarion.home>
Date: Sun, 23 Aug 2015 21:09:31 +0200
In-Reply-To: <874mjwa1w6.fsf@belgarion.home> (Robert Jarzmik's message of
 "Tue, 18 Aug 2015 20:26:49 +0200")
Message-ID: <87r3mt3jpw.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Robert Jarzmik <robert.jarzmik@free.fr> writes:

> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
>
>> On 11 Aug 09:57 PM, Robert Jarzmik wrote:
>>> Add verbose debug for register accesses. This enables easier debugging
>>> by following where and how hardware is stimulated, and how it answers.
>>> 
>>
>> I really don't see why we want this patch. It's probably an useful hack to
>> use in some cases, but can't see why we would want it in mainline.
>>
>> Feel free to prove me wrong.
> Why not.
>
> Imagine that there is a bug in the driver, such as the one with the status bits
> clearing. You can't reproduce it, and the person who has the hardware to
> reproduce it is not skilled enough to do any debug.
>
> What are the tools and what will you ask this tester to do in order to debug and
> solve his problem, as a good driver maintainer ?
>
> Amongst the drivers I wrote in the past, this approach was the most reliable to
> capture traces to debug remotely.

Ezequiel, do you agree with my point ?

Cheers.

-- 
Robert
