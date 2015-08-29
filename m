Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZVe3T-0001SG-SO
 for linux-mtd@lists.infradead.org; Sat, 29 Aug 2015 11:12:17 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd\@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: pxa3xx-nand: prevent DFI bus lockup on removal
References: <1440356741-24308-1-git-send-email-robert.jarzmik@free.fr>
 <20150824150847.GA8497@laptop.cereza> <87io8435q4.fsf@belgarion.home>
 <CAAEAJfDCUGDbssCkQEazcJLuvJWjbSxKDix9ts4peSZ8Xk1ZOA@mail.gmail.com>
Date: Sat, 29 Aug 2015 13:07:28 +0200
In-Reply-To: <CAAEAJfDCUGDbssCkQEazcJLuvJWjbSxKDix9ts4peSZ8Xk1ZOA@mail.gmail.com>
 (Ezequiel Garcia's message of "Fri, 28 Aug 2015 19:46:09 -0300")
Message-ID: <87pp261hfz.fsf@belgarion.home>
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

Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

> Robert,
>
> On 24 August 2015 at 15:24, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
>>
>>> Should we worry about having two definitions for the same bit?
>>> Would it be too ugly to mix the two meaning? Something like this:
>>>
>>> /* This bit has two different meanings on NFCv1 and NFCv2 */
>>> #define NDCR_STOP_ON_UNCOR_ARB_CNTL (0x1 << 19)
>> I don't find that very pretty, but if you want I can put that in the patch
>> instead.
>>
>
> Yeah, it's far from pretty.
>
> OK, another idea. How about this:
>
> #define NFCV2_NDCR_STOP_ON_UNCOR (0x1 << 19)
> #define NFCV1_NDCR_ARB_CNTL      (0x1 << 19)
This one looks much more prettier, I'll take it.

> That'll work. Feel free to send a v2.
Okay, I'm on my way.

Cheers.

-- 
Robert
