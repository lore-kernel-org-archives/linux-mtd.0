Received: from mail-qg0-f47.google.com ([209.85.192.47])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1vRN-00030e-5f
 for linux-mtd@lists.infradead.org; Fri, 19 Dec 2014 11:09:49 +0000
Received: by mail-qg0-f47.google.com with SMTP id q108so464706qgd.34
 for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2014 03:09:27 -0800 (PST)
Message-ID: <549406F3.7000605@vanguardiasur.com.ar>
Date: Fri, 19 Dec 2014 08:07:31 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>,
 Daniel Ehrenberg <dehrenberg@google.com>
Subject: Re: [PATCH v4] UBI: block: Continue creating ubiblocks after an
 initialization error
References: <1418945601-27388-1-git-send-email-dehrenberg@chromium.org>	<549366C4.5060802@vanguardiasur.com.ar>	<CAAK6Zt3xuzVO+wZL9Ee4rLrmiqYUKGqb6uXgto482zWjUoftYg@mail.gmail.com>
 <CAFLxGvyLC7QakDV+OB+PeT96W87KDuk0-OjP4vSuBfza2SiZ5g@mail.gmail.com>
In-Reply-To: <CAFLxGvyLC7QakDV+OB+PeT96W87KDuk0-OjP4vSuBfza2SiZ5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: Grant Grundler <grundler@chromium.org>,
 Gwendal Grignou <gwendal@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 12/19/2014 04:16 AM, Richard Weinberger wrote:
> On Fri, Dec 19, 2014 at 1:52 AM, Daniel Ehrenberg <dehrenberg@google.com> wrote:
>> On Thu, Dec 18, 2014 at 3:44 PM, Ezequiel Garcia
>> <ezequiel@vanguardiasur.com.ar> wrote:
>>> I think you should re-send on top of linux-next. Commit
>>> 326087033108e7806e24974f2c8271f95cddaf3a has changed the way
>>> user messages are printed.
>>>
>>> Other than that, the patch looks good:
>>>
>>> Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>>
>> Hi,
>>
>> When you say linux-next, do you mean Linus's linux-next?

This is what I meant:
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

> I had based
>> my patch on linux-mtd.git's master branch (based on what I saw at
>> http://www.linux-mtd.infradead.org/source.html#kernelversions) but
>> apparently that doesn't include the patch you mention, whereas Linus
>> does have it. Is Linus's linux-next where to find the most up-to-date
>> version of the MTD code, or is there another repository that includes
>> bleeding-edge stuff?
> 
> You want the most current UBI stuff. :-)
> git://git.infradead.org/linux-ubifs.git
> 

Exactly. MTD and UBI/UBIFS are different subsystems with different trees
and maintainers.

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
