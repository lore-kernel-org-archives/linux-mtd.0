Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aFj9Q-0001Zs-85
 for linux-mtd@lists.infradead.org; Sun, 03 Jan 2016 13:56:53 +0000
Subject: Re: [PATCH] ubifs: Fix error codes in ubifs_iget()
To: dedekind1@gmail.com
References: <1451772666-2139-1-git-send-email-richard@nod.at>
 <1451829092.13942.4.camel@gmail.com> <1451829283.13942.6.camel@gmail.com>
Cc: adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <56892889.6050100@nod.at>
Date: Sun, 3 Jan 2016 14:56:25 +0100
MIME-Version: 1.0
In-Reply-To: <1451829283.13942.6.camel@gmail.com>
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

Am 03.01.2016 um 14:54 schrieb Artem Bityutskiy:
> On Sun, 2016-01-03 at 15:51 +0200, Artem Bityutskiy wrote:
>> On Sat, 2016-01-02 at 23:11 +0100, Richard Weinberger wrote:
>>> We cannot use positive error codes in ERR_PTR().
>>> IS_ERR() won't catch them.
>>
>> Right, but why there is a "err = -EINVAL;" when at 'out_invalid'.
> 
> Sorry Richard, I edited the sentence and did not notice it was messy.
> 
> Here is what I wanted to say: right, but there is a "err = -EINVAL' at
> the end of 'out_invalid'.

Oh, you're right. I've missed this somehow.
Let's ignore this patch. :)

Thanks,
//richard
