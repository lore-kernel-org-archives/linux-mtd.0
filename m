Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSJYW-0000oi-C4
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 06:42:33 +0000
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, linux-mtd@lists.infradead.org
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
 <55D542C5.6040500@cn.fujitsu.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <55D576BE.5040207@nod.at>
Date: Thu, 20 Aug 2015 08:42:06 +0200
MIME-Version: 1.0
In-Reply-To: <55D542C5.6040500@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yang, (Sorry if I've used your last name lately)

Am 20.08.2015 um 05:00 schrieb Dongsheng Yang:
> On 08/20/2015 04:35 AM, Richard Weinberger wrote:
>> Currently UBIFS does not support direct IO, but some applications
>> blindly use the O_DIRECT flag.
>> Instead of failing upon open() we can do better and fall back
>> to buffered IO.
> 
> Hmmmm, to be honest, I am not sure we have to do it as Dave
> suggested. I think that's just a work-around for current fstests.
> 
> IMHO, perform a buffered IO when user request direct IO without
> any warning sounds not a good idea. Maybe adding a warning would
> make it better.

Well, how would you inform the user?
A printk() to dmesg is useless are the vast majority of open()
callers do not check dmesg... :)

Major filesystems implement ->direct_IO these days and having
a "return 0"-stub seems to be legit.
For example exofs does too. So, I really don't consider it a work around.

> I think we need more discussion about AIO&DIO in ubifs, and actually
> I have a plan for it. But I have not listed the all cons and pros of
> it so far.

Sure, having a real ->direct_IO would be be best solution.
My patch won't block this.

Thanks,
//richard
