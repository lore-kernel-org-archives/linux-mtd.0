Received: from mail-pb0-f48.google.com ([209.85.160.48])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UGYPl-0004Cz-11
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2013 17:27:33 +0000
Received: by mail-pb0-f48.google.com with SMTP id wy12so4085256pbc.35
 for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2013 10:27:31 -0700 (PDT)
Message-ID: <514359FC.3050800@gmail.com>
Date: Fri, 15 Mar 2013 10:27:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC "v2"] mtd: nand: reintroduce NAND_NO_READRDY as
 NAND_NEED_READRDY
References: <1363193491-1843-1-git-send-email-computersforpeace@gmail.com>
 <1363257704.11441.102.camel@sauron.fi.intel.com>
 <1363258297.4853.23.camel@i7.infradead.org>
 <1363265574.4853.39.camel@i7.infradead.org>
In-Reply-To: <1363265574.4853.39.camel@i7.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Alexander Shiyan <shc_work@mail.ru>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/14/2013 05:52 AM, David Woodhouse wrote:
> On Thu, 2013-03-14 at 10:51 +0000, David Woodhouse wrote:
>>
>> I've got a couple of (unrelated) patches in linux-mtd.git which I was
>> about to send to Linus for 3.9. Let's put it on top of that and I'll
>> send the whole lot together.
>
> Alexander, please could you retest the version I've just pushed out to
> linux-mtd.git?
>
> Thanks.
>
> http://git.infradead.org/linux-mtd.git/commitdiff/5bc7c33ca

Your modified versions looks good to me. Thanks for taking this.

Brian
