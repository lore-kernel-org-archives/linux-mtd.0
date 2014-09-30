Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYrPu-00014R-Ti
 for linux-mtd@lists.infradead.org; Tue, 30 Sep 2014 07:00:11 +0000
Message-ID: <542A54E4.2060407@nod.at>
Date: Tue, 30 Sep 2014 08:59:48 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
Subject: Re: [PATCH 4/4] UBI: Fastmap: Ensure that only one fastmap work is
 scheduled
References: <1412029248-22454-1-git-send-email-richard@nod.at>	
 <1412029248-22454-5-git-send-email-richard@nod.at>
 <1412059523.3904.11.camel@sauron.fi.intel.com>
In-Reply-To: <1412059523.3904.11.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 30.09.2014 08:45, schrieb Bityutskiy, Artem:
> On Tue, 2014-09-30 at 00:20 +0200, Richard Weinberger wrote:
>> +       spin_lock(&ubi->wl_lock);
>> +       ubi->fm_work_scheduled = 0;
>> +       spin_unlock(&ubi->wl_lock);
> 
> Andrew Morton once said me that if I am protecting an integer change
> like this with a spinlock, I have a problem in my locking design. He was
> right for my particular case.
> 
> Integer is changes atomic. The only other thing spinlock adds are the
> barriers.

I've added the spinlock to have a barrier in any case.

Thanks,
//richard
